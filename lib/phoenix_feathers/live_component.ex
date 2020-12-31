defmodule PhoenixFeathers.LiveComponent do
  defmacro __using__(_opts) do
    quote do
      use Phoenix.LiveComponent
      use Phoenix.HTML
    end
  end
end
