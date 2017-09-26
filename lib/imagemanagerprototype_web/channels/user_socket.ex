defmodule ImagemanagerprototypeWeb.UserSocket do
  use Phoenix.Socket

  ## Channels
  channel "room:*", ImagemanagerprototypeWeb.RoomChannel
  channel "image_asset:*", ImagemanagerprototypeWeb.ImageAssetChannel

  ## Transports
  transport :websocket, Phoenix.Transports.WebSocket
  # transport :longpoll, Phoenix.Transports.LongPoll

  # Socket params are passed from the client and can
  # be used to verify and authenticate a user. After
  # verification, you can put default assigns into
  # the socket that will be set for all channels, ie
  #
  #     {:ok, assign(socket, :user_id, verified_user_id)}
  #
  # To deny connection, return `:error`.
  #
  # See `Phoenix.Token` documentation for examples in
  # performing token verification on connect.
  # TODO: If there's no token, I just send a socket connection with no user_id. I would rather deny the socket connection but it led to errors everywhere
  # def connect(params, socket) do
  #   # IO.puts "----------SOCKET CONNECTED----------"
  #   # IO.puts "PARAMS"
  #   # IO.inspect params
  #   case params["token"] do
  #      nil -> {:ok, socket}
  #      "" -> {:ok, socket}
  #      _ -> 
  #       case Phoenix.Token.verify(socket, "user socket", params["token"], max_age: 1209600) do
  #         {:ok, user_id} ->
  #           # IO.puts "USER_ID"
  #           # IO.inspect user_id
  #           {:ok, assign(socket, :user_id, user_id)}
  #         {:ok, user_id} ->
  #           :error
  #       end
        
  #   end
    
  # end


  def connect(%{"token" => token}, socket) do
    case Phoenix.Token.verify(socket, "user socket", token, max_age: 1209600) do
      {:ok, user_id} ->
        {:ok, assign(socket, :user_id, user_id)}
      {:error, reason} ->
        # {:ok, socket}
        :error
    end
  end

  # Socket id's are topics that allow you to identify all sockets for a given user:
  #
  #     def id(socket), do: "user_socket:#{socket.assigns.user_id}"
  #
  # Would allow you to broadcast a "disconnect" event and terminate
  # all active sockets and channels for a given user:
  #
  #     ImagemanagerprototypeWeb.Endpoint.broadcast("user_socket:#{user.id}", "disconnect", %{})
  #
  # Returning `nil` makes this socket anonymous.
  def id(_socket), do: nil
end
