defmodule ImagemanagerprototypeWeb.ImageAssets.CommentController do
  use ImagemanagerprototypeWeb, :controller

  alias Imagemanagerprototype.ImageAssets
  alias Imagemanagerprototype.ImageAssets.ImageAsset
  alias Imagemanagerprototype.ImageAssets.Comment

 def create(conn, %{"comment" => comment_params}) do
    {current_user_id, _ } = comment_params["current_user_id"] |> Integer.parse
    {image_asset_id, _ } = comment_params["image_asset_id"] |> Integer.parse
   image_asset = ImageAssets.get_image_asset!(image_asset_id)
    case ImageAssets.create_comment(comment_params,current_user_id,image_asset_id) do
      {:ok, comment} ->
        conn
        |> put_flash(:info, "Comment Posted.")
        |> redirect(to: image_assets_image_asset_path(conn, :show, image_asset))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

end



