defmodule BurritoCliExampleTest do
  use ExUnit.Case
  doctest BurritoCliExample

  test "greets the world" do
    assert BurritoCliExample.hello() == :world
  end
end
