defmodule Imagemanagerprototype.Repo.Migrations.UsersUsertype do
  use Ecto.Migration

  def change do
  	alter table(:users) do
  		add :user_type_id, references(:user_types)
  	end

  	create index(:users, [:user_type_id])
  end
end
