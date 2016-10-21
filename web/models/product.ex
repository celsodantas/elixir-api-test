defmodule FrenzyApi.Product do
  use FrenzyApi.Web, :model

  @derive {Poison.Encoder, only: [:title, :vendor]}

  schema "products" do
    field :title, :string
    field :vendor, :string
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :vendor])
  end
end
