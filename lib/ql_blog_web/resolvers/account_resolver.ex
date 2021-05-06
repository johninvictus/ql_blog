defmodule QlBlogWeb.Resolvers.AccountResolver do
  alias QlBlog.Account

  def list_users(_parent, _args, _context) do
    {:ok, Account.list_users()}
  end

  def create_user(_parent, %{input: params}, _context) do
    with {:ok, user} <- Account.create_user(params) do
      {:ok, %{user: user}}
    end
  end
end
