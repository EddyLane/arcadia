defmodule Arcadia.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Arcadia.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Arcadia.PubSub}
      # Start a worker by calling: Arcadia.Worker.start_link(arg)
      # {Arcadia.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Arcadia.Supervisor)
  end
end
