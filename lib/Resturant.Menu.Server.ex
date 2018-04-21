defmodule Resturant.Menu.Server do
  use GenServer
  
    defstruct status: :ok,
			  menu: []

end
