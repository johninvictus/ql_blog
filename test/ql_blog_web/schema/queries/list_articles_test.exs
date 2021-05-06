defmodule QlBlogWeb.Schema.Queries.ListArticlesTest do
  use QlBlogWeb.ConnCase, async: true

  @query """
    {
      listArticles {
        id
      }
    }
  """
  test "list all articles" do
    article = article_fixture()

    conn =
      build_conn()
      |> get("/api", query: @query)

    assert %{"data" => %{"listArticles" => [h | _] = articles}} = json_response(conn, 200)
    assert length(articles) == 1
    assert h["id"] == to_string(article.id)
  end
end
