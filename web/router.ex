defmodule FrenzyApi.Router do
  use FrenzyApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FrenzyApi do
    pipe_through :api

    get "/flashsales", FlashsalesController, :index
    get "/flashsales/:password/products", FlashsalesController, :products
  end

  # Other scopes may use custom stacks.
  # scope "/api", FrenzyApi do
  #   pipe_through :api
  # end
end
