defmodule PhoenixFeathers.LiveComponent do
  defmacro __using__(_opts) do
    quote do
      use Phoenix.LiveComponent
      use Phoenix.HTML
      import PhoenixFeathers.Icon
    end
  end
end
