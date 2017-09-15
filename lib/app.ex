defmodule App do
  use Application

  def start(_type, _arguments) do
    import Supervisor.Spec

    children = [
      {Plug.Adapters.Cowboy, scheme: :http, plug: App.Router, options: [port: 80]}
    ]

    Supervisor.start_link(children, [strategy: :one_for_one, name: App.Supervisor])
  end
end
