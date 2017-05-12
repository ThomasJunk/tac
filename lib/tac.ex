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

  def main([_,_]) do
    usage()
  end

  def main([filename]) do
    handle_file(filename)
  end

  def handle_file(filename) do
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
