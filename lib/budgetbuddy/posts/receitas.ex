defmodule Budgetbuddy.Posts.Receitas do
  use Ecto.Schema
  import Ecto.Changeset

  schema "receitas" do
    field :name, :string
    field :valor, :decimal

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(receitas, attrs) do
    receitas
    |> cast(attrs, [:name, :valor])
    |> validate_required([:name, :valor])
  end
end
