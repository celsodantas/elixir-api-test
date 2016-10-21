defmodule FrenzyApi.Variant do
  use FrenzyApi.Web, :model

  @derive {Poison.Encoder, only: [:title, :price, :position, :weight, :weight_unit, :inventory_quantity, :option_values]}

  schema "variants" do
    field :product_id, :integer
    field :shop_id, :integer
    field :title, :string
    field :price, :decimal
    field :position, :integer
    field :weight, :integer
    field :weight_unit, :string
    field :requires_shipping, :boolean
    field :inventory_quantity, :integer
    field :inventory_policy, :string
    field :shopify_variant_id, :integer
    field :option_values, :string
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :inventory_quantity])
  end
end
