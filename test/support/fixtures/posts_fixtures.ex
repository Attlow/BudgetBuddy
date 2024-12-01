defmodule Budgetbuddy.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Budgetbuddy.Posts` context.
  """

  @doc """
  Generate a receitas.
  """
  def receitas_fixture(attrs \\ %{}) do
    {:ok, receitas} =
      attrs
      |> Enum.into(%{
        name: "some name",
        valor: "120.5"
      })
      |> Budgetbuddy.Posts.create_receitas()

    receitas
  end
end