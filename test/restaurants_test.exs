defmodule RestaurantsTest do
  use ExUnit.Case
  doctest Restaurants

  test "show all resturants" do
    assert Restaurants.list() == []
  end

  test "show open resturants" do
    assert Restaurants.list_open() == []
  end

  test "show resturant menu" do
    restaurants = Restaurants.list()

    restaurant = List.first(restaurants)

    assert restaurant.menu() == []
  end
end
