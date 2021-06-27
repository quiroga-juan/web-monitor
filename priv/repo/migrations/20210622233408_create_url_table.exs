defmodule Monitor.Repo.Migrations.CreateUrlTable do
  use Ecto.Migration

  def change do
    create table(:url, primary_key: false) do
      add :url_name, :string, primary_key: true
      add :url_last_status, :integer
      timestamps()
    end
  end
end
