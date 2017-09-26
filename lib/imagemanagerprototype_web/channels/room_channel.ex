defmodule ImagemanagerprototypeWeb.RoomChannel do
  use ImagemanagerprototypeWeb, :channel
  alias ImagemanagerprototypeWeb.Presence

  # def join("room:lobby", payload, socket) do
  #   if authorized?(payload) do
  #     {:ok, socket}
  #   else
  #     {:error, %{reason: "unauthorized"}}
  #   end
  # end


  def join("room:lobby", params, socket) do
    # IO.puts "PARAMS"
    # IO.inspect params

    # IO.puts "SOCKET"
    # IO.inspect socket


    send(self(), :after_join)

    # {:ok, assign(socket, :user_id)}
    {:ok, socket}
    # {:ok, assign(socket, :user_id)}
    # {:ok, assign(socket, :user_id, params["user_id"])}
  end

  # def handle_info(:after_join, socket) do
  #   push socket, "presence_state", Presence.list(socket)
  #   {:ok, _} = Presence.track(socket, socket.assigns.user_id, %{
  #     online_at: inspect(System.system_time(:seconds))
  #   })
  #   {:noreply, socket}
  # end

  def handle_info(:after_join, socket) do
    Presence.track(socket, socket.assigns.user_id, %{
      online_at: :os.system_time(:milli_seconds)
    })
    push socket, "presence_state", Presence.list(socket)
    {:noreply, socket}
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (room:lobby).
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end



