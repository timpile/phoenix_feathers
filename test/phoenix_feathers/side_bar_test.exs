defmodule PhoenixFeathers.SideBarTest do
  use ExUnit.Case
  use PhoenixFeathers.LiveViewTest

  @open_icon ~s|<svg viewbox="0 0 20 20"><path fill="#fff" d="M12.95 10.707l.707-.707L8 4.343 6.586 5.757 10.828 10l-4.242 4.243L8 15.657l4.95-4.95z"></path></svg>|

  @close_icon ~s|<svg viewbox="0 0 20 20"><path fill="#fff" d="M7.05 9.293L6.343 10 12 15.657l1.414-1.414L9.172 10l4.242-4.243L12 4.343z"></path></svg>|

  defmodule MockLiveView do
    use Phoenix.LiveView

    def render(assigns) do
      ~L"""
      <%= live_component @socket,
          PhoenixFeathers.SideBar,
          id: "phoenix_feathers_side_bar",
          is_open: false
        do %>
        <div>My side nav content</div>
      <% end %>
      """
    end
  end

  test "render a closed side bar component", %{conn: conn} do
    {:ok, _view, html} = live_isolated(conn, MockLiveView)

    assert html =~ ~s|class="phx_feathers_side_bar" data-is-open="false"|
    assert html =~ @open_icon
    assert html =~ ~s|<div>My side nav content</div>|
  end

  test "side bar component opens on click event", %{conn: conn} do
    {:ok, view, _html} = live_isolated(conn, MockLiveView)

    html = element(view, ".toggle_icon") |> render_click(%{toggle_side_bar: "1"})

    assert html =~ ~s|class="phx_feathers_side_bar" data-is-open="true"|
    assert html =~ @close_icon
    assert html =~ ~s|<div>My side nav content</div>|
  end
end
