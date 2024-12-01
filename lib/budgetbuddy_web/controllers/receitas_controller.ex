defmodule BudgetbuddyWeb.ReceitasController do
  use BudgetbuddyWeb, :controller

  alias Budgetbuddy.Posts
  alias Budgetbuddy.Posts.Receitas

  def index(conn, _params) do
    receitas = Posts.list_receitas()
    render(conn, :index, receitas_collection: receitas)
  end

  def new(conn, _params) do
    changeset = Posts.change_receitas(%Receitas{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"receitas" => receitas_params}) do
    case Posts.create_receitas(receitas_params) do
      {:ok, receitas} ->
        conn
        |> put_flash(:info, "Receitas created successfully.")
        |> redirect(to: ~p"/receitas/#{receitas}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    receitas = Posts.get_receitas!(id)
    render(conn, :show, receitas: receitas)
  end

  def edit(conn, %{"id" => id}) do
    receitas = Posts.get_receitas!(id)
    changeset = Posts.change_receitas(receitas)
    render(conn, :edit, receitas: receitas, changeset: changeset)
  end

  def update(conn, %{"id" => id, "receitas" => receitas_params}) do
    receitas = Posts.get_receitas!(id)

    case Posts.update_receitas(receitas, receitas_params) do
      {:ok, receitas} ->
        conn
        |> put_flash(:info, "Receitas updated successfully.")
        |> redirect(to: ~p"/receitas/#{receitas}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, receitas: receitas, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    receitas = Posts.get_receitas!(id)
    {:ok, _receitas} = Posts.delete_receitas(receitas)

    conn
    |> put_flash(:info, "Receitas deleted successfully.")
    |> redirect(to: ~p"/receitas")
  end
end
