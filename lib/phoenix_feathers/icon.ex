defmodule PhoenixFeathers.Icon do
  import Phoenix.LiveView.Helpers

  defstruct [:name, :color]

  def render(assigns, %PhoenixFeathers.Icon{} = icon) do
    ~L"""
    <span class="phx_feathers_icon">
      <%= svg(assigns, icon) %>
    </span>
    """
  end

  def svg(assigns, %PhoenixFeathers.Icon{name: :cheveron_left, color: color}) do
    ~L"""
    <svg viewBox="0 0 20 20"><path fill="<%= color %>" d="M7.05 9.293L6.343 10 12 15.657l1.414-1.414L9.172 10l4.242-4.243L12 4.343z"/></svg>
    """
  end

  def svg(assigns, %PhoenixFeathers.Icon{name: :cheveron_right, color: color}) do
    ~L"""
    <svg viewBox="0 0 20 20"><path fill="<%= color %>" d="M12.95 10.707l.707-.707L8 4.343 6.586 5.757 10.828 10l-4.242 4.243L8 15.657l4.95-4.95z"/></svg>
    """
  end

  def svg(assigns, %PhoenixFeathers.Icon{name: :close, color: color}) do
    ~L"""
    <svg viewBox="0 0 20 20"><path fill="<%= color %>" d="M10 8.586L2.929 1.515 1.515 2.929 8.586 10l-7.071 7.071 1.414 1.414L10 11.414l7.071 7.071 1.414-1.414L11.414 10l7.071-7.071-1.414-1.414L10 8.586z"/></svg>
    """
  end

  def svg(assigns, %PhoenixFeathers.Icon{name: :menu, color: color}) do
    ~L"""
    <svg viewBox="0 0 20 20"><path fill="<%= color %>" d="M0 3h20v2H0V3zm0 6h20v2H0V9zm0 6h20v2H0v-2z"/></svg>
    """
  end
end
