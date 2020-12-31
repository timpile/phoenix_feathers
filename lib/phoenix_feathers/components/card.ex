defmodule PhoenixFeathers.Card do
  use PhoenixFeathers.LiveComponent
  use Phoenix.HTML

  def render(%{inner_block: inner_block, click_event: click_event} = assigns) do
    ~L"""
      <div
        phx-click="<%= click_event %>"
      >
        <%= render_block(inner_block) %>
      </div>
    """
  end

  def render(%{inner_block: inner_block} = assigns) do
    ~L"""
      <div>
        <%= render_block(inner_block) %>
      </div>
    """
  end
end
