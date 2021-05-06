defmodule QlBlogWeb.Schema do
  @moduledoc ~S"""
  This will define the entire shape of the graphql schema and any plugins and middlewares.
  """

  use Absinthe.Schema

  alias QlBlogWeb.Schema.Middleware

  import_types(Absinthe.Type.Custom)
  import_types(__MODULE__.ErrorTypes)
  import_types(__MODULE__.BlogTypes)
  import_types(__MODULE__.AccountTypes)

  def middleware(middleware, _field, %{identifier: :mutation}) do
    middleware ++ [Middleware.ChangesetErrors]
  end

  def middleware(middleware, _field, _object) do
    middleware
  end

  query do
    field :hello, :string do
      resolve(fn _parent, _args, _context ->
        {:ok, "Hello, world"}
      end)
    end

    import_fields(:blog_queries)
    import_fields(:account_queries)
  end

  mutation do
    import_fields(:blog_mutations)
    import_fields(:account_mutations)
  end

  subscription do
    import_fields(:blog_subscriptions)
  end
end
