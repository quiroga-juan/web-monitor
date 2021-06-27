defmodule MonitorWeb.UrlController do
  use MonitorWeb, :controller

  # Esto se trae el modelo, que sería la estructura de las urls.
  alias Monitor.Url
  alias Monitor.Repo

  def index(conn, _params) do
    # Esta funcion renderiza la pagina que muestra todas las urls
    urls = Repo.all(Url)
    render(conn, "index.html", urls: urls)
  end

  def new(conn, _params) do
    # Esta funcion manda un changeset para llenar, que es para crear nuevas urls
    changeset = Url.url_changeset(%Url{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"url" => url_params}) do
    changeset = Url.url_changeset(%Url{}, url_params)

    case Repo.insert(changeset) do
      {:ok, _url} ->
        conn
        |> put_flash(:info, "url created successfully")
        |> redirect(to: Routes.url_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

end
