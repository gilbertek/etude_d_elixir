main = self()
IO.puts("Main process: #{inspect(main)}")

spawn(fn() ->
  IO.puts("Worker process: #{inspect(self())}")
  Process.sleep(1_000)
  IO.puts("Done")
  send(main, :done)
end)


receive do
  :done ->
    IO.puts("Exiting")
end
