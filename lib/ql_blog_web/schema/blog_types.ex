defmodule QlBlogWeb.Schema.BlogTypes do
  use Absinthe.Schema.Notation

  alias QlBlogWeb.Resolvers

  object :article do
    field :id, non_null(:id)
    field :title, :string
    field :content, :string

    field :user, :user do
      resolve(&Resolvers.BlogResolver.article_user/3)
    end
  end

  @desc "will be returned after mutation"
  object :article_result do
    field :errors, list_of(:error)
    field :article, :article
  end

  @desc "fields required to create a blog/article post"
  input_object :article_input do
    # mirror the database field, this will make your life easy, no need to change them to fit the database
    field :title, :string
    field :content, non_null(:string)
    field :user_id, non_null(:integer)
  end

  object :blog_queries do
    @desc "list all the articles"
    field :list_articles, list_of(:article) do
      resolve(&Resolvers.BlogResolver.list_articles/3)
    end

    field :article, :article do
      arg(:article_id, non_null(:id))
      resolve(&Resolvers.BlogResolver.article/3)
    end
  end

  object :blog_mutations do
    @desc "create a new article"
    field :create_article, :article_result do
      arg(:input, non_null(:article_input))
      resolve(&Resolvers.BlogResolver.create_article/3)
    end

    field :delete_article, :article_result do
      arg(:article_id, non_null(:id))
      resolve(&Resolvers.BlogResolver.delete_article/3)
    end
  end

  object :blog_subscriptions do
    field :new_article, :article do
      config(fn _args, _info ->
        {:ok, topic: "*"}
      end)
    end
  end
end
