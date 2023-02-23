defmodule CalculatorOtp do
  alias CalculatorOtp.Core, as: Core

  def start(initial_state) do
    spawn(fn -> run(initial_state) end)
  end

  def run(state) do
    state
    |> Core.do_work()
    |> run()
  end

  def loop(state) do
    receive do
      :some_message ->
        Core.do_work(state)

      :another_message ->
        Core.do_another_work(state)
    end

    loop(state)
  end
end
