defmodule FrenzyApi.FlashsalesView do
  use FrenzyApi.Web, :view

  def render("index.json", %{flashsales: flashsales}) do
    %{flashsales: flashsales}
  end

  def render("products.json", %{products: products}) do
    %{products: products}
  end
end
