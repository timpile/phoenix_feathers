defmodule PhoenixFeathers.TopNav do
  use PhoenixFeathers.LiveComponent

  alias PhoenixFeathers.Icon

  @doc """
  Example

  ```
  <%= live_component @socket,
    PhoenixFeathers.TopNav,
    id: "phoenix_feathers_top_nav",
    brand: %{url: "/", title: "Brand", logo_src: "/path/to/logo.svg"},
    nav_items: [%{url: "/", text: "Link 1"}, %{url: "/", text: "Link 2"}]
  %>
  ```
  """

  def render(assigns) do
    ~L"""
      <nav class="phx_feathers_top_nav">
        <div class="brand">
          <a href="<%= @brand.url %>">
            <img src="<%= @brand.logo_src %>">
            <span class="title"><%= @brand.title %></span>
          </a>
        </div>
        <div class="menu" data-is-mobile-open="<%= @is_mobile_open %>">
          <div class="mobile_menu">
            <a
              href="#"
              class="toggle_mobile_menu"
              phx-click="toggle_mobile_menu"
              phx-target="<%= @myself %>"
            >
              <%= toggle_icon(assigns, @is_mobile_open) %>
            </a>
          </div>
          <ul>
            <%= for item <- @nav_items do %>
              <li>
                <a href="<%= item.url %>"><%= item.text %></a>
              </li>
            <% end %>
          </ul>
        </div>
      </nav>
    """
  end

  def mount(socket) do
    {:ok, socket}
  end

  def update(assigns, socket) do
    {:ok, socket |> assign(assigns) |> assign(is_mobile_open: false)}
  end

  def handle_event(
        "toggle_mobile_menu",
        _params,
        %{assigns: %{is_mobile_open: is_mobile_open}} = socket
      ) do
    {:noreply, socket |> assign(is_mobile_open: !is_mobile_open)}
  end

  defp toggle_icon(assigns, true), do: render(assigns, %Icon{name: :close, color: "#fff"})
  defp toggle_icon(assigns, false), do: render(assigns, %Icon{name: :menu, color: "#fff"})
end
