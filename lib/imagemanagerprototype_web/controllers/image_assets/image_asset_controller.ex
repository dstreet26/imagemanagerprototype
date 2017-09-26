defmodule ImagemanagerprototypeWeb.ImageAssets.ImageAssetController do
  use ImagemanagerprototypeWeb, :controller

  alias Imagemanagerprototype.ImageAssets
  alias Imagemanagerprototype.ImageAssets.ImageAsset
  alias Imagemanagerprototype.ImageAssets.Comment

  def index(conn, _params) do
    image_assets = ImageAssets.list_image_assets()
    render(conn, "index.html", image_assets: image_assets)
  end

  def new(conn, _params) do
    authors = ImageAssets.list_authors()
    locations = ImageAssets.list_locations()
    licenses = ImageAssets.list_licenses()
    changeset = ImageAssets.change_image_asset(%ImageAsset{})
    render(conn, "new.html",
      changeset: changeset, 
      authors: authors,
      locations: locations,
      licenses: licenses
      )
  end

  def create(conn, %{"image_asset" => image_asset_params}) do

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
    comment_changeset = ImageAssets.change_comment(%Comment{})
    current_user_id = conn.assigns.current_user.credential.id

    image_asset = ImageAssets.get_image_asset!(id)

IO.puts "-------------ACTIONS--------"
IO.inspect conn.assigns.current_user.user_type.actions
# ["can_add_new_fields", "can_add_users", "can_comment", "can_delete_users",
 # "can_make_thumbnails", "can_modify_fields", "can_view_high_res_image"]

 can_view_high_res = Enum.any?(
  conn.assigns.current_user.user_type.actions,
  fn (action) -> 
    action == "can_view_high_res_image"
  end
  )


    {image_asset_id_integer, _ } = id |> Integer.parse
    image_asset_comments = ImageAssets.get_image_asset_comments!(image_asset_id_integer)

    render(conn, "show.html", 
      image_asset: image_asset, 
      comment_changeset: comment_changeset, 
      current_user_id: current_user_id,
      can_view_high_res: can_view_high_res,
      image_asset_comments: image_asset_comments)
  end

  def edit(conn, %{"id" => id}) do
    image_asset = ImageAssets.get_image_asset!(id)
    authors = ImageAssets.list_authors()
    locations = ImageAssets.list_locations()
    licenses = ImageAssets.list_licenses()
    changeset = ImageAssets.change_image_asset(image_asset)
    render(conn, "edit.html", image_asset: image_asset, changeset: changeset,
     authors: authors,
     locations: locations,
     licenses: licenses
     )
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
