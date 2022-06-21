defmodule Arcadia.Repo do
  use Ecto.Repo,
    otp_app: :arcadia,
    adapter: Ecto.Adapters.Postgres
end
