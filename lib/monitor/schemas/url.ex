defmodule Monitor.Url do
  use Ecto.Schema

  schema "url" do
    field :url_name, :string
  end

  def changeset(url, params \\ %{}) do
    url
    |> Ecto.Changeset.cast(params, [:url_name])
    |> Ecto.Changeset.validate_required([:url_name])
  end
end