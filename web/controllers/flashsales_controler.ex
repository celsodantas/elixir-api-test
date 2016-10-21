defmodule FrenzyApi.FlashsalesController do
  use FrenzyApi.Web, :controller

  alias FrenzyApi.Flashsale

  def index(conn, _params) do
    flashsales = Repo.all(Flashsale)
    render conn, flashsales: flashsales
  end

  def products(conn, %{"password" => password}) do
    products = FrenzyApi.Product |> Flashsale.products(password) |> Repo.all
    render conn, products: products
  end
end
