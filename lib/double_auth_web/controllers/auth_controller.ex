defmodule DoubleAuthWeb.AuthController do
  use DoubleAuthWeb, :controller
  plug Ueberauth

  def callback(conn, params) do
    IO.inspect(conn)
    IO.inspect(params)

    conn
    |> redirect(to: "/")
  end

  def signout(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: "/")
  end
end
