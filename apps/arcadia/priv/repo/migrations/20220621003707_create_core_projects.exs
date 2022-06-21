defmodule Arcadia.Repo.Migrations.CreateCoreProjects do
  use Ecto.Migration

  def change do
    create table(:core_projects, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :url, :string

      timestamps()
    end
  end
end
