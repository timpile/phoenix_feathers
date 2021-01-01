defmodule PhoenixFeathers.ButtonTest do
  use ExUnit.Case

  import Phoenix.LiveViewTest

  @endpoint Endpoint

  test "render a basic button component" do
    html =
      render_component(
        PhoenixFeathers.Button,
        display_text: "Click me"
      )

    assert html =~ """
             <button class="phx_feathers_button">
               Click me
             </button>
           """
  end

  test "render a button component with a click event" do
    html =
      render_component(
        PhoenixFeathers.Button,
        display_text: "Click me",
        click_event: "button_clicked"
      )

    assert html =~ """
             <button
               class="phx_feathers_button"
               phx-click="button_clicked"
             >
               Click me
             </button>
           """
  end
end
