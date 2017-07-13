defmodule Todo.Item do
  defstruct(
    id: nil,
    description: nil,
    completed: false
  )

  @type t :: %Todo.Item{
    id:          integer | nil,
    description: String.t,
    completed:   boolean
  }

  @spec new(String.t) :: t
  def new(description) do
    %__MODULE__{
      id: :rand.uniform(1_000_000_000),
      description: description
    }
  end
end
