defmodule QlBlog.Repo do
  use Ecto.Repo,
    otp_app: :ql_blog,
    adapter: Ecto.Adapters.Postgres
end
