defmodule Imagemanagerprototype.Repo.Migrations.AddCryptedPassword do
  use Ecto.Migration

  def change do
  	alter table(:credentials) do
  		add :crypted_password, :string
  	end
  end
end
