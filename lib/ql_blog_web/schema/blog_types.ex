defmodule QlBlogWeb.Schema.BlogTypes do
  use Absinthe.Schema.Notation

  alias QlBlogWeb.Resolvers

  object :article do
    field :id, non_null(:id)
    field :title, :string
    field :content, :string
  end

  object :blog_queries do
    @desc "list all the articles"
    field :list_articles, list_of(:article) do
      resolve(&Resolvers.BlogResolver.list_articles/3)
    end
  end

  object :blog_mutations do
  end
end
