defmodule Imagemanagerprototype.ImageAssets.Location do
  use Ecto.Schema
  import Ecto.Changeset
  alias Imagemanagerprototype.ImageAssets.{Location,ImageAsset}


  schema "locations" do
    field :name, :string
    has_many :image_assets, ImageAsset

    timestamps()
  end

  @doc false
  def changeset(%Location{} = location, attrs) do
    location
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
