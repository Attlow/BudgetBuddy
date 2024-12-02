defmodule Budgetbuddy.Posts.Receitas do
  use Ecto.Schema
  import Ecto.Changeset

  schema "receitas" do
    field :name, :string
    field :valor, :decimal
    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(receitas, attrs) do
    receitas
    |> cast(attrs, [:name, :valor, :user_id])
    |> validate_required([:name, :valor, :user_id])
  end
end
