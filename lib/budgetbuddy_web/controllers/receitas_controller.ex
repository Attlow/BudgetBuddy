defmodule BudgetbuddyWeb.ReceitasController do
  use BudgetbuddyWeb, :controller

  alias Budgetbuddy.Posts
  alias Budgetbuddy.Posts.Receitas

  def index(conn, _params) do
    # Pegar o ID do usuário autenticado
    user_id = conn.assigns.current_user.id

    # Buscar as receitas do usuário
    receitas = Posts.list_user_receitas(user_id)

    render(conn, :index, receitas_collection: receitas)
  end

  def new(conn, _params) do
    changeset = Posts.change_receitas(%Receitas{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"receitas" => receitas_params}) do
    # Pegar o ID do usuário autenticado
    user_id = conn.assigns.current_user.id

    # Inserir o user_id nos parâmetros do post
    receitas_params = Map.put(receitas_params, "user_id", user_id)
    case Posts.create_receitas(receitas_params) do
      {:ok, receitas} ->
        conn
        |> put_flash(:info, "Receita criada com sucesso.")
        |> redirect(to: ~p"/receitas/#{receitas.id}")  # Garantir que o redirecionamento é para a receita criada

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
        |> put_flash(:info, "Receita atualizada com sucesso.")
        |> redirect(to: ~p"/receitas/#{receitas}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, receitas: receitas, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    receitas = Posts.get_receitas!(id)
    {:ok, _receitas} = Posts.delete_receitas(receitas)

    conn
    |> put_flash(:info, "Receita deletada com sucesso.")
    |> redirect(to: ~p"/receitas")
  end
end
