defmodule BinarySearchMatching do
  @moduledoc false

  def search(items, value), do: search(items, value, 0, tuple_size(items) - 1)

  defp search(items, value, bottom, top) do
    search(items, value, bottom, top, div(bottom + top, 2))
  end

  defp search(items, value, bottom, top, middle_idx) do
    search(items, value, bottom, top, middle_idx, elem(items, middle_idx))
  end

  defp search(_, value, _, _, middle_idx, middle_elmt) when value == middle_elmt do
    {:ok, middle_idx}
  end

  defp search(_, _, bottom, top, _, _) when bottom > top, do: :not_found

  defp search(items, value, _, top, middle_idx, middle_elmt) when middle_elmt < value do
    search(items, value, middle_idx + 1, top)
  end

  defp search(items, value, bottom, _, middle_idx, _middle_elmt) do
    search(items, value, bottom, middle_idx - 1)
  end
end
