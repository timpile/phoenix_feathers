defmodule PhoenixFeathers.ToolTipTest do
  use ExUnit.Case
  use PhoenixFeathers.LiveViewTest

  defmodule MockLiveView do
    use Phoenix.LiveView

    def render(assigns) do
      ~L"""
      <%= live_component @socket, PhoenixFeathers.ToolTip,
          text: "Help text",
          position: :right,
          classes: "my-css-class"
        do %>
        <div>Hover over me.</div>
      <% end %>
      """
    end
  end

  test "render a tool tip component", %{conn: conn} do
    {:ok, _view, html} = live_isolated(conn, MockLiveView)

    assert html =~ ~s|<div>Hover over me.</div>|
    assert html =~ ~s|<div class="tool_tip -right">|
    assert html =~ ~s|Help text|
    assert html =~ ~s|<div class="phx_feathers_tool_tip my-css-class">|
  end
end
