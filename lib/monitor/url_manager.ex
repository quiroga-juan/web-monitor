defmodule UrlManager do

	def recibir_alertas() do
		receive do
			{:agregar_url, url} -> agregar_url(url)
			{:borrar_url, url} -> borrar_url(url)
		end
		recibir_alertas()
	end


	defp agregar_url(url) do
		UrlController.add_url(url)
		pid = spawn(fn-> Request.main(url) end)
    		Process.register(pid, String.to_atom(url))
	end

	defp borrar_url(url) do
		pid = Process.whereis(String.to_atom(url))
		Process.exit(pid, :deleted)
		UrlController.delete_url(url)
	end
end
