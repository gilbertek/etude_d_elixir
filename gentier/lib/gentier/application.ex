defmodule Gentier.Application do
  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    # Starts a worker by calling: Gentier.Worker.start_link(arg1, arg2, arg3)
    children = [
      worker(Gentier.Producer, [0]),
      worker(Gentier.ProducerConsumer, []),
      worker(Gentier.Consumer, [], id: :a),
      worker(Gentier.Consumer, [], id: :b),
      worker(Gentier.Consumer, [], id: :c),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Gentier.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
