defmodule PhoenixFeathers.TopNav do
  use PhoenixFeathers.LiveComponent

  @doc """
  Example

  ```
  <%= live_component @socket,
    PhoenixFeathers.TopNav,
    home: %{url: "/", title: "Home", logo_src: "/path/to/logo.svg"},
    nav_items: [%{url: "/", text: "Link 1"}, %{url: "/", text: "Link 2"}]
  %>
  ```
  """

  def render(assigns) do
    ~L"""
      <nav class="phx_feathers_top_nav">
        <div class="left">
          <a href="<%= @home.url %>">
            <img src="<%= @home.logo_src %>">
            <span class="title"><%= @home.title %></span>
          </a>
        </div>
        <div class="right">
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
    {:ok, socket |> assign(assigns)}
  end
end
