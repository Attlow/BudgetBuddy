defmodule BudgetbuddyWeb.DespesasController do
  use BudgetbuddyWeb, :controller

  alias Budgetbuddy.Posts
  alias Budgetbuddy.Posts.Despesas

  def index(conn, _params) do
    # Pegar o ID do usuário autenticado
    user_id = conn.assigns.current_user.id

    # Buscar as despesas do usuário
    despesas = Posts.list_user_despesas(user_id)

    render(conn, :index, despesas_collection: despesas)
  end

  def new(conn, _params) do
    changeset = Posts.change_despesas(%Despesas{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"despesas" => despesas_params}) do
    # Pegar o ID do usuário autenticado
    user_id = conn.assigns.current_user.id

    # Inserir o user_id nos parâmetros do post
    despesas_params = Map.put(despesas_params, "user_id", user_id)

    case Posts.create_despesas(despesas_params) do
      {:ok, despesas} ->
        conn
        |> put_flash(:info, "Despesa criada com sucesso.")
        |> redirect(to: ~p"/despesas/#{despesas.id}")  # Garantir que o redirecionamento é para a despesa criada

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    despesas = Posts.get_despesas!(id)
    render(conn, :show, despesas: despesas)
  end

  def edit(conn, %{"id" => id}) do
    despesas = Posts.get_despesas!(id)
    changeset = Posts.change_despesas(despesas)
    render(conn, :edit, despesas: despesas, changeset: changeset)
  end

  def update(conn, %{"id" => id, "despesas" => despesas_params}) do
    despesas = Posts.get_despesas!(id)

    case Posts.update_despesas(despesas, despesas_params) do
      {:ok, despesas} ->
        conn
        |> put_flash(:info, "Despesa atualizada com sucesso.")
        |> redirect(to: ~p"/despesas/#{despesas.id}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, despesas: despesas, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    despesas = Posts.get_despesas!(id)
    {:ok, _despesas} = Posts.delete_despesas(despesas)

    conn
    |> put_flash(:info, "Despesa deletada com sucesso.")
    |> redirect(to: ~p"/despesas")
  end
end
