defmodule FrenzyApi.Flashsale do
  use FrenzyApi.Web, :model

  @derive {Poison.Encoder, only: [:id, :password]}

  schema "flashsales" do
    field :password, :string

    has_many :flashsale_products, FrenzyApi.FlashsaleProduct
  end

  def products(query, password) do
    from f in query,
      join: fp in assoc(f, :flashsale_products),
      where: fp.flashsale_id == f.id and f.password == ^password
    # FrenzyApi.Product |> where([p], p.id == 1) |> FrenzyApi.Repo.all
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:password])
  end
end
