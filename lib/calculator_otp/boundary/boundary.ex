defmodule CalculatorOtp.Boundary do
  alias CalculatorOtp.Core, as: Core

  def start,
    do: spawn(fn -> run(0) end)

  def run_op(server_pid, {op, number}) do
    send(server_pid, {op, number})
  end

  def run(state),
    do: state |> loop() |> run()

  def alive?(server_pid), do: Process.alive?(server_pid)

  def loop(state) do
    receive do
      {:add, number} ->
        Core.add(state, number)

      {:divide, number} ->
        Core.divide(state, number)

      {:multiply, number} ->
        Core.multiply(state, number)

      {:subtract, number} ->
        Core.subtract(state, number)

      :clear ->
        0

      {:state, caller_pid} ->
        send(caller_pid, {:state, state})
        state
    end
  end
end
