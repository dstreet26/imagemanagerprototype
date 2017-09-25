defmodule Imagemanagerprototype.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :comment, :string
      add :user_id, references(:users, on_delete: :nothing)
      add :image_asset_id, references(:image_assets, on_delete: :nothing)

      timestamps()
    end

    create index(:comments, [:user_id])
    create index(:comments, [:image_asset_id])
  end
end
