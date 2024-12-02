defmodule BudgetbuddyWeb.DespesasHTML do
  use BudgetbuddyWeb, :html

  embed_templates "despesas_html/*"

  @doc """
  Renders a despesas form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def despesas_form(assigns)
end
