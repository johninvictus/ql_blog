defmodule QlBlogWeb.Schema.Mutations.DeleteArticleTest do
  use QlBlogWeb.ConnCase, async: true

  @query """
  mutation deleteArticle($articleId: ID!){
    deleteArticle(articleId: $articleId){
      article {
        id
      }
      errors {
        key
        message
      }
    }
  }
  """
  setup do
    {:ok, %{article: insert(:article)}}
  end

  test "delete_article - valid inputs", %{article: article} do
    variables = %{"articleId" => article.id}

    conn =
      build_conn()
      |> post("/api", query: @query, variables: variables)

    assert %{
             "data" => %{
               "deleteArticle" => %{
                 "article" => %{
                   "id" => id
                 },
                 "errors" => nil
               }
             }
           } = json_response(conn, 200)

    assert id == to_string(article.id)
  end

  test "delete_article - invalid inputs" do
    variables = %{"articleId" => 100_000}

    conn =
      build_conn()
      |> post("/api", query: @query, variables: variables)

    assert %{
             "data" => %{
               "deleteArticle" => %{
                 "article" => nil,
                 "errors" => [%{"key" => "error", "message" => "Article not available"}]
               }
             }
           } == json_response(conn, 200)
  end
end
