defmodule ImagemanagerprototypeWeb.ImageAssets.AuthorControllerTest do
  use ImagemanagerprototypeWeb.ConnCase

  alias Imagemanagerprototype.ImageAssets

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:author) do
    {:ok, author} = ImageAssets.create_author(@create_attrs)
    author
  end

  describe "index" do
    test "lists all authors", %{conn: conn} do
      conn = get conn, image_assets_author_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Authors"
    end
  end

  describe "new author" do
    test "renders form", %{conn: conn} do
      conn = get conn, image_assets_author_path(conn, :new)
      assert html_response(conn, 200) =~ "New Author"
    end
  end

  describe "create author" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, image_assets_author_path(conn, :create), author: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == image_assets_author_path(conn, :show, id)

      conn = get conn, image_assets_author_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Author"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, image_assets_author_path(conn, :create), author: @invalid_attrs
      assert html_response(conn, 200) =~ "New Author"
    end
  end

  describe "edit author" do
    setup [:create_author]

    test "renders form for editing chosen author", %{conn: conn, author: author} do
      conn = get conn, image_assets_author_path(conn, :edit, author)
      assert html_response(conn, 200) =~ "Edit Author"
    end
  end

  describe "update author" do
    setup [:create_author]

    test "redirects when data is valid", %{conn: conn, author: author} do
      conn = put conn, image_assets_author_path(conn, :update, author), author: @update_attrs
      assert redirected_to(conn) == image_assets_author_path(conn, :show, author)

      conn = get conn, image_assets_author_path(conn, :show, author)
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, author: author} do
      conn = put conn, image_assets_author_path(conn, :update, author), author: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Author"
    end
  end

  describe "delete author" do
    setup [:create_author]

    test "deletes chosen author", %{conn: conn, author: author} do
      conn = delete conn, image_assets_author_path(conn, :delete, author)
      assert redirected_to(conn) == image_assets_author_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, image_assets_author_path(conn, :show, author)
      end
    end
  end

  defp create_author(_) do
    author = fixture(:author)
    {:ok, author: author}
  end
end
