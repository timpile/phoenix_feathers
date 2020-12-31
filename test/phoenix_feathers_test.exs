defmodule PhoenixFeathersTest do
  use ExUnit.Case
  doctest PhoenixFeathers

  test "greets the world" do
    assert PhoenixFeathers.hello() == :world
  end
end
