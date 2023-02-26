defmodule CalculatorOtp do
  alias CalculatorOtp.Boundary, as: Boundary

  def start,
    do: Boundary.start()

  def clear(calculator), do: send(calculator, :clear)
  def add(calculator, n), do: send(calculator, {:add, n})
  def divide(calculator, n), do: send(calculator, {:divide, n})
  def multiply(calculator, n), do: send(calculator, {:multiply, n})
  def subtract(calculator, n), do: send(calculator, {:subtract, n})

  def state(calculator) do
    send(calculator, {:state, self()})

    receive do
      {:state, state} ->
        state
    after
      5000 ->
        {:error, :timeout}
    end
  end
end
