defmodule PhoenixFeathers.CardTest do
  use ExUnit.Case
  use PhoenixFeathers.LiveViewTest

  defmodule MockLiveView do
    use Phoenix.LiveView

    def render(assigns) do
      ~L"""
        <%= live_component @socket, PhoenixFeathers.Card do %>
          <div>Inner block</div>
        <% end %>
      """
    end
  end

  test "render a basic card component", %{conn: conn} do
    {:ok, _view, html} = live_isolated(conn, MockLiveView)

    assert html =~ ~s|<div>Inner block</div>|
  end
end
