defmodule QlBlogWeb.Schema.ErrorTypes do
  use Absinthe.Schema.Notation

  @desc "An error encountered trying to persist mutation"
  object :error do
    field :key, non_null(:string)
    field :message, non_null(:string)
  end
end
