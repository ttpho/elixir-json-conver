defmodule Mix.Tasks.Jelixir do
  use Mix.Task

  # mix app.start
  # mix jelixir json book.json
  @impl Mix.Task
  def run(_args) do
    list_args = System.argv()
    Mix.shell().info("#{list_args}")

    if length(list_args) < 3 do
      nothing()
    else
      jelixir = Enum.at(list_args, 0)
      Mix.shell().info("#{jelixir}")
      task = Enum.at(list_args, 1)
      input_task = Enum.at(list_args, 2)

      work(task |> String.trim(), input_task |> String.trim())
    end
  end

  def work(task, input_task) do
    case task do
      "json" -> input_task |> JelixirLib.conver()
      _ -> nothing()
    end
  end

  def nothing, do: Mix.shell().info("Nothing to do! 🏝")
end
