defmodule BudgetWeb.UserSessionController do
  use BudgetWeb, :controller

  alias Budget.Accounts
  alias BudgetWeb.UserAuth

  # Adapta os casos com "_action"
  def create(conn, %{"_action" => _action} = params) do
    create(conn, params["user"], "Account created successfully!")
  end

  def create(conn, %{"_action" => "password_updated"} = params) do
    conn
    |> put_session(:user_return_to, ~p"/users/settings")
    |> create(params, "Password updated successfully!")
  end

  # Rota genérica de login
  def create(conn, params) do
    create(conn, params, "Welcome back!")
  end

  defp create(conn, %{"user" => %{"login" => login, "password" => password}}, info) do
    # Determina se é login por email ou nome
    user =
      if String.contains?(login, "@") do
        Accounts.get_user_by_email_and_password(login, password)
      else
        Accounts.get_user_by_name_and_password(login, password)
      end

    if user do
      conn
      |> put_flash(:info, info)
      |> UserAuth.log_in_user(user)
    else
      conn
      |> put_flash(:error, "Invalid username/email or password")
      |> put_flash(:login, String.slice(login, 0, 160))
      |> redirect(to: ~p"/users/log_in")
    end
  end


  def delete(conn, _params) do
    conn
    |> put_flash(:info, "Logged out successfully.")
    |> UserAuth.log_out_user()
  end
end
