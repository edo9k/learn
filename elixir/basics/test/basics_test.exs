defmodule BasicsTest do
  use ExUnit.Case
  doctest Basics

  test "greets the world" do
    assert Basics.hello() == :world
  end
end
