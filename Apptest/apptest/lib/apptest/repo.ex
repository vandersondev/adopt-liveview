defmodule Apptest.Repo do
  use Ecto.Repo,
    otp_app: :apptest,
    adapter: Ecto.Adapters.Postgres
end
