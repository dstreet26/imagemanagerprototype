defmodule Imagemanagerprototype.ImageAssets.License do
  use Ecto.Schema
  import Ecto.Changeset
  alias Imagemanagerprototype.ImageAssets.{License,ImageAsset}


  schema "licenses" do
    field :content, :string
    field :name, :string
    has_many :image_assets, ImageAsset

    timestamps()
  end

  @doc false
  def changeset(%License{} = license, attrs) do
    license
    |> cast(attrs, [:name, :content])
    |> validate_required([:name])
  end
end
