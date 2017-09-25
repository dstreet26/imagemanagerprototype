defmodule Imagemanagerprototype.ImageAssets.Project do
  use Ecto.Schema
  import Ecto.Changeset
  alias Imagemanagerprototype.ImageAssets.{Project,ImageAsset}


  schema "projects" do
    field :description, :string
    field :name, :string
    has_many :image_assets, ImageAsset

    timestamps()
  end

  @doc false
  def changeset(%Project{} = project, attrs) do
    project
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
