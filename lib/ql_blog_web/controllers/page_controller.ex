defmodule QlBlogWeb.PageController do
  use QlBlogWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
