defmodule FrenzyApi.PageController do
  use FrenzyApi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
