defmodule PhoenixFeathers.Card do
  use PhoenixFeathers.LiveComponent
  use Phoenix.HTML

  @doc """
  Example

  ```
  <%= live_component @socket, PhoenixFeathers.Card do %>
    <div>My card content</div>
  <% end %>
  ```
  """

  def render(%{inner_block: inner_block, click_event: click_event} = assigns) do
    ~L"""
      <div
        class="phx_feathers_card"
        phx-click="<%= click_event %>"
      >
        <%= render_block(inner_block) %>
      </div>
    """
  end

  def render(%{inner_block: inner_block} = assigns) do
    ~L"""
      <div class="phx_feathers_card">
        <%= render_block(inner_block) %>
      </div>
    """
  end
end
