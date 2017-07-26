defmodule Solutions.CollatzTest do
  use ExUnit.Case
  use Quixir

  import Solutions.Collatz

  @moduletag :collatz
  require Logger

  test "an empty list results in an empty list" do
    assert [] == step_count_for []
  end

  test "the results are well formed" do
    assert {1, 0} = step_count_for 1
  end
end
