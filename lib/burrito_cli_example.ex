defmodule BurritoCliExample do
  @moduledoc """
  Documentation for `BurritoCliExample`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> BurritoCliExample.hello()
      :world

  """
  def hello do
    :world
  end

  @doc """
  Burrito cli entry point.
  """
  def start(_, _args) do
    IO.puts "#=> Application started !"

    args = Burrito.Util.Args.get_arguments()
    IO.puts("#=> Passed arguments: #{inspect(args)}")

    # TODO: Make a http request

    System.halt(0)
  end
end
