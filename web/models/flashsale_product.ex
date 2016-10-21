defmodule FrenzyApi.FlashsaleProduct do
  use FrenzyApi.Web, :model

  schema "flashsale_products" do
    field :flashsale_id, :integer
    field :product_id, :integer
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:flashsale_id, :product_id])
  end
end
