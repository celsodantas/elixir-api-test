defmodule FrenzyApi.Product do
  use FrenzyApi.Web, :model

  @derive {Poison.Encoder, only: [:title, :body_html, :vendor, :variants, :options]}

  schema "products" do
    field :title, :string
    field :vendor, :string
    field :body_html, :string

    has_many :flashsale_products, FrenzyApi.FlashsaleProduct
    has_many :variants, FrenzyApi.Variant
    has_many :options, FrenzyApi.Option
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :vendor])
  end
end
