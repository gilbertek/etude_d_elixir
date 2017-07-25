defmodule Solutions.DemoServer do
  @moduledoc false
  def listen(port) do
    opts = [:binary, {:reuseaddr, true}, {:active, false}]
    :gen_tcp.listen(port, opts)
  end

  def echo_client(socket) do
    {:ok, connection} = :gen_tcp.accept(socket)

    case :gen_tcp.recv(connection, 0) do
      {:ok, "<CRASH>" <> _} ->
        raise "crash"
      {:ok, message} ->
        :ok = :gen_tcp.send(connection, message)
        {:ok, message}
    end
  end
end

defmodule Solutions.DemoServerRunner do
  @moduledoc false

  def blocking_calls() do
    spawn(fn() ->
      {:ok, socket} = Solutions.DemoServer.listen(8080)
      {:ok, message} = Solutions.DemoServer.echo_client(socket)
      IO.puts(message)
      :ok
    end)
  end

  def preemptive_scheduling() do
    spawn(fn() ->
      {:ok, socket} = Solutions.DemoServer.listen(8080)

      spawn(fn() ->
        Solutions.DemoServer.echo_client(socket)
      end)

      endless_stream = Stream.cycle([1, 2, 3, 4, 5])
      for value <- endless_stream do
        IO.puts(value)
      end

      :timer.sleep(:infinity)
    end)
  end

  def lightweight_processes() do
    spawn(fn() ->

      {:ok, socket} = Solutions.DemoServer.listen(8080)

      for _ <- 1..100_000 do
        spawn(fn() ->
          Solutions.DemoServer.echo_client(socket)
        end)
      end

      for max <- 1..100_000 do
        spawn(fn() ->
          for j <- Stream.cycle(1..max) do
            IO.puts(j)
          end
        end)
      end
    end)
  end

  def fault_tolerant() do
    {:ok, socket} = Solutions.DemoServer.listen(8080)

    for i <- 1..10 do
      spawn(fn() ->

        if rem(1, 2) == 0 do
          1 / 0
        end

        Solutions.DemoServer.echo_client(socket)
      end)
    end
  end

  def failure_propagation() do
    spawn(fn() ->

      {:ok, socket} = Solutions.DemoServer.listen(8080)

      for _ <- 1..10 do
        spawn_link(fn() ->
          Solutions.DemoServer.echo_client(socket)
        end)
      end

      :timer.sleep(:infinity)
    end)
  end

  def failure_handling() do
    spawn(fn() ->

      {:ok, socket} = Solutions.DemoServer.listen(8080)

      for _ <- 1..10 do
        spawn_link(fn() ->
          Solutions.DemoServer.echo_client(socket)
        end)
      end

      Process.flag(:trap_eixt, true)

      receive do
        message ->
          IO.inspect(message)
      end
    end)
  end
end
