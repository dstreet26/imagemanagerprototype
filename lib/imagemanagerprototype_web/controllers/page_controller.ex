defmodule ImagemanagerprototypeWeb.PageController do
  use ImagemanagerprototypeWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
  
   def docs(conn, _params) do
    render conn, "docs.html"
  end
end
