defmodule ArcadiaWeb.Components.Modal do
  @moduledoc """
  Renders a live component inside a modal.
  """
  alias Phoenix.LiveView.JS
  alias Surface.Components.LivePatch

  use Surface.Component

  import ArcadiaWeb.Gettext

  @doc "Updates the URL when the modal is closed."
  prop return_to, :string, default: nil

  @doc "The name"
  prop name, :string, default: "Guest"

  @doc "The subtitle"
  prop subtitle, :string

  @doc "The color"
  prop color, :string, values!: ["danger", "info", "warning"]

  def render(assigns) do
    ~F"""
    <div id="modal" class="phx-modal fade-in" phx-remove={hide_modal()}>
      <div
        id="modal-content"
        class="phx-modal-content fade-in-scale"
        phx-click-away={JS.dispatch("click", to: "#close")}
        phx-window-keydown={JS.dispatch("click", to: "#close")}
        phx-key="escape"
      >
        {#if @return_to}
          <LivePatch id="close" to={@return_to} class="phx-modal-close" label="✖" :click={hide_modal} />
        {#else}
          <a id="close" href="#" class="phx-modal-close" phx-click={hide_modal()}>✖</a>
        {/if}
      </div>
    </div>
    """
  end

  def hide_modal(js \\ %JS{}) do
    js
    |> JS.hide(transition: "fade-out", to: "#modal")
    |> JS.hide(transition: "fade-out-scale", to: "#modal-content")
  end
end
