defmodule FrenzyApi.Option do
  use FrenzyApi.Web, :model

  @derive {Poison.Encoder, only: [:name, :values]}

  schema "options" do
    field :shop_id, :integer
    field :position, :integer
    field :name, :string
    field :values, :string

    belongs_to :product, FrenzyApi.Product
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :vendor])
  end
end
