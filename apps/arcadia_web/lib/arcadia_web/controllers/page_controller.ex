defmodule ArcadiaWeb.PageController do
  use ArcadiaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
