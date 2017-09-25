defmodule ImagemanagerprototypeWeb.Router do
  use ImagemanagerprototypeWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ImagemanagerprototypeWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/docs", PageController, :docs
    resources "/users", UserController
    resources "/sessions", SessionController, only: [:new, :create, :delete], singleton: true
    resources "/user_types", UserTypeController
    # resources "/licenses", LicenseController
     # resources "/projects", ProjectController
      # resources "/imageassets", ImageAssetController
       # resources "/comments", CommentController
  end


 scope "/image_assets", ImagemanagerprototypeWeb.ImageAssets, as: :image_assets do
      # pipe_through :browser
    pipe_through [:browser, :authenticate_user]
      resources "/projects", ProjectController
      resources "/licenses", LicenseController
       resources "/imageassets", ImageAssetController
        resources "/authors", AuthorController
        resources "/locations", LocationController
    end

  defp authenticate_user(conn, _) do
    case get_session(conn, :user_id) do
      nil ->
        conn
        |> Phoenix.Controller.put_flash(:error, "login required")
        |> Phoenix.Controller.redirect(to: "/")
        |> halt()
      user_id ->
        assign(conn, :current_user, Imagemanagerprototype.Accounts.get_user!(user_id))
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", ImagemanagerprototypeWeb do
  #   pipe_through :api
  # end
end
