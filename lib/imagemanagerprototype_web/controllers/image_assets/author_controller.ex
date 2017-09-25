defmodule ImagemanagerprototypeWeb.ImageAssets.AuthorController do
  use ImagemanagerprototypeWeb, :controller

  alias Imagemanagerprototype.ImageAssets
  alias Imagemanagerprototype.ImageAssets.Author

  def index(conn, _params) do
    authors = ImageAssets.list_authors()
    render(conn, "index.html", authors: authors)
  end

  def new(conn, _params) do
    changeset = ImageAssets.change_author(%Author{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"author" => author_params}) do
    case ImageAssets.create_author(author_params) do
      {:ok, author} ->
        conn
        |> put_flash(:info, "Author created successfully.")
        |> redirect(to: image_assets_author_path(conn, :show, author))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    author = ImageAssets.get_author!(id)
    render(conn, "show.html", author: author)
  end

  def edit(conn, %{"id" => id}) do
    author = ImageAssets.get_author!(id)
    changeset = ImageAssets.change_author(author)
    render(conn, "edit.html", author: author, changeset: changeset)
  end

  def update(conn, %{"id" => id, "author" => author_params}) do
    author = ImageAssets.get_author!(id)

    case ImageAssets.update_author(author, author_params) do
      {:ok, author} ->
        conn
        |> put_flash(:info, "Author updated successfully.")
        |> redirect(to: image_assets_author_path(conn, :show, author))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", author: author, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    author = ImageAssets.get_author!(id)
    {:ok, _author} = ImageAssets.delete_author(author)

    conn
    |> put_flash(:info, "Author deleted successfully.")
    |> redirect(to: image_assets_author_path(conn, :index))
  end
end
