defmodule QlBlog.Account.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias QlBlog.Blog.Article

  schema "users" do
    field :name, :string
    field :age, :integer
    field :is_admin, :boolean, default: false
    field :user_type, :string

    has_many(:articles, Article)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :user_type, :age, :is_admin])
    |> validate_required([:name, :user_type])
  end
end
