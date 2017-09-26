defmodule Imagemanagerprototype.ImageAssets.ImageAsset do
  use Ecto.Schema
  use Arc.Ecto.Schema
  import Ecto.Changeset
    alias Imagemanagerprototype.ImageAssets.{ImageAsset,Project,License,Author,Comment,Location}
    # alias Imagemanagerprototype.ImageAssets.{ImageAsset,Project,Comment}


  schema "image_assets" do
    field :caption, :string
    field :filename, Imagemanagerprototype.ArcFilename.Type
    field :imageid, :string
    field :name, :string
    field :notes, :string
    # field :project_id, :id
    belongs_to :project, Project
    # field :license_id, :id
    # has_one :license, License
    belongs_to :license, License
    # field :author_id, :id
    # has_one :author, Author
    belongs_to :author, Author
    # field :location_id, :id
    # has_one :location, Location
    belongs_to :location, Location
    has_many :comments, Comment

    timestamps()
  end

  @doc false
  def changeset(%ImageAsset{} = image_asset, attrs) do
    image_asset
    |> cast(attrs, [:name, :imageid, :notes, :caption, :filename])
    |> cast_attachments(attrs, [:filename])
    |> validate_required([:name])
  end
end
