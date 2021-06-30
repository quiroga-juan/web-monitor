defmodule Request do

  def main(url) do
    estado = get_request(url)
    estado_no_cambio = UrlController.update_status_url(url, estado)
    unless estado_no_cambio do
      pid_bot = Process.whereis(:bot)
      send(pid_bot, {:enviar_mensaje, url, estado})
    end

    :timer.sleep(60000)
    main(url) 
   end 

  def get_request(url) do

    case HTTPoison.get(url) do
      {:Ok, %HTTPoison.Response{status_code: estado}} -> estado
      {:error, %HTTPoison.Error{reason: reason}} -> -1
    end
  end
end
