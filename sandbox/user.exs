defmodule User do
  defstruct name: nil, email: nil

  import String, only: [split: 1]
  import List, only: [first: 1, last: 1]

  def first_name(user) do
    user.name
    |> split
    |> first
  end

  def last_name(user) do
    user.name
    |> split
    |> last
  end
end
