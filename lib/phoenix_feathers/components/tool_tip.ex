defmodule PhoenixFeathers.ToolTip do
  use PhoenixFeathers.LiveComponent

  @doc """
  Example:

  <%= live_component @socket, PhoenixFeathers.ToolTip,
      text: "My tool tip help text.",
      position: :right
    do %>
    <div>My content here.</div>
  <% end %>
  """

  def render(%{classes: classes} = assigns) do
    ~L"""
      <div class="phx_feathers_tool_tip <%= classes %>">
        <%= render_block(@inner_block) %>
        <div class="tool_tip <%= position(@position) %>">
          <div class="help_text">
            <%= @text %>
          </div>
        </div>
      </div>
    """
  end

  def render(assigns), do: render(Map.put(assigns, :classes, ""))

  def mount(socket) do
    {:ok, socket}
  end

  defp position(:top_right), do: "-top-right"
  defp position(:top_left), do: "-top-left"
  defp position(:bottom_right), do: "-bottom-right"
  defp position(:bottom_left), do: "-bottom-left"
  defp position(:right), do: "-right"
  defp position(:left), do: "-left"
end
