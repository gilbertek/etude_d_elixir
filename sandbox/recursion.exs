defmodule MyList do
  def length(list) do
    length(list, 0)
  end

  defp length([], count) do
    count
  end

  defp length([_|t], count) do
    length(t, count + 1)
  end

  def each([], fun) do
    :ok
  end

  def each([h|t], fun) do
    fun.(h)
    each(t, fun)
  end

  def map(list, fun) do
    do_map(list, fun, [])
  end

  defp do_map([], __fun, acc) do
    :lists.reverse(acc)
  end

  defp do_map([h|t], fun, acc) do
    result = fun.(h)
    acc = [result | acc]
    do_map(t, fun, acc)
  end

  def sum(list) do
    sum(list, 0)
  end

  defp sum([], acc) do
    acc
  end

  defp sum([h|t], acc) do
    acc = acc + h
    sum(t, acc)
  end

  def reverse([]) do
    :ok
  end

  def reverse(list) do
    do_reverse(list, [])
  end

  defp do_reverse([], acc) do
    acc
  end

  defp do_reverse([h|t], acc) do
    do_reverse(t, [h | acc])
  end
end
