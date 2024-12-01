defmodule Budgetbuddy.Posts do
  @moduledoc """
  The Posts context.
  """

  import Ecto.Query, warn: false
  alias Budgetbuddy.Repo

  alias Budgetbuddy.Posts.Receitas

  @doc """
  Returns the list of receitas.

  ## Examples

      iex> list_receitas()
      [%Receitas{}, ...]

  """
  def list_receitas do
    Repo.all(Receitas)
  end

  @doc """
  Gets a single receitas.

  Raises `Ecto.NoResultsError` if the Receitas does not exist.

  ## Examples

      iex> get_receitas!(123)
      %Receitas{}

      iex> get_receitas!(456)
      ** (Ecto.NoResultsError)

  """
  def get_receitas!(id), do: Repo.get!(Receitas, id)

  @doc """
  Creates a receitas.

  ## Examples

      iex> create_receitas(%{field: value})
      {:ok, %Receitas{}}

      iex> create_receitas(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_receitas(attrs \\ %{}) do
    %Receitas{}
    |> Receitas.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a receitas.

  ## Examples

      iex> update_receitas(receitas, %{field: new_value})
      {:ok, %Receitas{}}

      iex> update_receitas(receitas, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_receitas(%Receitas{} = receitas, attrs) do
    receitas
    |> Receitas.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a receitas.

  ## Examples

      iex> delete_receitas(receitas)
      {:ok, %Receitas{}}

      iex> delete_receitas(receitas)
      {:error, %Ecto.Changeset{}}

  """
  def delete_receitas(%Receitas{} = receitas) do
    Repo.delete(receitas)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking receitas changes.

  ## Examples

      iex> change_receitas(receitas)
      %Ecto.Changeset{data: %Receitas{}}

  """
  def change_receitas(%Receitas{} = receitas, attrs \\ %{}) do
    Receitas.changeset(receitas, attrs)
  end
end
