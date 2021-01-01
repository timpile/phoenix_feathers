defmodule Mix.Tasks.Phx.Feathers do
  use Mix.Task

  @version Mix.Project.config()[:version]

  def run([]), do: help()
  def run([help]) when help in ~w(-h --help), do: help()

  def run([version]) when version in ~w(-v --version) do
    Mix.shell().info("PhoenixFeathers v#{@version}")
  end

  def run([styles]) when styles in ~w(--styles) do
    {run_cmd?, source_path, destination_path} = confirm_copy_file("Generate")

    if run_cmd? do
      copy_message()
      File.cp!(source_path, destination_path, fn _, _ -> false end)
    end
  end

  def run([styles, _]) when styles in ~w(--styles --override) do
    {run_cmd?, source_path, destination_path} = confirm_copy_file("Generate or override")

    if run_cmd? do
      copy_message()
      File.cp!(source_path, destination_path, fn _, _ -> true end)
    end
  end

  defp confirm_copy_file(msg) do
    source_path = styles_source_path()
    destination_path = styles_destination_path()

    {
      Mix.shell().yes?("#{msg} #{destination_path}"),
      source_path,
      destination_path
    }
  end

  defp styles_source_path do
    dep_root = Path.split(__ENV__.file) -- ["lib", "mix", "tasks", "phx.feathers.ex"]
    Path.join(dep_root ++ ["assets", "css", "phoenix_feathers.scss"])
  end

  defp styles_destination_path do
    Path.join([File.cwd!(), "assets", "css", "phoenix_feathers.scss"])
  end

  defp copy_message do
    Mix.shell().info([:green, "* copying phoenix_feathers.scss to this project", :reset])
  end

  defp help do
    Mix.shell().info("""
    --help -h         Show this help manual
    --version -v      Check this version of PhoenixFeathers
    --styles          Copy phoenix_feathers.scss file to <root>/assets/css/
    --override        Use with --styles to override <root>/assets/css/phoenix_feathers.scss, if it exists
    """)
  end
end
