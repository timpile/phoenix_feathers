defmodule PhoenixFeathers.Button do
  use PhoenixFeathers.LiveComponent

  def render(%{click_event: click_event} = assigns) do
    ~L"""
      <button
        phx-click="<%= click_event %>"
      >
        <%= @display_text %>
      </button>
    """
  end

  def render(assigns) do
    ~L"""
      <button>
        <%= @display_text %>
      </button>
    """
  end
end
