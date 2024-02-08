defmodule DoubleAuth.Repo do
  use Ecto.Repo,
    otp_app: :double_auth,
    adapter: Ecto.Adapters.Postgres
end
