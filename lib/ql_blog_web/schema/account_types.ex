defmodule QlBlogWeb.Schema.AccountTypes do
  use Absinthe.Schema.Notation

  alias QlBlogWeb.Resolvers

  object :user do
    # if null it will throw an error
    field :id, non_null(:id)
    field :name, :string
    field :age, :integer
    field :is_admin, :boolean
    field :user_type, :string
  end

  object :user_result do
    field :user, :user
    field :errors, list_of(:error)
  end

  enum :user_types do
    value(:writer, as: "writer", description: "writes")
    value(:joker, as: "joker", description: "writes jokes")
  end

  input_object :user_input do
    field :name, non_null(:string)
    field :age, :integer
    field :is_admin, :boolean, default_value: false
    field :user_type, non_null(:user_types)
  end

  object :account_queries do
    @desc "list all the users"
    field :list_users, list_of(:article) do
      resolve(&Resolvers.AccountResolver.list_users/3)
    end
  end

  object :account_mutations do
    @desc "create user"
    field :create_user, :user_result do
      arg(:input, non_null(:user_input))
      resolve(&Resolvers.AccountResolver.create_user/3)
    end
  end
end
