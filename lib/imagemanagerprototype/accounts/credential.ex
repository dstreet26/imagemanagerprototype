defmodule Imagemanagerprototype.Accounts.Credential do
  use Ecto.Schema
  import Ecto.Changeset
  alias Imagemanagerprototype.Accounts.{Credential, User}


  schema "credentials" do
    field :email, :string
    field :crypted_password, :string
    field :password, :string, virtual: true
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(%Credential{} = credential, attrs) do
    credential
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 5)
    |> put_change(:crypted_password, hashed_password(attrs["password"]))
  end

  defp hashed_password(password) do
    Comeonin.Pbkdf2.hashpwsalt(password)
  end
end
