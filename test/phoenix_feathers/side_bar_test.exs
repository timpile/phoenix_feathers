defmodule PhoenixFeathers.SideBarTest do
  use ExUnit.Case
  use PhoenixFeathers.LiveViewTest

  defmodule MockLiveView do
    use Phoenix.LiveView

    def render(assigns) do
      ~L"""
      <%= live_component @socket,
          PhoenixFeathers.SideBar,
          id: "phoenix_feathers_side_bar",
          is_open: false,
          open_icon_path: "/path/to/open-icon.svg",
          close_icon_path: "/path/to/close-icon.svg"
        do %>
        <div>My side nav content</div>
      <% end %>
      """
    end
  end

  test "render a closed side bar component", %{conn: conn} do
    {:ok, _view, html} = live_isolated(conn, MockLiveView)

    assert html =~ ~s|class="phx_feathers_side_bar" data-is-open="false"|
    assert html =~ ~s|<img src="/path/to/open-icon.svg"/>|
    assert html =~ ~s|<div>My side nav content</div>|
  end

  test "side bar component opens on click event", %{conn: conn} do
    {:ok, view, _html} = live_isolated(conn, MockLiveView)

    html = element(view, ".toggle_icon") |> render_click(%{toggle_side_bar: "1"})

    assert html =~ ~s|class="phx_feathers_side_bar" data-is-open="true"|
    assert html =~ ~s|<img src="/path/to/close-icon.svg"/>|
    assert html =~ ~s|<div>My side nav content</div>|
  end
end
