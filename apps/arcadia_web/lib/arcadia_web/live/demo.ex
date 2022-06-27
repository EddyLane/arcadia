defmodule ArcadiaWeb.DemoLive do
  use Surface.LiveView

  alias ArcadiaWeb.Components.{Hero, Modal}
  alias Surface.Components.LivePatch
  alias ArcadiaWeb.Router.Helpers, as: Routes

  data page_title, :string

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Project")
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Projects")
  end

  def render(assigns) do
    ~F"""
    <div>
      <Hero name="John Doe" subtitle="How are you?" color="info" />

      <LivePatch label="New Project" to={Routes.demo_path(@socket, :new)} />

      {#if @live_action in [:new, :edit]}
        <Modal return_to={Routes.demo_path(@socket, :index)}>
          Hello this is some content in your modal!
        </Modal>
      {/if}
    </div>
    """
  end
end
