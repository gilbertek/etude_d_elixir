defmodule Restaurat.PoolTest do
  use ExUnit.Case

  setup_all do
    Restaurat.WorkerSupervisor.start_link
    :ok
  end

  setup do
    {:ok, pid} = Restaurat.Pool.start_link
    [pool_id: pid]
  end

  test "it responds with a worker", %{pool_id: pid} do
    assert is_pid(Restaurat.Pool.worker(pid, "xxx"))
  end

  test "it responds with the same worker when asked twice with the same id", %{pool_pid: pid} do
    assert Restaurat.Pool.worker(pid, "xxx") == Restaurat.Pool.worker(pid, "xxx")
  end

  test "it responds with different workers when asked twice with different ids", %{pool_pid: pid} do
    assert Restaurat.Pool.worker(pid, "xxx") != Restaurat.Pool.worker(pid, "yyy")
  end

  test "pool and other workers are not killed when one worker is killed", %{pool_pid: pid} do
    w1 = Restaurat.Pool.worker(pid, "xxx")
    w2 = Restaurat.Pool.worker(pid, "yyy")

    Process.exit(w1, :shutdown)
    ref = Process.monitor(w1)
    assert_receive {:DOWN, ^ref, _, _, _}

    assert Process.alive?(pid)
    assert Process.alive?(w2)
    refute Process.alive?(w1)

    assert w1 != Restaurat.Pool.worker(pid, "xxx")
    assert w2 == Restaurat.Pool.worker(pid, "yyy")
  end
end
