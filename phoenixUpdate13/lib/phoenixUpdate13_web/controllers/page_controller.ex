defmodule PhoenixUpdate13Web.PageController do
  use PhoenixUpdate13Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
