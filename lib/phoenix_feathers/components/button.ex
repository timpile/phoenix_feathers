defmodule PhoenixFeathers.Button do
  @doc """
  Example

  ```
  <%= live_component @socket, PhoenixFeathers.Button, display_text: "Click me" %>
  ```
  """
  use PhoenixFeathers.LiveComponent

  def render(%{click_event: click_event} = assigns) do
    ~L"""
      <button
        class="phx_feathers_button"
        phx-click="<%= click_event %>"
      >
        <%= @display_text %>
      </button>
    """
  end

  def render(assigns) do
    ~L"""
      <button class="phx_feathers_button">
        <%= @display_text %>
      </button>
    """
  end
end
