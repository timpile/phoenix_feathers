defmodule PhoenixFeathers.LiveComponentTest do
  use ExUnit.Case

  import Phoenix.LiveViewTest

  @endpoint Endpoint

  defmodule BasicComponent do
    use PhoenixFeathers.LiveComponent

    def render(assigns) do
      ~L"""
        <div>Hello <%= @name %></div>
      """
    end
  end

  test "render a basic component" do
    assert render_component(BasicComponent, name: "Tim") =~ "<div>Hello Tim</div>"
  end

  defmodule UpdatedComponent do
    use PhoenixFeathers.LiveComponent

    def render(assigns) do
      ~L"""
        <div>Hello <%= @name %></div>
      """
    end

    def mount(socket) do
      {:ok, socket}
    end

    def update(_assigns, socket) do
      {:ok, socket |> assign(name: "Boston")}
    end
  end

  test "render an updated component" do
    assert render_component(UpdatedComponent, name: "Tim") =~ "<div>Hello Boston</div>"
  end
end
