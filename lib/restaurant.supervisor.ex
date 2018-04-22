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


def stop(hash) do
  case Registry.lookup(@registry_name,  hash) do
    [] -> :ok
    [{pid, _}] ->
      Process.exit(pid, :shutdown)
      :ok
  end
end

def whereis(hash) do

case Registry.lookup(@registry_name, hash) do
  [{pid, _}] -> pid
  [] -> nil
end
end

def find_or_create_process(hash)  do
   if process_exists?(hash) do
     {:ok, hash}
   else
     hash |> start
   end
end

def process_exists?(hash)  do
  case Registry.lookup(@registry_name, hash) do
  case Registry.lookup(@registry_name, hash) do
    [] -> false
    _ -> true
  end
end
end
