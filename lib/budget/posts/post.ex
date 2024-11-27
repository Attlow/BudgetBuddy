defmodule Budget.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :title, :string
    field :valor, :decimal
    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :valor, :user_id])
    |> validate_required([:title, :valor, :user_id])
    |> foreign_key_constraint(:user_id)

  end
end
