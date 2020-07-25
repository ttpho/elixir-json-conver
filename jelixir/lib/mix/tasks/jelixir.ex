defmodule Mix.Tasks.Jelixir do
  use Mix.Task

  # mix app.start
  # mix jelixir json book.json
  # mix jelixir phx.gen book.json
  @impl Mix.Task
  def run(_args) do
    list_args = System.argv()

    if length(list_args) < 3 do
      nothing()
    else
      jelixir = Enum.at(list_args, 0) |> String.to_atom()
      re_work(jelixir, list_args)
    end
  end

  def re_work(:jelixir, list_args) do
    task = Enum.at(list_args, 1) |> String.trim() |> String.to_atom()
    input_task = Enum.at(list_args, 2) |> String.trim()
    work(task, input_task)
  end

  def re_work(_jelixir, _list_args) do
    nothing()
  end

  def work(:json, input_task) do
    input_task |> JelixirLib.conver()
  end

  def work(:gen, input_task) do
    input_task |> JelixirLib.conver()
  end

  def work(:phx_gen, _input_task) do
    nothing()
  end

  def work(_task, _input_task) do
    nothing()
  end

  def nothing, do: Mix.shell().info("Nothing to do! 🏝")
end
