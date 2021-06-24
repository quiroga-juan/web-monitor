defmodule Request do
  def main do
    get_request()
  end

  def main(pid_bot, nombre_sitio, url) do
    # Aca iria toda la logica de que el get_request para el URL se ejecute cada 1 minuto
    # y cuando se ve en la base de datos que el estado cambio se ejecutaria la linea que 
    # esta abajo
    estado = "OK"
    send(pid_bot, {:EnviarMensaje, nombre_sitio, estado})
  end 

  def get_request() do

    #una pagina que da not found para probar:
    #url = "https://tworobbers.com/404"

    #una que da la reason:
    #url = "http://localhost:1"

    url = "https://guaraniautogestion.fi.uba.ar/g3w/"

    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        IO.inspect HtmlEntities.decode(body)
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end
end
