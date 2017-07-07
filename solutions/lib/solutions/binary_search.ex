defmodule BinarySearch do
  def search(items, value) do
    search(items, value, 0, tuple_size(items) - 1)
  end

  defp search(items, value, bottom, top) do
    middle_idx = div(bottom + top, 2)
    middle_elmt = elem(items, middle_idx)

    cond do
      bottom > top         -> :not_found
      middle_elmt == value -> {:ok, middle_idx}
      middle_elmt < value  -> search(items, value, middle_idx + 1, top)
      true                 -> search(items, value, bottom, middle_idx - 1)
    end
  end
end
