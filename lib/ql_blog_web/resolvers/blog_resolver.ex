defmodule QlBlogWeb.Resolvers.BlogResolver do
  alias QlBlog.Blog

  def list_articles(_parent, _args, _context) do
    {:ok, Blog.list_articles()}
  end
end
