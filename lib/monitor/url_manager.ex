defmodule UrlManager do

	def recibir_alertas() do
		receive do
			{:agregar_url, url} -> agregar_url(url)
			recibir_alertas()
		end
	end


	defp agregar_url(url) do
		UrlController.add_url(url)
		spawn(fn-> Request.main(url) end)
	end
end
