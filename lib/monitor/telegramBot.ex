defmodule TelegramBot do

	def enviar_mensaje(sitio, nuevo_estado) do	
		chat_id =  "-502981027"
		mensaje = "El sitio \"#{sitio}\" cambio su estado a: #{nuevo_estado}"
		url = "https://api.telegram.org/bot#{System.get_env("BOT_TOKEN")}/sendMessage?chat_id=#{chat_id}&text=#{mensaje}"

		HTTPoison.get(url)
	end
end

