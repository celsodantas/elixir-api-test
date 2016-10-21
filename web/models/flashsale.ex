defmodule FrenzyApi.Flashsale do
  use FrenzyApi.Web, :model

  @derive {Poison.Encoder, only: [:id, :password]}

  schema "flashsales" do
    field :password, :string

    has_many :flashsale_products, FrenzyApi.FlashsaleProduct
    has_many :products, FrenzyApi.Product
  end

  def products(query, password) do
    from f in query,
      join: fp in assoc(f, :flashsale_products),
      join: p in FrenzyApi.Product, on: fp.product_id == p.id,
      where: f.password == ^password,
      select: p,
      preload: [:variants]
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:password])
  end
end
