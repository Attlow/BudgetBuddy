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

  def list_user_receitas(user_id) do
    from(r in Receitas, where: r.user_id == ^user_id)
    |> Repo.all()
  end

  alias Budgetbuddy.Posts.Despesas

  @doc """
  Returns the list of despesas.

  ## Examples

      iex> list_despesas()
      [%Despesas{}, ...]

  """
  def list_despesas do
    Repo.all(Despesas)
  end

  @doc """
  Gets a single despesas.

  Raises `Ecto.NoResultsError` if the Despesas does not exist.

  ## Examples

      iex> get_despesas!(123)
      %Despesas{}

      iex> get_despesas!(456)
      ** (Ecto.NoResultsError)

  """
  def get_despesas!(id), do: Repo.get!(Despesas, id)

  @doc """
  Creates a despesas.

  ## Examples

      iex> create_despesas(%{field: value})
      {:ok, %Despesas{}}

      iex> create_despesas(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_despesas(attrs \\ %{}) do
    %Despesas{}
    |> Despesas.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a despesas.

  ## Examples

      iex> update_despesas(despesas, %{field: new_value})
      {:ok, %Despesas{}}

      iex> update_despesas(despesas, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_despesas(%Despesas{} = despesas, attrs) do
    despesas
    |> Despesas.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a despesas.

  ## Examples

      iex> delete_despesas(despesas)
      {:ok, %Despesas{}}

      iex> delete_despesas(despesas)
      {:error, %Ecto.Changeset{}}

  """
  def delete_despesas(%Despesas{} = despesas) do
    Repo.delete(despesas)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking despesas changes.

  ## Examples

      iex> change_despesas(despesas)
      %Ecto.Changeset{data: %Despesas{}}

  """
  def change_despesas(%Despesas{} = despesas, attrs \\ %{}) do
    Despesas.changeset(despesas, attrs)
  end

  def list_user_despesas(user_id) do
    from(d in Despesas, where: d.user_id == ^user_id)
    |> Repo.all()
  end
end
