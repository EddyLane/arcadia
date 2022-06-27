defmodule ArcadiaWeb.Demo do
  use Surface.LiveView

  alias ArcadiaWeb.Components.{Hero, Modal}
  alias Surface.Components.LivePatch
  alias ArcadiaWeb.Router.Helpers, as: Routes

  def render(assigns) do
    ~F"""
    <div>
      <Hero name="John Doe" subtitle="How are you?" color="info" />

      <LivePatch label="New Project" to={Routes.project_index_path(@socket, :new)} />

      {#if @live_action in [:new, :edit]}
        <Modal return_to="/demo" />
      {/if}
    </div>
    """
  end
end
