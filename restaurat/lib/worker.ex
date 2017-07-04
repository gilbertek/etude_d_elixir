defmodule Restaurat.Worker do
  use GenServer

  def start_link(name \\ []) do
    GenServer.start_link(__MODULE__, name, [])
  end

  def call_action(pid, action_handler, argument \\ nil) do
    GenServer.call(pid, {:call_action, action_handler, argument})
  end

  # Server API
  def handle_call({:call_action, action_handler, argument}, from, state) do
    Process.send_after(self(), :try_running, 0)
    action = {action_handler, argument, from}
    {:noreply, [action | state]}
  end

  def handle_info(:try_running, []), do: {:noreply, []}
  def handle_info(:try_running, [{action_handler, _, _} | _] = state) do
    relevant_action? = fn({handler, _, _}) -> handler == action_handler end
    relevant_actions = Enum.filter(state, relevant_action?)

    arguments = Enum.map(relevant_actions, fn({_, arg, _}) -> arg end) |> Enum.reverse
    response = action_handler.(arguments)
    Enum.each(relevant_actions, fn({_, _, from}) -> GenServer.reply(from, response) end)
    {:noreply, Enum.reject(state, relevant_action?)}
  end
end
