defmodule Imagemanagerprototype.Repo.Migrations.CreateImageAssets do
  use Ecto.Migration

  def change do
    create table(:image_assets) do
      add :name, :string
      add :imageid, :string
      add :notes, :string
      add :caption, :string
      add :filename, :string
      add :project_id, references(:projects, on_delete: :nothing)
      add :license_id, references(:licenses, on_delete: :nothing)
      add :author_id, references(:authors, on_delete: :nothing)
      add :location_id, references(:locations, on_delete: :nothing)

      timestamps()
    end

    create index(:image_assets, [:project_id])
    create index(:image_assets, [:license_id])
    create index(:image_assets, [:author_id])
    create index(:image_assets, [:location_id])
  end
end
