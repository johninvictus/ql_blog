defmodule QlBlogWeb.Schema.Queries.CreateArticleTest do
  use QlBlogWeb.ConnCase, async: true

  @query """
  mutation createArticle($input:  ArticleInput!) {
    createArticle(input: $input){
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
  test "create_article - valid inputs" do
    variables = %{
      "input" => %{
        "content" => "Appear weak when you are strong, and strong when you are weak.",
        "title" => "war games"
      }
    }

    conn =
      build_conn()
      |> post("/api", query: @query, variables: variables)

    assert %{
             "data" => %{
               "createArticle" => %{
                 "article" => %{"id" => _id}
               }
             }
           } = json_response(conn, 200)
  end

  test "create_article - invalid inputs" do
    # made title non null so that we can test error, demo
    variables = %{
      "input" => %{
        "content" => "Appear weak when you are strong, and strong when you are weak."
      }
    }

    conn =
      build_conn()
      |> post("/api", query: @query, variables: variables)

    assert %{
             "data" => %{
               "createArticle" => %{
                 "article" => nil,
                 "errors" => [%{"key" => "title", "message" => "can't be blank"}]
               }
             }
           } == json_response(conn, 200)
  end
end
