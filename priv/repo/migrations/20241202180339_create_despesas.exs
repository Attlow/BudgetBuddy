defmodule Budgetbuddy.Repo.Migrations.CreateDespesas do
  use Ecto.Migration

  def change do
    create table(:despesas) do
      add :name, :string
      add :valor, :decimal

      timestamps(type: :utc_datetime)
    end
  end
end
