defmodule TelegramBot do

	def recibir_alertas() do
		receive do
			{:enviar_mensaje, url, nuevo_estado} -> enviar_mensaje(url, nuevo_estado)
		end
		recibir_alertas()
	end

	def enviar_mensaje(nombre_url, nuevo_estado) do	
		chat_id = "-1001263439664"
		mensaje = "El sitio \"#{nombre_url}\" cambio su estado a: #{nuevo_estado}"
		url = "https://api.telegram.org/bot#{System.get_env("BOT_TOKEN")}/sendMessage?chat_id=#{chat_id}&text=#{mensaje}"

		HTTPoison.get(url)
	end
end

