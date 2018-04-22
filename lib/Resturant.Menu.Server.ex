defmodule Resturant.Menu.Server do
  use GenServer
  
    defstruct status: :ok,
			  menu: []
			  


@doc false
def handle_call(:fetch_menu, _from, %__MODULE__{ status: status, menu: menu } = state) do
{:reply, menu, state }
end
end
