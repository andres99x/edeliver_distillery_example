defmodule App.Router do
  use Plug.Router
  use Plug.ErrorHandler

  if Mix.env == :dev, do: use Plug.Debugger

  plug :match
  plug :dispatch

  match _, do: conn |> send_resp(200, "Hello World! :)")
end
