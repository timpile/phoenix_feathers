defmodule PhoenixFeathers.SideBar do
  use PhoenixFeathers.LiveComponent

  @doc """
  Example

  ```
  <%= live_component @socket,
      PhoenixFeathers.SideBar,
      id: "phoenix_feathers_side_bar",
      is_open: false
    do %>

    <div>
      My inner content
    </div>

  <% end %>
  ```

  ```
  <%= live_component @socket,
      PhoenixFeathers.SideBar,
      id: "phoenix_feathers_side_bar",
      is_open: false,
      open_icon_path: "/path/to/open-icon.svg",
      close_icon_path: "/path/to/close-icon.svg"
    do %>

    <div>
      My inner content
    </div>

  <% end %>
  ```
  """

  def render(%{open_icon_path: open_icon, close_icon_path: close_icon} = assigns) do
    ~L"""
      <div class="phx_feathers_side_bar" data-is-open="<%= @is_open %>">
        <div class="top">
          <a
            href="#"
            phx-click="toggle_side_bar"
            phx-target="<%= @myself %>"
            class="toggle_icon"
          >
            <img src='<%= toggle_icon(@is_open, open_icon, close_icon) %>'>
          </a>
        </div>
        <div class="side_bar_content">
          <%= render_block(@inner_block) %>
        </div>
      </div>
    """
  end

  def render(assigns) do
    ~L"""
      <div class="phx_feathers_side_bar" data-is-open="<%= @is_open %>">
        <div class="top">
          <a
            href="#"
            phx-click="toggle_side_bar"
            phx-target="<%= @myself %>"
            class="toggle_icon"
          >
            <%= toggle_icon(@is_open) %>
          </a>
        </div>
        <div class="side_bar_content">
          <%= render_block(@inner_block) %>
        </div>
      </div>
    """
  end

  def mount(socket) do
    {:ok, socket}
  end

  def update(assigns, socket) do
    {:ok, socket |> assign(assigns)}
  end

  def handle_event("toggle_side_bar", _params, %{assigns: %{is_open: is_open}} = socket) do
    {:noreply, socket |> assign(is_open: !is_open)}
  end

  defp toggle_icon(true), do: "X"
  defp toggle_icon(false), do: ">"
  defp toggle_icon(true, _open_icon, close_icon), do: close_icon
  defp toggle_icon(false, open_icon, _close_icon), do: open_icon
end
