defmodule TodoServerTest do
  use ExUnit.Case

  alias Todo.Server

  setup do
    on_exit fn ->
      Enum.each Server.lists, fn(list) ->
        Server.delete_list(list)
      end
    end
  end

  test ".add_list adds a new supervised todo list" do
    Server.add_list("Home")
    Server.add_list("Work")

    counts = Supervisor.count_children(Server)

    assert counts.active == 2
  end

  test ".find_list gets a list by its name" do
    Server.add_list("find_by_name")
    list = Server.find_list("find_by_name")

    assert is_pid(list)
  end

  test ".delete deletes a list by its name" do
    Server.add_list("delete_me")
    list = Server.find_list("delete_me")

    Server.delete_list(list)
    counts = Supervisor.count_children(Server)

    assert counts.active == 0
  end
end
