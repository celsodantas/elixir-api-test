defmodule FrenzyApi.Product do
  use FrenzyApi.Web, :model

  @derive {Poison.Encoder, only: [:title, :vendor, :variants]}

  schema "products" do
    field :title, :string
    field :vendor, :string

    has_many :variants, FrenzyApi.Variant
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :vendor])
  end
end
