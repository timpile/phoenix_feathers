defmodule PhoenixFeathers.CardTest do
  use ExUnit.Case

  import Phoenix.LiveViewTest

  @endpoint Endpoint

  setup _tags do
    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end

  defmodule TestLiveView do
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
    {:ok, _view, html} = live_isolated(conn, TestLiveView)

    assert html =~ ~s|<div>Inner block</div>|
  end
end
