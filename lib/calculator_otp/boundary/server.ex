defmodule CalculatorOtp.Boundary.Server do
  use GenServer
  alias CalculatorOtp.Core, as: Core

  @doc """
  Spawn a process linked back to this one, under the name of
  this module
  """
  def start_link(initial_state) when is_integer(initial_state) do
    GenServer.start_link(__MODULE__, initial_state)
  end

  def init(0) do
    {:ok, 0}
  end

  @doc """
  callback which handles the core operations
  IMPORTANTE: cada callback implementa uma das
  clauses do receive da boundary sem OTP
  """
  def handle_cast({:add, number}, state) do
    {:noreply, Core.add(state, number)}
  end

  def handle_cast({:subtract, number}, state) do
    {:noreply, Core.subtract(state, number)}
  end

  def handle_cast({:multiply, number}, state) do
    {:noreply, Core.multiply(state, number)}
  end

  def handle_cast({:divide, number}, state) do
    {:noreply, Core.divide(state, number)}
  end

  def handle_cast({:inc}, state) do
    {:noreply, Core.inc(state)}
  end

  def handle_cast({:dec}, state) do
    {:noreply, Core.dec(state)}
  end

  def handle_cast({:clear}, _state) do
    {:noreply, 0}
  end

  def handle_call(:state, _from, state) do
    {:reply, state, state}
  end

  @doc """
  Aqui, criaremos a api, q costumeiramente, em elixir,
  fica dentro do genserver
  """
  def inc(pid), do: GenServer.cast(pid, {:inc})
  def dec(pid), do: GenServer.cast(pid, {:dec})
  def add(pid, n), do: GenServer.cast(pid, {:add, n})
  def clear(pid, n), do: GenServer.cast(pid, {:clear, n})
  def divide(pid, n), do: GenServer.cast(pid, {:divide, n})
  def subtract(pid, n), do: GenServer.cast(pid, {:subtract, n})
  def multiply(pid, n), do: GenServer.cast(pid, {:multiply, n})

  def state(pid), do: GenServer.call(pid, :state)
end
