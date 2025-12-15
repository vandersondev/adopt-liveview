# conteúdo do arquivo hello_liveview.exs

Mix.install([
  {:liveview_playground, "~> 0.1.1"}
])

defmodule PageLive do
  use LiveviewPlaygroundWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, name: "Vandersondev")
    socket = assign(socket, age: ~c"36")
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <!DOCTYPE html>
      <html lang="en">
        <head>
          <meta charset="UTF-8" />
          <meta name="viewport" content="width=device-width, initial-scale=1.0" />
          <title>Document</title>
        </head>
        <body>
          <h1>Hello <%= @name %>!</h1>
          <p>You are <%= @age %></p>

          <input type="button" value="Reverse" phx-click="reverse" >
        </body>
      </html>
    """
  end

  def handle_event("reverso", _params, socket) do
    socket = assign(socket, name: String.reverse(socket.assigns.name))
    {:noreply, socket}
  end
end

LiveviewPlayground.start()
