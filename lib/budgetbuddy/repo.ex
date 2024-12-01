defmodule Budgetbuddy.Repo do
  use Ecto.Repo,
    otp_app: :budgetbuddy,
    adapter: Ecto.Adapters.Postgres
end
