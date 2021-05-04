defmodule QlBlog.Factory do
  @moduledoc """
    Will contain test data module associations.
    This makes it easy and clean to create test dummy/fake data.
  """
  use ExMachina.Ecto, repo: QlBlog.Repo

  alias QlBlog.Blog.Article

  def article_factory do
    %Article{
      title: sequence(:title, &"Test title #{&1}"),
      content: sequence(:content, &"Test content #{&1}")
    }
  end
end
