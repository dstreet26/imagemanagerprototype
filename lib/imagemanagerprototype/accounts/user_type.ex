defmodule Imagemanagerprototype.Accounts.UserType do
  use Ecto.Schema
  import Ecto.Changeset
  alias Imagemanagerprototype.Accounts.{UserType,User,AccessKey}


  schema "user_types" do
    field :actions, {:array, :string}
    field :type, :string
    has_many :user, User
    # has_many :access_key, AccessKey

    timestamps()
  end

  @doc false
  def changeset(%UserType{} = user_type, attrs) do
    user_type
    |> cast(attrs, [:type, :actions])
    |> validate_required([:type])
    |> unique_constraint(:type)
  end
end
