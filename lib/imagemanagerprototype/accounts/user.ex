defmodule Imagemanagerprototype.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Imagemanagerprototype.Accounts.{User, Credential,UserType}


  schema "users" do
    field :name, :string
    field :username, :string
    has_one :credential, Credential
    belongs_to :user_type, UserType

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :username])
    |> validate_required([:name, :username])
  end
end
