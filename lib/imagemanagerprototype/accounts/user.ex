defmodule Imagemanagerprototype.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Imagemanagerprototype.Accounts.{User, Credential}


  schema "users" do
    field :name, :string
    field :username, :string
    has_one :credential, Credential

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :username])
    |> validate_required([:name, :username])
  end
end
