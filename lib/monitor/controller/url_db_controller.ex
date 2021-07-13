defmodule DbManager do
    alias Monitor.Url
    alias Monitor.Repo
    
    def add_url(url_name) do
        url = %Url{url_name: url_name}
        changeset = Url.url_changeset(url, %{})
        Repo.insert(changeset)
    end

    def get_urls() do
        import Ecto.Query
        Repo.all from u in Url,
        select: u.url_name
    end
    
    def update_status(url_name, url_last_status) do
        Url |> Repo.get_by(url_name: url_name)
        |> Url.status_changeset(%{url_last_status: url_last_status}) 
        |> Repo.update()
    end
    
    def get_status_url(url_name) do
        url = Repo.get_by(Url, url_name: url_name)
        Url.status_changeset(url, %{})
        url.url_last_status
    end

    @doc """
    return true if new_status no changed or
    return false if  it's different and save new status.
    """
    def update_status_url(url_name, new_status) do
        url = %Url{url_name: url_name}
        Url.url_changeset(url, %{}).data
        status = get_status_url(url_name)
        cond do
            status == new_status -> true
            status != new_status -> update_status(url_name, new_status)
                false
        end
    end
 
    def delete_url(url_name) do
        url = Repo.get_by(Url, url_name: url_name)
        case Repo.delete url do
            {:ok, struct}       -> true
            {:error, changeset} -> false
        end
    end

end