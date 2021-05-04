defmodule QlBlogWeb.Schema do
  @moduledoc ~S"""
  This will define the entire shape of the graphql schema and any plugins and middlewares.
  """

  use Absinthe.Schema

  import_types(Absinthe.Type.Custom)
  import_types(__MODULE__.BlogTypes)

  query do
    field :hello, :string do
      resolve(fn _, _, _ ->
        {:ok, "Hello, world"}
      end)
    end

    import_fields(:blog_queries)
  end
end
