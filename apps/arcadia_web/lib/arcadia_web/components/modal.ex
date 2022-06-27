defmodule ArcadiaWeb.Components.Modal do
  @moduledoc """
  Renders a live component inside a modal.
  """
  alias Phoenix.LiveView.JS
  alias Surface.Components.LivePatch

  use Surface.Component

  import ArcadiaWeb.Gettext

  @doc "Unique ID that is used for the JS integrations"
  prop id, :string, required: true

  @doc "Updates the URL when the modal is closed."
  prop return_to, :string, default: nil

  @doc "The content of the Modal"
  slot default, required: true

  def render(assigns) do
    ~F"""
    <div id={"#{@id}-modal"} class="phx-modal fade-in" phx-remove={hide_modal(@id)}>
      <div
        id={"#{@id}-modal-content"}
        class="phx-modal-content fade-in-scale"
        :on-click-away={JS.dispatch("click", to: "##{@id}-close")}
        :on-window-keydown={JS.dispatch("click", to: "##{@id}-close")}
        :on-key="escape"
      >
        {#if @return_to}
          <LivePatch
            opts={id: "#{@id}-close"}
            to={@return_to}
            class="phx-modal-close"
            label="✖"
            :click={hide_modal(@id)}
          />
        {#else}
          <a id={"#{@id}-close"} href="#" class="phx-modal-close" phx-click={hide_modal(@id)}>✖</a>
        {/if}

        <#slot />
      </div>
    </div>
    """
  end

  def hide_modal(id, js \\ %JS{}) do
    js
    |> JS.hide(transition: "fade-out", to: "##{id}-modal")
    |> JS.hide(transition: "fade-out-scale", to: "##{id}-modal-content")
  end
end
