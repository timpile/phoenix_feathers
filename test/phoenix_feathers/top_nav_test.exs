defmodule PhoenixFeathers.TopNavTest do
  use ExUnit.Case
  use PhoenixFeathers.LiveViewTest

  defmodule MockLiveView do
    use Phoenix.LiveView

    def render(assigns) do
      ~L"""
      <%= live_component @socket,
        PhoenixFeathers.TopNav,
        id: "phoenix_feathers_top_nav",
        brand: %{url: "/", title: "Brand", logo_src: "/path/to/logo.svg"},
        nav_items: [
          %{url: "/link-1", text: "Link 1"},
          %{url: "/link-2", text: "Link 2"}
        ]
      %>
      """
    end
  end

  test "render a top nav component", %{conn: conn} do
    {:ok, _view, html} = live_isolated(conn, MockLiveView)

    assert html =~ ~s|<nav data-phx-component="1" class="phx_feathers_top_nav">|
    assert html =~ ~s|<div class="brand"><a href="/"><img src="/path/to/logo.svg"/>|
    assert html =~ ~s|<span class="title">Brand</span>|
    assert html =~ ~s|<div class="menu" data-is-mobile-open="false">|
  end

  test "top nav component mobile menu opens on click event", %{conn: conn} do
    {:ok, view, _html} = live_isolated(conn, MockLiveView)

    html = element(view, ".toggle_mobile_menu") |> render_click(%{toggle_mobile_menu: "1"})

    assert html =~ ~s|<div class="menu" data-is-mobile-open="true">|
  end
end
