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
  def isAliveWhenAliveNeighboursEqual(:ALIVE, livingNeighbors) do
    livingNeighbors >= 2 && livingNeighbors <= 3
  end

  def isAliveWhenAliveNeighboursEqual(:DEAD, livingNeighbors) do
    livingNeighbors == 3
  end

  def livingNeighbors(grid, row, col) do
    coord = [{row-1, col-1}, {row, col-1}, {row+1, col-1}, 
             {row-1, col}, {row+1, col}, 
             {row-1, col+1}, {row, col+1}, {row+1, col+1}]
    cells = Enum.map(coord, &cellStatus(grid, &1))
    Enum.count(cells, &isAlive?(&1))
  end

  def cellStatus(grid, {row, col}) do
    if isInGrd(grid, {row, col}) do
      row = Enum.at(grid, row)
      Enum.at(row, col)
    else
      :DEAD
    end
  end

  defp isInGrd(grid, {row, col}) do
    height = length(grid)
    width = length(Enum.at(grid, 0))
    row >= 0 && row < height && col >=0 && col < width
  end

  def isAlive?(:ALIVE) do true end
  def isAlive?(:DEAD) do false end

  def nextGen(grid) do
    Enum.with_index(grid) |> Enum.map(&rowGen(&1, grid))
  end

  defp rowGen({row, rowIndex}, grid) do
    Enum.with_index(row) |> Enum.map(&nextGenCell(&1, rowIndex, grid))
  end

  def nextGenCell({cellState, colIndex}, rowIndex, grid) do
    if isAliveWhenAliveNeighboursEqual(cellState, livingNeighbors(grid, rowIndex, colIndex)) do
      :ALIVE
    else
      :DEAD
    end
  end

end
