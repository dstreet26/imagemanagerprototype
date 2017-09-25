defmodule Imagemanagerprototype.ImageAssets.Author do
  use Ecto.Schema
  import Ecto.Changeset
 alias Imagemanagerprototype.ImageAssets.{Author,ImageAsset}


  schema "authors" do
    field :name, :string
    has_many :image_assets, ImageAsset

    timestamps()
  end

  @doc false
  def changeset(%Author{} = author, attrs) do
    author
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
