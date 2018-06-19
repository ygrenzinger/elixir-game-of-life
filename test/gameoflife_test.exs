defmodule GameOfLifeTest do
  use ExUnit.Case
  doctest GameOfLife

  test "Any live cell with fewer than two live neighbors dies, as if by under population." do
    assert GameOfLife.isAliveWhenAliveNeighboursEqual(:ALIVE, 0) == false
    assert GameOfLife.isAliveWhenAliveNeighboursEqual(:ALIVE, 1) == false
  end

  test "Any live cell with two or three live neighbors lives on to the next generation" do
    assert GameOfLife.isAliveWhenAliveNeighboursEqual(:ALIVE, 2) == true
    assert GameOfLife.isAliveWhenAliveNeighboursEqual(:ALIVE, 3) == true
  end

  test "Any live cell with more than three live neighbors dies, as if by overpopulation" do
    Range.new(4, 8)
    |> Enum.map(fn x ->
      assert GameOfLife.isAliveWhenAliveNeighboursEqual(:ALIVE, x) == false
    end)
  end

  test "Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction" do
    assert GameOfLife.isAliveWhenAliveNeighboursEqual(:DEAD, 3) == true
    assert GameOfLife.isAliveWhenAliveNeighboursEqual(:DEAD, 2) == false
  end

  test "Any dead cell with less or more than three live neighbors stay dead" do
    Range.new(0, 2) |> Enum.map(fn x ->
      assert GameOfLife.isAliveWhenAliveNeighboursEqual(:DEAD, x) == false
    end)

    Range.new(4, 8) |> Enum.map(fn x ->
      assert GameOfLife.isAliveWhenAliveNeighboursEqual(:DEAD, x) == false
    end)
  end

end
