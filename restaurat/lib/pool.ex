defmodule Restaurat.Pool do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, %{})
  end

  def worker(pid, id) do
    GenServer.call(pid, {:worker, id})
  end

  def handle_call({:worker, id}, _from, state) do
    case Map.get(state, id) do
      nil ->
        {:ok, new_worker} = Restaurat.WorkerSupervisor.start_worker
        {:reply, new_worker, Map.put(state, id, new_worker)}
      worker -> {:reply, worker, state}
    end
  end
end
