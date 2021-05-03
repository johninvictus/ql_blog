defmodule QlBlogWeb.Schema do
  @moduledoc ~S"""
  This will define the entire shape of the graphql schema and any plugins and middlewares.
  """

  use Absinthe.Schema

  query do
    field :hello, :string do
      resolve(fn _, _, _ ->
        {:ok, "Hello, world"}
      end)
    end
  end
end
