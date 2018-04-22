defmodule Resturant.Supervisor do
  use Supervisor

@registry_name :resturant_registry

def start_link do
  Supervisor.start_link(__MODULE__, nil, name: __MODULE__)
end

def init(_) do
  children = [worker(Resturant.Server, [], restart: :transient)]
  supervise(children, [strategy: :simple_one_for_one])
end

def start(hash) do
  Supervisor.start_child(__MODULE__, [ hash ])
end
end
