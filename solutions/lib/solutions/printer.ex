defmodule Solutions.Printer do
  use GenServer

  @fruits ["🍉", "🍊", "🌽", "🍒", "🍇", "🌶"]

  # Public API
  def start_link do
    GenServer.start_link(__MODULE__, [])
  end

  def schedule, do: Process.send_after(self(), :print_fruit, 2000)

  def init(state) do
    schedule()
    {:ok, state}
  end


  def print_fruit, do: IO.puts("fruit: #{Enum.random(@fruits)}")


  def handle_info(:print_fruit, state) do
    schedule()
    print_fruit()
    {:noreply, state}
  end
end
