defmodule ImagemanagerprototypeWeb.ImageAssets.ImageAssetController do
  use ImagemanagerprototypeWeb, :controller

  alias Imagemanagerprototype.ImageAssets
  alias Imagemanagerprototype.ImageAssets.ImageAsset
  alias Imagemanagerprototype.ImageAssets.Comment
  

  use Params

  defparams image_asset_search %{
    project_id: :id,
    author_id: :id,
    location_id: :id,
    license_id: :id
    
  }



  def index(conn, params) do



      projects = ImageAssets.list_projects()
      # IO.puts "====================list_projects============="
      # IO.inspect projects

      case projects do
        [] ->
          render(conn, "empty.html")
        _ ->
          changeset = image_asset_search(params)
          IO.inspect changeset
          if changeset.valid? do

      # project_id = ImageAssets.get_image_asset_by_author(changeset.changes.project_id)
      case Map.has_key?(changeset.changes, :project_id) do
         false ->
          IO.puts "==========1============"
          render(conn, "index.html", image_assets: ImageAssets.list_image_assets())
        true -> 
          IO.puts "==========2============"
          render(conn, "index.html", image_assets: ImageAssets.get_image_asset_by_project(
             changeset.changes.project_id
              ))
      end
      
          end
          
      end

       

  end

# def index2(conn, params) do
#   ImageAssets.params_filter()

#   render(conn, "index.html", posts: posts)
# end  


  def empty(conn, _params) do
    # image_assets = ImageAssets.list_image_assets()
    render(conn, "empty.html")
  end

  def new(conn, _params) do
    projects = ImageAssets.list_projects()
    authors = ImageAssets.list_authors()
    locations = ImageAssets.list_locations()
    licenses = ImageAssets.list_licenses()
    changeset = ImageAssets.change_image_asset(%ImageAsset{})
    render(conn, "new.html",
      changeset: changeset, 
      projects: projects,
      authors: authors,
      locations: locations,
      licenses: licenses
      )
  end

  def create(conn, %{"image_asset" => image_asset_params}) do
# {project_id, _ } = image_asset_params["project"] |> Integer.parse
# {license_id, _ } = image_asset_params["license"] |> Integer.parse
# {author_id, _ } = image_asset_params["author"] |> Integer.parse
# {location_id, _ } = image_asset_params["location"] |> Integer.parse

# IO.puts ""
# IO.inspect image_asset_params["project"]["proj"]
# IO.puts ""
# IO.inspect image_asset_params["license"]["lic"]
# IO.puts ""
# IO.inspect image_asset_params["author"]["auth"]
# IO.puts ""
# IO.inspect image_asset_params["location"]["loc"]



{project_id, _ } = image_asset_params["project"]["proj"] |> Integer.parse
{license_id, _ } = image_asset_params["license"]["lic"] |> Integer.parse
{author_id, _ } = image_asset_params["author"]["auth"] |> Integer.parse
{location_id, _ } =  image_asset_params["location"]["loc"] |> Integer.parse





# IO.puts "---------------image_asset_params----------------"
# IO.inspect image_asset_params
    # case ImageAssets.create_image_asset(image_asset_params) do
    case ImageAssets.create_image_asset(image_asset_params,project_id,license_id,author_id,location_id) do
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
    projects = ImageAssets.list_projects()
    authors = ImageAssets.list_authors()
    locations = ImageAssets.list_locations()
    licenses = ImageAssets.list_licenses()
    changeset = ImageAssets.change_image_asset(image_asset)
    render(conn, "edit.html", image_asset: image_asset, changeset: changeset,
     projects: projects,
     authors: authors,
     locations: locations,
     licenses: licenses
     )
  end

  def update(conn, %{"id" => id, "image_asset" => image_asset_params}) do
    image_asset = ImageAssets.get_image_asset!(id)

    # {project_id, _ } = image_asset_params["project"] |> Integer.parse
# {license_id, _ } = image_asset_params["license"] |> Integer.parse
# {author_id, _ } = image_asset_params["author"] |> Integer.parse
# {location_id, _ } = image_asset_params["location"] |> Integer.parse


{project_id, _ } = image_asset_params["project"]["proj"] |> Integer.parse
{license_id, _ } = image_asset_params["license"]["lic"] |> Integer.parse
{author_id, _ } = image_asset_params["author"]["auth"] |> Integer.parse
{location_id, _ } =  image_asset_params["location"]["loc"] |> Integer.parse




    # case ImageAssets.update_image_asset(image_asset, image_asset_params) do
    case ImageAssets.update_image_asset(image_asset, image_asset_params,project_id,license_id,author_id,location_id) do
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
