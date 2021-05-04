defmodule QlBlogWeb.Resolvers.BlogResolver do
  alias QlBlog.Blog

  def list_articles(_parent, _args, _context) do
    {:ok, Blog.list_articles()}
  end

  def create_article(_parent, %{input: params}, _context) do
    with {:ok, article} <- Blog.create_article(params) do
      {:ok, %{article: article}}
    end
  end
end
