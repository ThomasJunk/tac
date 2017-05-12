defmodule Tac.CLI do
  @moduledoc """
  Documentation for Tac.
  """

  @doc """
  Tac.

  ## Examples
    tac mix.exs

  """
  def main([]) do
    usage()
  end

  def main(args) do
    args |> (&(Enum.map(&1, fn file -> handle(file) end))).()
  end

  def handle(filename) do
    with {:ok, content} <- File.read(filename)
    do
      reverse(content)
    else
      err -> IO.puts("Error! #{err}")
    end
  end

  def reverse(content) do
    String.split(content, "\n")
    |> (&(Enum.reverse(&1))).()
    |> (&(Enum.map(&1, fn x -> IO.puts(x) end))).()
  end

  def usage() do
    IO.puts("tac $filename")
  end
end
