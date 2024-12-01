defmodule BudgetbuddyWeb.ReceitasControllerTest do
  use BudgetbuddyWeb.ConnCase

  import Budgetbuddy.PostsFixtures

  @create_attrs %{name: "some name", valor: "120.5"}
  @update_attrs %{name: "some updated name", valor: "456.7"}
  @invalid_attrs %{name: nil, valor: nil}

  describe "index" do
    test "lists all receitas", %{conn: conn} do
      conn = get(conn, ~p"/receitas")
      assert html_response(conn, 200) =~ "Listing Receitas"
    end
  end

  describe "new receitas" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/receitas/new")
      assert html_response(conn, 200) =~ "New Receitas"
    end
  end

  describe "create receitas" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/receitas", receitas: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/receitas/#{id}"

      conn = get(conn, ~p"/receitas/#{id}")
      assert html_response(conn, 200) =~ "Receitas #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/receitas", receitas: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Receitas"
    end
  end

  describe "edit receitas" do
    setup [:create_receitas]

    test "renders form for editing chosen receitas", %{conn: conn, receitas: receitas} do
      conn = get(conn, ~p"/receitas/#{receitas}/edit")
      assert html_response(conn, 200) =~ "Edit Receitas"
    end
  end

  describe "update receitas" do
    setup [:create_receitas]

    test "redirects when data is valid", %{conn: conn, receitas: receitas} do
      conn = put(conn, ~p"/receitas/#{receitas}", receitas: @update_attrs)
      assert redirected_to(conn) == ~p"/receitas/#{receitas}"

      conn = get(conn, ~p"/receitas/#{receitas}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, receitas: receitas} do
      conn = put(conn, ~p"/receitas/#{receitas}", receitas: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Receitas"
    end
  end

  describe "delete receitas" do
    setup [:create_receitas]

    test "deletes chosen receitas", %{conn: conn, receitas: receitas} do
      conn = delete(conn, ~p"/receitas/#{receitas}")
      assert redirected_to(conn) == ~p"/receitas"

      assert_error_sent 404, fn ->
        get(conn, ~p"/receitas/#{receitas}")
      end
    end
  end

  defp create_receitas(_) do
    receitas = receitas_fixture()
    %{receitas: receitas}
  end
end
