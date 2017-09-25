defmodule ImagemanagerprototypeWeb.ImageAssets.ImageAssetController do
  use ImagemanagerprototypeWeb, :controller

  alias Imagemanagerprototype.ImageAssets
  alias Imagemanagerprototype.ImageAssets.ImageAsset

  def index(conn, _params) do
    image_assets = ImageAssets.list_image_assets()
    render(conn, "index.html", image_assets: image_assets)
  end

  def new(conn, _params) do
    changeset = ImageAssets.change_image_asset(%ImageAsset{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"image_asset" => image_asset_params}) do
    IO.puts "---------IMAGE_ASSET_PARAMS"
    IO.inspect image_asset_params
    mychangeset = Image
    case ImageAssets.create_image_asset(image_asset_params) do
      {:ok, image_asset} ->
        conn
        |> put_flash(:info, "Image asset created successfully.")
        |> redirect(to: image_assets_image_asset_path(conn, :show, image_asset))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    image_asset = ImageAssets.get_image_asset!(id)
    IO.puts "SHOW"
    IO.inspect image_asset

 test = Imagemanagerprototype.ArcFilename.url({image_asset.filename,image_asset})
    IO.puts "TEST"
    IO.inspect test


    render(conn, "show.html", image_asset: image_asset)
  end

  def edit(conn, %{"id" => id}) do
    image_asset = ImageAssets.get_image_asset!(id)
    changeset = ImageAssets.change_image_asset(image_asset)
    render(conn, "edit.html", image_asset: image_asset, changeset: changeset)
  end

  def update(conn, %{"id" => id, "image_asset" => image_asset_params}) do
    image_asset = ImageAssets.get_image_asset!(id)

    case ImageAssets.update_image_asset(image_asset, image_asset_params) do
      {:ok, image_asset} ->
        conn
        |> put_flash(:info, "Image asset updated successfully.")
        |> redirect(to: image_assets_image_asset_path(conn, :show, image_asset))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", image_asset: image_asset, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    image_asset = ImageAssets.get_image_asset!(id)
    {:ok, _image_asset} = ImageAssets.delete_image_asset(image_asset)

    conn
    |> put_flash(:info, "Image asset deleted successfully.")
    |> redirect(to: image_assets_image_asset_path(conn, :index))
  end
end
