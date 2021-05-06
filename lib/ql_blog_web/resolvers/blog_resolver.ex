defmodule QlBlogWeb.Resolvers.BlogResolver do
  alias QlBlog.Blog

  def list_articles(_parent, _args, _context) do
    {:ok, Blog.list_articles()}
  end

  def article(_parent, %{article_id: article_id}, _context) do
    {:ok, Blog.get_article(article_id)}
  end

  def create_article(_parent, %{input: params}, _context) do
    with {:ok, article} <- Blog.create_article(params) do
      {:ok, %{article: article}}
    end
  end

  def delete_article(_parent, %{article_id: article_id}, _context) do
    with %Blog.Article{} = article <- Blog.get_article(article_id),
         {:ok, d_article} <- Blog.delete_article(article) do
      {:ok, %{article: d_article}}
    else
      nil -> {:error, "Article not available"}
      error -> error
    end
  end
end
