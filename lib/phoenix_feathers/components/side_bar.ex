defmodule PhoenixFeathers.SideBar do
  use PhoenixFeathers.LiveComponent

  alias PhoenixFeathers.Icon

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
      open_icon: %PhoenixFeathers.Icon{name: :menu, color: "#fff"},
      close_icon: %PhoenixFeathers.Icon{name: :cheveron_left, color: "#fff"}
    do %>

    <div>
      My inner content
    </div>

  <% end %>
  ```
  """

  def render(%{open_icon: open_icon, close_icon: close_icon} = assigns) do
    ~L"""
      <div class="phx_feathers_side_bar" data-is-open="<%= @is_open %>">
        <div class="top">
          <a
            href="#"
            phx-click="toggle_side_bar"
            phx-target="<%= @myself %>"
            class="toggle_icon"
          >
            <%= toggle_icon(assigns, @is_open, open_icon, close_icon) %>
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
            <%= toggle_icon(assigns, @is_open) %>
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

  defp toggle_icon(assigns, true), do: svg(assigns, default_icon(:close))
  defp toggle_icon(assigns, false), do: svg(assigns, default_icon(:open))
  defp toggle_icon(assigns, true, _open_icon, close_icon), do: svg(assigns, close_icon)
  defp toggle_icon(assigns, false, open_icon, _close_icon), do: svg(assigns, open_icon)

  defp default_icon(:close), do: %Icon{name: :cheveron_left, color: "#fff"}
  defp default_icon(:open), do: %Icon{name: :cheveron_right, color: "#fff"}
end
