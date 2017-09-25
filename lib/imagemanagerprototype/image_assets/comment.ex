defmodule Imagemanagerprototype.ImageAssets.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias Imagemanagerprototype.ImageAssets.{Comment, ImageAsset}
  alias Imagemanagerprototype.Accounts.User


  schema "comments" do
    field :comment, :string
    # field :user_id, :id
    belongs_to :user, User
    # field :imageasset_id, :id
    belongs_to :image_asset, ImageAsset

    timestamps()
  end

  @doc false
  def changeset(%Comment{} = comment, attrs) do
    comment
    |> cast(attrs, [:comment])
    |> validate_required([:comment])
  end
end
