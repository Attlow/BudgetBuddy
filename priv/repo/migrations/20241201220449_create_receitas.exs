defmodule Budgetbuddy.Repo.Migrations.CreateReceitas do
  use Ecto.Migration

  def change do
    create table(:receitas) do
      add :name, :string
      add :valor, :decimal

      timestamps(type: :utc_datetime)
    end
  end
end
