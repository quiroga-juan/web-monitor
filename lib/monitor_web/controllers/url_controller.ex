defmodule MonitorWeb.UrlController do
  use MonitorWeb, :controller

  # Esto se trae el modelo, que sería la estructura de las urls.
  alias Monitor.Url
  alias Monitor.Repo

  require Logger

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

    pid = Process.whereis(:url_manager)
    Logger.info(Process.alive?(pid))
    %{"url_name"=> url_name} = url_params
    send(pid, {:agregar_url, url_name})
    conn
    |> put_flash(:info, "url created successfully")
    |> redirect(to: Routes.url_path(conn, :index))
end

  def show(conn, %{"id" => url_name}) do
    url = Repo.get!(Url, url_name)
    render(conn, "show.html", url: url)
  end

  def delete(conn, %{"id" => url_name}) do
    url = Repo.get!(Url, url_name)
    Repo.delete!(url)

    conn
    |> put_flash(:info, "url deleted successfully")
    |> redirect(to: Routes.url_path(conn, :index))
  end

end
