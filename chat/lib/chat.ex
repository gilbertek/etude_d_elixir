defmodule Chat do
  @moduledoc """
  Documentation for Chat.
  """
  use Application

  def start(_type, _args) do
    Chat.Supervisor.start_link
  end
end
