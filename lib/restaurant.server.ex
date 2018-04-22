defmodule Resturant.Server do
  use GenServer

@name __MODULE__
@registry_name :resturant_registry

  defstruct geohash: nil,
			name: nil,
			status: :ok,
			hours: [],
			meta: []
			
@doc "Get list of all Menu items"
def menu() do


end

end
