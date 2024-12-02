defmodule BudgetbuddyWeb.DespesasControllerTest do
  use BudgetbuddyWeb.ConnCase

  import Budgetbuddy.PostsFixtures

  @create_attrs %{name: "some name", valor: "120.5"}
  @update_attrs %{name: "some updated name", valor: "456.7"}
  @invalid_attrs %{name: nil, valor: nil}

  describe "index" do
    test "lists all despesas", %{conn: conn} do
      conn = get(conn, ~p"/despesas")
      assert html_response(conn, 200) =~ "Listing Despesas"
    end
  end

  describe "new despesas" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/despesas/new")
      assert html_response(conn, 200) =~ "New Despesas"
    end
  end

  describe "create despesas" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/despesas", despesas: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/despesas/#{id}"

      conn = get(conn, ~p"/despesas/#{id}")
      assert html_response(conn, 200) =~ "Despesas #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/despesas", despesas: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Despesas"
    end
  end

  describe "edit despesas" do
    setup [:create_despesas]

    test "renders form for editing chosen despesas", %{conn: conn, despesas: despesas} do
      conn = get(conn, ~p"/despesas/#{despesas}/edit")
      assert html_response(conn, 200) =~ "Edit Despesas"
    end
  end

  describe "update despesas" do
    setup [:create_despesas]

    test "redirects when data is valid", %{conn: conn, despesas: despesas} do
      conn = put(conn, ~p"/despesas/#{despesas}", despesas: @update_attrs)
      assert redirected_to(conn) == ~p"/despesas/#{despesas}"

      conn = get(conn, ~p"/despesas/#{despesas}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, despesas: despesas} do
      conn = put(conn, ~p"/despesas/#{despesas}", despesas: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Despesas"
    end
  end

  describe "delete despesas" do
    setup [:create_despesas]

    test "deletes chosen despesas", %{conn: conn, despesas: despesas} do
      conn = delete(conn, ~p"/despesas/#{despesas}")
      assert redirected_to(conn) == ~p"/despesas"

      assert_error_sent 404, fn ->
        get(conn, ~p"/despesas/#{despesas}")
      end
    end
  end

  defp create_despesas(_) do
    despesas = despesas_fixture()
    %{despesas: despesas}
  end
end
