defmodule ApptestWeb.PageController do
  use ApptestWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
