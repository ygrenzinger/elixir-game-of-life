defmodule GameOfLife do
  @moduledoc """
  Documentation for GameOfLife.
  """

  @doc """
  Hello world.

  ## Examples

      iex> GameOfLife.isAliveWhenAliveNeighboursEqual(:ALIVE, 1)
      false

      iex> GameOfLife.isAliveWhenAliveNeighboursEqual(:DEAD, 3)
      true

  """
  def isAliveWhenAliveNeighboursEqual(:ALIVE, x) do
    x >= 2 && x <= 3
  end

  def isAliveWhenAliveNeighboursEqual(:DEAD, x) do
    x == 3
  end
end
