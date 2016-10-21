defmodule FrenzyApi.Flashsale do
  use FrenzyApi.Web, :model

  @derive {Poison.Encoder, only: [:id, :password]}

  schema "flashsales" do
    field :password, :string

    has_many :flashsale_products, FrenzyApi.FlashsaleProduct
    has_many :products, FrenzyApi.Product
  end

  def products(query, password) do
    from p in query,
      join: fp in assoc(p, :flashsale_products),
      join: f in FrenzyApi.Flashsale, on: fp.flashsale_id == f.id,
      where: f.password == ^password,
      select: p,
      preload: [:variants, :options]
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:password])
  end
end
