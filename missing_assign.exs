Mix.install([
  {:liveview_playground, "~> 0.1.8"}
])

defmodule PageLive do
  use LiveviewPlaygroundWeb, :live_view

  def mount(_params, _session, socket) do
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
        </body>
      </html>
    """
  end

end

LiveviewPlayground.start()
