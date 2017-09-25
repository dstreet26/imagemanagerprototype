defmodule ImagemanagerprototypeWeb.ImageAssets.ImageAssetControllerTest do
  use ImagemanagerprototypeWeb.ConnCase

  alias Imagemanagerprototype.ImageAssets

  @create_attrs %{caption: "some caption", filename: "some filename", imageid: "some imageid", name: "some name", notes: "some notes"}
  @update_attrs %{caption: "some updated caption", filename: "some updated filename", imageid: "some updated imageid", name: "some updated name", notes: "some updated notes"}
  @invalid_attrs %{caption: nil, filename: nil, imageid: nil, name: nil, notes: nil}

  def fixture(:image_asset) do
    {:ok, image_asset} = ImageAssets.create_image_asset(@create_attrs)
    image_asset
  end

  describe "index" do
    test "lists all image_assets", %{conn: conn} do
      conn = get conn, image_assets_image_asset_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Image assets"
    end
  end

  describe "new image_asset" do
    test "renders form", %{conn: conn} do
      conn = get conn, image_assets_image_asset_path(conn, :new)
      assert html_response(conn, 200) =~ "New Image asset"
    end
  end

  describe "create image_asset" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, image_assets_image_asset_path(conn, :create), image_asset: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == image_assets_image_asset_path(conn, :show, id)

      conn = get conn, image_assets_image_asset_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Image asset"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, image_assets_image_asset_path(conn, :create), image_asset: @invalid_attrs
      assert html_response(conn, 200) =~ "New Image asset"
    end
  end

  describe "edit image_asset" do
    setup [:create_image_asset]

    test "renders form for editing chosen image_asset", %{conn: conn, image_asset: image_asset} do
      conn = get conn, image_assets_image_asset_path(conn, :edit, image_asset)
      assert html_response(conn, 200) =~ "Edit Image asset"
    end
  end

  describe "update image_asset" do
    setup [:create_image_asset]

    test "redirects when data is valid", %{conn: conn, image_asset: image_asset} do
      conn = put conn, image_assets_image_asset_path(conn, :update, image_asset), image_asset: @update_attrs
      assert redirected_to(conn) == image_assets_image_asset_path(conn, :show, image_asset)

      conn = get conn, image_assets_image_asset_path(conn, :show, image_asset)
      assert html_response(conn, 200) =~ "some updated caption"
    end

    test "renders errors when data is invalid", %{conn: conn, image_asset: image_asset} do
      conn = put conn, image_assets_image_asset_path(conn, :update, image_asset), image_asset: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Image asset"
    end
  end

  describe "delete image_asset" do
    setup [:create_image_asset]

    test "deletes chosen image_asset", %{conn: conn, image_asset: image_asset} do
      conn = delete conn, image_assets_image_asset_path(conn, :delete, image_asset)
      assert redirected_to(conn) == image_assets_image_asset_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, image_assets_image_asset_path(conn, :show, image_asset)
      end
    end
  end

  defp create_image_asset(_) do
    image_asset = fixture(:image_asset)
    {:ok, image_asset: image_asset}
  end
end
