defmodule Imagemanagerprototype.ImageAssetsTest do
  use Imagemanagerprototype.DataCase

  alias Imagemanagerprototype.ImageAssets

  describe "projects" do
    alias Imagemanagerprototype.ImageAssets.Project

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def project_fixture(attrs \\ %{}) do
      {:ok, project} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ImageAssets.create_project()

      project
    end

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert ImageAssets.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert ImageAssets.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      assert {:ok, %Project{} = project} = ImageAssets.create_project(@valid_attrs)
      assert project.description == "some description"
      assert project.name == "some name"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ImageAssets.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      assert {:ok, project} = ImageAssets.update_project(project, @update_attrs)
      assert %Project{} = project
      assert project.description == "some updated description"
      assert project.name == "some updated name"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = ImageAssets.update_project(project, @invalid_attrs)
      assert project == ImageAssets.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = ImageAssets.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> ImageAssets.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = ImageAssets.change_project(project)
    end
  end

  describe "licenses" do
    alias Imagemanagerprototype.ImageAssets.License

    @valid_attrs %{content: "some content", name: "some name"}
    @update_attrs %{content: "some updated content", name: "some updated name"}
    @invalid_attrs %{content: nil, name: nil}

    def license_fixture(attrs \\ %{}) do
      {:ok, license} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ImageAssets.create_license()

      license
    end

    test "list_licenses/0 returns all licenses" do
      license = license_fixture()
      assert ImageAssets.list_licenses() == [license]
    end

    test "get_license!/1 returns the license with given id" do
      license = license_fixture()
      assert ImageAssets.get_license!(license.id) == license
    end

    test "create_license/1 with valid data creates a license" do
      assert {:ok, %License{} = license} = ImageAssets.create_license(@valid_attrs)
      assert license.content == "some content"
      assert license.name == "some name"
    end

    test "create_license/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ImageAssets.create_license(@invalid_attrs)
    end

    test "update_license/2 with valid data updates the license" do
      license = license_fixture()
      assert {:ok, license} = ImageAssets.update_license(license, @update_attrs)
      assert %License{} = license
      assert license.content == "some updated content"
      assert license.name == "some updated name"
    end

    test "update_license/2 with invalid data returns error changeset" do
      license = license_fixture()
      assert {:error, %Ecto.Changeset{}} = ImageAssets.update_license(license, @invalid_attrs)
      assert license == ImageAssets.get_license!(license.id)
    end

    test "delete_license/1 deletes the license" do
      license = license_fixture()
      assert {:ok, %License{}} = ImageAssets.delete_license(license)
      assert_raise Ecto.NoResultsError, fn -> ImageAssets.get_license!(license.id) end
    end

    test "change_license/1 returns a license changeset" do
      license = license_fixture()
      assert %Ecto.Changeset{} = ImageAssets.change_license(license)
    end
  end

  describe "authors" do
    alias Imagemanagerprototype.ImageAssets.Author

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def author_fixture(attrs \\ %{}) do
      {:ok, author} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ImageAssets.create_author()

      author
    end

    test "list_authors/0 returns all authors" do
      author = author_fixture()
      assert ImageAssets.list_authors() == [author]
    end

    test "get_author!/1 returns the author with given id" do
      author = author_fixture()
      assert ImageAssets.get_author!(author.id) == author
    end

    test "create_author/1 with valid data creates a author" do
      assert {:ok, %Author{} = author} = ImageAssets.create_author(@valid_attrs)
      assert author.name == "some name"
    end

    test "create_author/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ImageAssets.create_author(@invalid_attrs)
    end

    test "update_author/2 with valid data updates the author" do
      author = author_fixture()
      assert {:ok, author} = ImageAssets.update_author(author, @update_attrs)
      assert %Author{} = author
      assert author.name == "some updated name"
    end

    test "update_author/2 with invalid data returns error changeset" do
      author = author_fixture()
      assert {:error, %Ecto.Changeset{}} = ImageAssets.update_author(author, @invalid_attrs)
      assert author == ImageAssets.get_author!(author.id)
    end

    test "delete_author/1 deletes the author" do
      author = author_fixture()
      assert {:ok, %Author{}} = ImageAssets.delete_author(author)
      assert_raise Ecto.NoResultsError, fn -> ImageAssets.get_author!(author.id) end
    end

    test "change_author/1 returns a author changeset" do
      author = author_fixture()
      assert %Ecto.Changeset{} = ImageAssets.change_author(author)
    end
  end

  describe "locations" do
    alias Imagemanagerprototype.ImageAssets.Location

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def location_fixture(attrs \\ %{}) do
      {:ok, location} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ImageAssets.create_location()

      location
    end

    test "list_locations/0 returns all locations" do
      location = location_fixture()
      assert ImageAssets.list_locations() == [location]
    end

    test "get_location!/1 returns the location with given id" do
      location = location_fixture()
      assert ImageAssets.get_location!(location.id) == location
    end

    test "create_location/1 with valid data creates a location" do
      assert {:ok, %Location{} = location} = ImageAssets.create_location(@valid_attrs)
      assert location.name == "some name"
    end

    test "create_location/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ImageAssets.create_location(@invalid_attrs)
    end

    test "update_location/2 with valid data updates the location" do
      location = location_fixture()
      assert {:ok, location} = ImageAssets.update_location(location, @update_attrs)
      assert %Location{} = location
      assert location.name == "some updated name"
    end

    test "update_location/2 with invalid data returns error changeset" do
      location = location_fixture()
      assert {:error, %Ecto.Changeset{}} = ImageAssets.update_location(location, @invalid_attrs)
      assert location == ImageAssets.get_location!(location.id)
    end

    test "delete_location/1 deletes the location" do
      location = location_fixture()
      assert {:ok, %Location{}} = ImageAssets.delete_location(location)
      assert_raise Ecto.NoResultsError, fn -> ImageAssets.get_location!(location.id) end
    end

    test "change_location/1 returns a location changeset" do
      location = location_fixture()
      assert %Ecto.Changeset{} = ImageAssets.change_location(location)
    end
  end

  describe "image_assets" do
    alias Imagemanagerprototype.ImageAssets.ImageAsset

    @valid_attrs %{caption: "some caption", filename: "some filename", imageid: "some imageid", name: "some name", notes: "some notes"}
    @update_attrs %{caption: "some updated caption", filename: "some updated filename", imageid: "some updated imageid", name: "some updated name", notes: "some updated notes"}
    @invalid_attrs %{caption: nil, filename: nil, imageid: nil, name: nil, notes: nil}

    def image_asset_fixture(attrs \\ %{}) do
      {:ok, image_asset} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ImageAssets.create_image_asset()

      image_asset
    end

    test "list_image_assets/0 returns all image_assets" do
      image_asset = image_asset_fixture()
      assert ImageAssets.list_image_assets() == [image_asset]
    end

    test "get_image_asset!/1 returns the image_asset with given id" do
      image_asset = image_asset_fixture()
      assert ImageAssets.get_image_asset!(image_asset.id) == image_asset
    end

    test "create_image_asset/1 with valid data creates a image_asset" do
      assert {:ok, %ImageAsset{} = image_asset} = ImageAssets.create_image_asset(@valid_attrs)
      assert image_asset.caption == "some caption"
      assert image_asset.filename == "some filename"
      assert image_asset.imageid == "some imageid"
      assert image_asset.name == "some name"
      assert image_asset.notes == "some notes"
    end

    test "create_image_asset/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ImageAssets.create_image_asset(@invalid_attrs)
    end

    test "update_image_asset/2 with valid data updates the image_asset" do
      image_asset = image_asset_fixture()
      assert {:ok, image_asset} = ImageAssets.update_image_asset(image_asset, @update_attrs)
      assert %ImageAsset{} = image_asset
      assert image_asset.caption == "some updated caption"
      assert image_asset.filename == "some updated filename"
      assert image_asset.imageid == "some updated imageid"
      assert image_asset.name == "some updated name"
      assert image_asset.notes == "some updated notes"
    end

    test "update_image_asset/2 with invalid data returns error changeset" do
      image_asset = image_asset_fixture()
      assert {:error, %Ecto.Changeset{}} = ImageAssets.update_image_asset(image_asset, @invalid_attrs)
      assert image_asset == ImageAssets.get_image_asset!(image_asset.id)
    end

    test "delete_image_asset/1 deletes the image_asset" do
      image_asset = image_asset_fixture()
      assert {:ok, %ImageAsset{}} = ImageAssets.delete_image_asset(image_asset)
      assert_raise Ecto.NoResultsError, fn -> ImageAssets.get_image_asset!(image_asset.id) end
    end

    test "change_image_asset/1 returns a image_asset changeset" do
      image_asset = image_asset_fixture()
      assert %Ecto.Changeset{} = ImageAssets.change_image_asset(image_asset)
    end
  end

  describe "comments" do
    alias Imagemanagerprototype.ImageAssets.Comment

    @valid_attrs %{comment: "some comment"}
    @update_attrs %{comment: "some updated comment"}
    @invalid_attrs %{comment: nil}

    def comment_fixture(attrs \\ %{}) do
      {:ok, comment} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ImageAssets.create_comment()

      comment
    end

    test "list_comments/0 returns all comments" do
      comment = comment_fixture()
      assert ImageAssets.list_comments() == [comment]
    end

    test "get_comment!/1 returns the comment with given id" do
      comment = comment_fixture()
      assert ImageAssets.get_comment!(comment.id) == comment
    end

    test "create_comment/1 with valid data creates a comment" do
      assert {:ok, %Comment{} = comment} = ImageAssets.create_comment(@valid_attrs)
      assert comment.comment == "some comment"
    end

    test "create_comment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ImageAssets.create_comment(@invalid_attrs)
    end

    test "update_comment/2 with valid data updates the comment" do
      comment = comment_fixture()
      assert {:ok, comment} = ImageAssets.update_comment(comment, @update_attrs)
      assert %Comment{} = comment
      assert comment.comment == "some updated comment"
    end

    test "update_comment/2 with invalid data returns error changeset" do
      comment = comment_fixture()
      assert {:error, %Ecto.Changeset{}} = ImageAssets.update_comment(comment, @invalid_attrs)
      assert comment == ImageAssets.get_comment!(comment.id)
    end

    test "delete_comment/1 deletes the comment" do
      comment = comment_fixture()
      assert {:ok, %Comment{}} = ImageAssets.delete_comment(comment)
      assert_raise Ecto.NoResultsError, fn -> ImageAssets.get_comment!(comment.id) end
    end

    test "change_comment/1 returns a comment changeset" do
      comment = comment_fixture()
      assert %Ecto.Changeset{} = ImageAssets.change_comment(comment)
    end
  end
end
