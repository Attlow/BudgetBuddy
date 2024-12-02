defmodule Budgetbuddy.Posts.Despesas do
  use Ecto.Schema
  import Ecto.Changeset

  schema "despesas" do
    field :name, :string
    field :valor, :decimal
    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(despesas, attrs) do
    despesas
    |> cast(attrs, [:name, :valor, :user_id])
    |> validate_required([:name, :valor, :user_id])
  end
end
