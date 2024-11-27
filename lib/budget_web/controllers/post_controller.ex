defmodule BudgetWeb.PostController do
  use BudgetWeb, :controller

  alias Budget.Posts
  alias Budget.Posts.Post

  def index(conn, _params) do
    # Pegar o ID do usuário autenticado
    user_id = conn.assigns.current_user.id

    # Buscar os posts do usuário
    posts = Posts.list_user_posts(user_id)

    render(conn, :index, posts: posts)
  end

  def new(conn, _params) do
    changeset = Posts.change_post(%Post{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"post" => post_params}) do
    # Pegar o ID do usuário autenticado
    user_id = conn.assigns.current_user.id

    # Inserir o user_id nos parâmetros do post
    post_params = Map.put(post_params, "user_id", user_id)
    case Posts.create_post(post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post created successfully.")
        |> redirect(to: ~p"/posts/#{post}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user_id = conn.assigns.current_user.id

    case Posts.get_post!(id) do
      nil ->
        conn
        |> put_flash(:error, "Post não encontrado.")
        |> redirect(to: ~p"/posts/")

      %Post{} = post when post.user_id == user_id ->
        # Post pertence ao usuário autenticado
        render(conn, :show, post: post)

      _post ->
        # Post encontrado, mas não pertence ao usuário autenticado
        conn
        |> put_flash(:error, "Você não tem permissão para acessar este post.")
        |> redirect(to: ~p"/posts/")
    end
  end


  def edit(conn, %{"id" => id}) do
    post = Posts.get_post!(id)
    changeset = Posts.change_post(post)
    render(conn, :edit, post: post, changeset: changeset)
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = Posts.get_post!(id)

    case Posts.update_post(post, post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post updated successfully.")
        |> redirect(to: ~p"/posts/#{post}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, post: post, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    post = Posts.get_post!(id)
    {:ok, _post} = Posts.delete_post(post)

    conn
    |> put_flash(:info, "Post deleted successfully.")
    |> redirect(to: ~p"/posts")
  end
end
