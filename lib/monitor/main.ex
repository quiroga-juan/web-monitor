defmodule Main do
	import TelegramBot	

	pid_bot = spawn(fn -> TelegramBot.recibir_alertas() end)

	
	def agregar_url(nombre_sitio, url) do
		spawn(fn-> Request.main(unquote(pid_bot), nombre_sitio, url) end)
	end

end
