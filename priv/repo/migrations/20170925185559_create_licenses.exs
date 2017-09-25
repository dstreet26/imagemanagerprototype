defmodule Imagemanagerprototype.Repo.Migrations.CreateLicenses do
  use Ecto.Migration

  def change do
    create table(:licenses) do
      add :name, :string
      add :content, :string

      timestamps()
    end

  end
end
