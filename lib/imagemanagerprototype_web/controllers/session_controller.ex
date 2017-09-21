defmodule ImagemanagerprototypeWeb.SessionController do
  use ImagemanagerprototypeWeb, :controller

  alias Imagemanagerprototype.Accounts

  def new(conn, _) do
	render(conn, "new.html")
  end

  def create(conn, %{"user" => %{"email" => email, "password" => password}}) do
  	case Accounts.authenticate_by_email_password(email, password) do
  		{:ok, user} ->
  			conn
  			|> put_flash(:info, "welcome back!")
  			|> put_session(:user_id, user.id)
  			|> configure_session(renew: true)
  			|> redirect(to: "/")

  		{:error, :unauthorized} ->
  			conn |> put_flash(:error, "bad email or password")
  			|> redirect(to: session_path(conn, :new))

  	end
  end

  def delete(conn,_) do
  	conn |> configure_session(drop: true) |> redirect(to: "/")
  end
end
