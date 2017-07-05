defmodule Restaurat.WorkerSupervisor do
  use Supervisor

  @name Restaurat.WorkerSupervisor

  def start_worker(pid) do
    Supervisor.start_child(pid, [])
  end

  # Supervisor API
  def start_link(opts \\ []) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    children = [
      worker(Restaurat.Worker, [])
    ]

    supervise(children, strategy: :simple_one_for_one)
  end
end
