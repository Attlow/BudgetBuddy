defmodule BudgetbuddyWeb.ReceitasHTML do
  use BudgetbuddyWeb, :html

  embed_templates "receitas_html/*"

  @doc """
  Renders a receitas form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def receitas_form(assigns)
end
