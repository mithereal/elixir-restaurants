defmodule Restaurants.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: Restaurants.Worker.start_link(arg)
      # {Resturants.Worker, arg},
      supervisor(Restaurant.Repo, []),

      supervisor(Registry, [:unique, :restaurants_registry], id: :restaurants_registry),

      supervisor(Restaurants.Supervisor, []),

    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Restaurants.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
