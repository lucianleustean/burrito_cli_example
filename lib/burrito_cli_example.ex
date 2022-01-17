defmodule BurritoCliExample do
  @moduledoc """
  Documentation for `BurritoCliExample`.
  """
  use Tesla

  plug(Tesla.Middleware.BaseUrl, "http://quotes.stormconsultancy.co.uk/")
  plug(Tesla.Middleware.Headers, [{"accept", "application/json"}])
  plug(Tesla.Middleware.JSON)

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
    IO.puts("#=> Application started !")

    args = Burrito.Util.Args.get_arguments()
    IO.puts("#=> Passed arguments: #{inspect(args)}")

    IO.puts("#=> GET http://quotes.stormconsultancy.co.uk/random")

    get("/random")
    |> case do
      {:ok, response} -> response.body
      {:error, error} -> error
    end
    |> IO.inspect()

    System.halt(0)
  end
end
