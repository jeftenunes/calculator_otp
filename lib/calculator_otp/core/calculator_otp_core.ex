defmodule CalculatorOtp.Core do
  def do_work(state) do
    IO.inspect(state)
    state
  end

  def do_another_work(state) do
    IO.inspect(state)
    state
  end

  def add(acc, number), do: acc + number
  def divide(acc, number), do: acc / number
  def subtract(acc, number), do: acc - number
  def multiply(acc, number), do: acc * number

  def inc(acc), do: acc + 1
  def dec(acc), do: acc - 1
  def negate!(acc), do: acc * -1

  def fold(list, acc, f),
    do: Enum.reduce(list, acc, fn item, acc -> &f.(&2, &1) end)
end
