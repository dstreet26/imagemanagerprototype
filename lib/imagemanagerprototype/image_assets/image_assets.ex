defmodule Imagemanagerprototype.ImageAssets do
  @moduledoc """
  The ImageAssets context.
  """

  import Ecto.Query, warn: false
  
alias Imagemanagerprototype.Repo
alias Imagemanagerprototype.ImageAssets.Project
# alias Imagemanagerprototype.Accounts.{User, Credential,UserType}
alias Imagemanagerprototype.ImageAssets.License
alias Imagemanagerprototype.ImageAssets.Author
alias Imagemanagerprototype.ImageAssets.Location
alias Imagemanagerprototype.ImageAssets.ImageAsset
alias Imagemanagerprototype.ImageAssets.Comment
alias Imagemanagerprototype.Accounts.User
  
  
  @doc """
  Returns the list of projects.

  ## Examples

      iex> list_projects()
      [%Project{}, ...]

  """
  def list_projects do
    Repo.all(Project)
  end

  @doc """
  Gets a single project.

  Raises `Ecto.NoResultsError` if the Project does not exist.

  ## Examples

      iex> get_project!(123)
      %Project{}

      iex> get_project!(456)
      ** (Ecto.NoResultsError)

  """
  def get_project!(id), do: Repo.get!(Project, id)

  @doc """
  Creates a project.

  ## Examples

      iex> create_project(%{field: value})
      {:ok, %Project{}}

      iex> create_project(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_project(attrs \\ %{}) do
    %Project{}
    |> Project.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a project.

  ## Examples

      iex> update_project(project, %{field: new_value})
      {:ok, %Project{}}

      iex> update_project(project, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_project(%Project{} = project, attrs) do
    project
    |> Project.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Project.

  ## Examples

      iex> delete_project(project)
      {:ok, %Project{}}

      iex> delete_project(project)
      {:error, %Ecto.Changeset{}}

  """
  def delete_project(%Project{} = project) do
    Repo.delete(project)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking project changes.

  ## Examples

      iex> change_project(project)
      %Ecto.Changeset{source: %Project{}}

  """
  def change_project(%Project{} = project) do
    Project.changeset(project, %{})
  end

  

  @doc """
  Returns the list of licenses.

  ## Examples

      iex> list_licenses()
      [%License{}, ...]

  """
  def list_licenses do
    Repo.all(License)
  end

  @doc """
  Gets a single license.

  Raises `Ecto.NoResultsError` if the License does not exist.

  ## Examples

      iex> get_license!(123)
      %License{}

      iex> get_license!(456)
      ** (Ecto.NoResultsError)

  """
  def get_license!(id), do: Repo.get!(License, id)

  @doc """
  Creates a license.

  ## Examples

      iex> create_license(%{field: value})
      {:ok, %License{}}

      iex> create_license(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_license(attrs \\ %{}) do
    %License{}
    |> License.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a license.

  ## Examples

      iex> update_license(license, %{field: new_value})
      {:ok, %License{}}

      iex> update_license(license, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_license(%License{} = license, attrs) do
    license
    |> License.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a License.

  ## Examples

      iex> delete_license(license)
      {:ok, %License{}}

      iex> delete_license(license)
      {:error, %Ecto.Changeset{}}

  """
  def delete_license(%License{} = license) do
    Repo.delete(license)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking license changes.

  ## Examples

      iex> change_license(license)
      %Ecto.Changeset{source: %License{}}

  """
  def change_license(%License{} = license) do
    License.changeset(license, %{})
  end

  

  @doc """
  Returns the list of authors.

  ## Examples

      iex> list_authors()
      [%Author{}, ...]

  """
  def list_authors do
    Repo.all(Author)
  end

  @doc """
  Gets a single author.

  Raises `Ecto.NoResultsError` if the Author does not exist.

  ## Examples

      iex> get_author!(123)
      %Author{}

      iex> get_author!(456)
      ** (Ecto.NoResultsError)

  """
  def get_author!(id), do: Repo.get!(Author, id)

  @doc """
  Creates a author.

  ## Examples

      iex> create_author(%{field: value})
      {:ok, %Author{}}

      iex> create_author(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_author(attrs \\ %{}) do
    %Author{}
    |> Author.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a author.

  ## Examples

      iex> update_author(author, %{field: new_value})
      {:ok, %Author{}}

      iex> update_author(author, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_author(%Author{} = author, attrs) do
    author
    |> Author.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Author.

  ## Examples

      iex> delete_author(author)
      {:ok, %Author{}}

      iex> delete_author(author)
      {:error, %Ecto.Changeset{}}

  """
  def delete_author(%Author{} = author) do
    Repo.delete(author)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking author changes.

  ## Examples

      iex> change_author(author)
      %Ecto.Changeset{source: %Author{}}

  """
  def change_author(%Author{} = author) do
    Author.changeset(author, %{})
  end

  

  @doc """
  Returns the list of locations.

  ## Examples

      iex> list_locations()
      [%Location{}, ...]

  """
  def list_locations do
    Repo.all(Location)
  end

  @doc """
  Gets a single location.

  Raises `Ecto.NoResultsError` if the Location does not exist.

  ## Examples

      iex> get_location!(123)
      %Location{}

      iex> get_location!(456)
      ** (Ecto.NoResultsError)

  """
  def get_location!(id), do: Repo.get!(Location, id)

  @doc """
  Creates a location.

  ## Examples

      iex> create_location(%{field: value})
      {:ok, %Location{}}

      iex> create_location(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_location(attrs \\ %{}) do
    %Location{}
    |> Location.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a location.

  ## Examples

      iex> update_location(location, %{field: new_value})
      {:ok, %Location{}}

      iex> update_location(location, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_location(%Location{} = location, attrs) do
    location
    |> Location.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Location.

  ## Examples

      iex> delete_location(location)
      {:ok, %Location{}}

      iex> delete_location(location)
      {:error, %Ecto.Changeset{}}

  """
  def delete_location(%Location{} = location) do
    Repo.delete(location)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking location changes.

  ## Examples

      iex> change_location(location)
      %Ecto.Changeset{source: %Location{}}

  """
  def change_location(%Location{} = location) do
    Location.changeset(location, %{})
  end

  

  @doc """
  Returns the list of image_assets.

  ## Examples

      iex> list_image_assets()
      [%ImageAsset{}, ...]

  """
  def list_image_assets do
    Repo.all(ImageAsset)
  end

  @doc """
  Gets a single image_asset.

  Raises `Ecto.NoResultsError` if the Image asset does not exist.

  ## Examples

      iex> get_image_asset!(123)
      %ImageAsset{}

      iex> get_image_asset!(456)
      ** (Ecto.NoResultsError)

  """
  # def get_image_asset!(id), do: Repo.get!(ImageAsset, id)
  def get_image_asset!(id) do
    Repo.get!(ImageAsset, id) 
    |> Repo.preload(:comments)
    |> Repo.preload(:project)
    |> Repo.preload(:author)
    |> Repo.preload(:location)
    |> Repo.preload(:license)

  end


def get_image_asset_comments!(id) do
  query = from ia in ImageAsset,
    where: ia.id == ^id,
    join: c in Comment, where: c.image_asset_id == ia.id,
    join: u in User, where: c.user_id == u.id,
    order_by: [asc: c.inserted_at],
    select: {
      c.comment, 
      c.inserted_at,
      u.name
    }
    

      Repo.all(query)
  end


  @doc """
  Creates a image_asset.

  ## Examples

      iex> create_image_asset(%{field: value})
      {:ok, %ImageAsset{}}

      iex> create_image_asset(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_image_asset(attrs \\ %{},project_id,license_id,author_id,location_id ) do
    %ImageAsset{}
    |> ImageAsset.changeset(attrs)
    |> Ecto.Changeset.put_change(:project_id, project_id)
    |> Ecto.Changeset.put_change(:license_id, license_id)
    |> Ecto.Changeset.put_change(:author_id, author_id)
    |> Ecto.Changeset.put_change(:location_id, location_id)
    |> Repo.insert()
  end

  #   def create_image_asset(attrs \\ %{} ) do
  #   %ImageAsset{}
  #   |> ImageAsset.changeset(attrs)
  #   |> Repo.insert()
  # end

  @doc """
  Updates a image_asset.

  ## Examples

      iex> update_image_asset(image_asset, %{field: new_value})
      {:ok, %ImageAsset{}}

      iex> update_image_asset(image_asset, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """

# def update_image_asset(%ImageAsset{} = image_asset, attrs,) do
#     image_asset
#     |> ImageAsset.changeset(attrs)
#     |> Repo.update()
#   end

  def update_image_asset(%ImageAsset{} = image_asset, attrs,project_id,license_id,author_id,location_id ) do
    image_asset
    |> ImageAsset.changeset(attrs)
    |> Ecto.Changeset.put_change(:project_id, project_id)
    |> Ecto.Changeset.put_change(:license_id, license_id)
    |> Ecto.Changeset.put_change(:author_id, author_id)
    |> Ecto.Changeset.put_change(:location_id, location_id)
    |> Repo.update()
  end

  @doc """
  Deletes a ImageAsset.

  ## Examples

      iex> delete_image_asset(image_asset)
      {:ok, %ImageAsset{}}

      iex> delete_image_asset(image_asset)
      {:error, %Ecto.Changeset{}}

  """
  def delete_image_asset(%ImageAsset{} = image_asset) do
    Repo.delete(image_asset)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking image_asset changes.

  ## Examples

      iex> change_image_asset(image_asset)
      %Ecto.Changeset{source: %ImageAsset{}}

  """
  def change_image_asset(%ImageAsset{} = image_asset) do
    ImageAsset.changeset(image_asset, %{})
  end

  

  @doc """
  Returns the list of comments.

  ## Examples

      iex> list_comments()
      [%Comment{}, ...]

  """
  def list_comments do
    Repo.all(Comment)
  end

  @doc """
  Gets a single comment.

  Raises `Ecto.NoResultsError` if the Comment does not exist.

  ## Examples

      iex> get_comment!(123)
      %Comment{}

      iex> get_comment!(456)
      ** (Ecto.NoResultsError)

  """
  def get_comment!(id) do
     Repo.get!(Comment, id)
     |> Repo.preload(:user)
  end

  @doc """
  Creates a comment.

  ## Examples

      iex> create_comment(%{field: value})
      {:ok, %Comment{}}

      iex> create_comment(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_comment(attrs \\ %{}, current_user_id, image_asset_id) do
    %Comment{}
    |> Comment.changeset(attrs)
    |> Ecto.Changeset.put_change(:user_id, current_user_id)
    |> Ecto.Changeset.put_change(:image_asset_id, image_asset_id)
    |> Repo.insert()
  end




 # def create_user(attrs \\ %{}, user_type_id) do
 #    %User{}
 #    |> User.changeset(attrs)
 #    |> Ecto.Changeset.cast_assoc(:credential, with: &Credential.changeset/2)
 #    |> Ecto.Changeset.put_change(:user_type_id, user_type_id)
 #    |> Repo.insert()
 #  end
  

  @doc """
  Updates a comment.

  ## Examples

      iex> update_comment(comment, %{field: new_value})
      {:ok, %Comment{}}

      iex> update_comment(comment, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_comment(%Comment{} = comment, attrs) do
    comment
    |> Comment.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Comment.

  ## Examples

      iex> delete_comment(comment)
      {:ok, %Comment{}}

      iex> delete_comment(comment)
      {:error, %Ecto.Changeset{}}

  """
  def delete_comment(%Comment{} = comment) do
    Repo.delete(comment)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking comment changes.

  ## Examples

      iex> change_comment(comment)
      %Ecto.Changeset{source: %Comment{}}

  """
  def change_comment(%Comment{} = comment) do
    Comment.changeset(comment, %{})
  end
end
