defmodule Monitor.Url do
  use Ecto.Schema
  alias Ecto.Changeset

  @primary_key {:url_name, :string, []}
  schema "url" do
    field :url_last_status, :integer
    timestamps()
  end

  def url_changeset(url, params \\ %{}) do
    url
    |> Changeset.cast(params, [:url_name])
    |> Changeset.validate_required([:url_name])
  end

  def status_changeset(url, params \\ %{}) do
    url
    |> Changeset.cast(params, [:url_last_status])
    |> Changeset.validate_required([:url_last_status])
  end
end