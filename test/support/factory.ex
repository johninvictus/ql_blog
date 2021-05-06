defmodule QlBlog.Factory do
  @moduledoc """
    Will contain test data module associations.
    This makes it easy and clean to create test dummy/fake data.
  """
  use ExMachina.Ecto, repo: QlBlog.Repo

  alias QlBlog.Blog.Article
  alias QlBlog.{Account, Blog}
  alias QlBlog.Account.User

  def user_factory do
    %User{
      age: 20,
      is_admin: false,
      name: &"test_name #{&1}",
      user_type: "joker"
    }
  end

  def article_factory do
    %Article{
      title: sequence(:title, &"Test title #{&1}"),
      content: sequence(:content, &"Test content #{&1}"),
      user: build(:user)
    }
  end

  def user_fixture(attrs \\ %{}) do
    valid_attrs = %{age: 42, is_admin: false, name: "some name", user_type: "joker"}

    {:ok, user} =
      attrs
      |> Enum.into(valid_attrs)
      |> Account.create_user()

    user
  end

  def article_fixture(attrs \\ %{}) do
    user = user_fixture()
    valid_attrs = %{content: "some content", title: "some title", user_id: user.id}

    {:ok, article} =
      attrs
      |> Enum.into(valid_attrs)
      |> Blog.create_article()

    article
  end
end
