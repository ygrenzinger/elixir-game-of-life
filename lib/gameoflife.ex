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

  def livingNeighbors(grid, x, y) do
    coord = [{x-1, y-1}, {x, y-1}, {x+1, y-1}, 
             {x-1, y}, {x+1, y}, 
             {x-1, y+1}, {x, y+1}, {x+1, y+1}]
    cells = Enum.map(coord, &cellStatus(grid, &1))
    Enum.count(cells, &isAlive?(&1))
  end

  def cellStatus(grid, {x, y}) do
    row = Enum.at(grid, x)
    Enum.at(row, y)
  end

  def isAlive?(:ALIVE) do true end
  def isAlive?(:DEAD) do false end
end
