defmodule QlBlog.Blog.Article do
  use Ecto.Schema
  import Ecto.Changeset

  alias QlBlog.Account.User

  schema "articles" do
    field :content, :string
    field :title, :string

    belongs_to(:user, User)

    timestamps()
  end

  @doc false
  def changeset(article, attrs) do
    article
    |> cast(attrs, [:title, :content, :user_id])
    |> validate_required([:title, :content, :user_id])
    |> foreign_key_constraint(:user_id)
  end
end
