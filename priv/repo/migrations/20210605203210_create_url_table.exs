defmodule Monitor.Repo.Migrations.CreateUrlTable do
  use Ecto.Migration

  def change do
    create table(:url) do
      add :url_name, :string
    end
  end
end
