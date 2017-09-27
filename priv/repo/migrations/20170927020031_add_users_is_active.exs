
defmodule Imagemanagerprototype.Repo.Migrations.UsersUsertype do
  use Ecto.Migration

  def change do
  	alter table(:users) do
  		add :is_active, :boolean, null: false, default: true
  	end

  	create index(:users, [:is_active])
  end
end
