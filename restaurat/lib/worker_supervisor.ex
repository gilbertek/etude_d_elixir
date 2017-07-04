defmodule Restaurat.WorkerSupervisor do
  use Supervisor

  @name Restaurat.WorkerSupervisor

  def start_worker do
    Supervisor.start_child(@name, [])
  end

  # Supervisor API
  def start_link do
    Supervisor.start_link(__MODULE__, :ok, name: @name)
  end

  def init(_) do
    children = [
      worker(Restaurat.Worker, [], restart: :transient)
    ]

    supervise(children, strategy: :simple_one_for_one)
  end
end
