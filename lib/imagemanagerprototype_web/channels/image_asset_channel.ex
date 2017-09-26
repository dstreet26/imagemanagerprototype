defmodule ImagemanagerprototypeWeb.ImageAssetChannel do
  use ImagemanagerprototypeWeb, :channel

  def join("image_asset:lobby", payload, socket) do
    if authorized?(payload) do
      send(self(), :after_join)
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  def join("image_asset:" <> image_asset_id, payload, socket) do
    {:ok, "Joined image_asset:#{image_asset_id}", socket}
  end
  
  def handle_info(:after_join, socket) do
    Presence.track(socket, socket.assigns.user_id, %{
      online_at: :os.system_time(:milli_seconds)
    })
    push socket, "presence_state", Presence.list(socket)
    {:noreply, socket}
  end
  # # Channels can be used in a request/response fashion
  # # by sending replies to requests from the client
  # def handle_in("ping", payload, socket) do
  #   {:reply, {:ok, payload}, socket}
  # end

  # # It is also common to receive messages from the client and
  # # broadcast to everyone in the current topic (image_asset:lobby).
  # def handle_in("shout", payload, socket) do
  #   broadcast socket, "shout", payload
  #   {:noreply, socket}
  # end


def broadcast_change(comment_params,current_user_id,image_asset_id) do
  user = Imagemanagerprototype.Accounts.get_user!(current_user_id)
  timestamp = DateTime.utc_now()

  payload = %{
    "comment" => comment_params["comment"],
    "user_name" => user.username,
    "inserted_at" => timestamp
  }

  ImagemanagerprototypeWeb.Endpoint.broadcast("image_asset:#{image_asset_id}", "change", payload)
end

   def handle_out(event, payload, socket) do
    push socket, event, payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
