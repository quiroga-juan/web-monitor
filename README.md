# Monitor Web #

## Descripción de la aplicación

## Pre-requisitos
* Tener instalado [Elixir](https://elixir-lang.org/)
* Base de datos [postgresql](https://www.postgresql.org/).

## Correr los tests
`mix test`

## Built With
* [Ecto](https://hexdocs.pm/ecto/Ecto.html) para almacenamiento de los datos.

## Instalación

### Dependencias
`mix deps.get`

### Base de datos
* `mix ecto.create` (Sólo la primera vez)
* `mix ecto.migrate` (Para correr las migraciones)

### Requests
* Request.main (en la consola de Elixir)

### Del readme de Phoenix
To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`
