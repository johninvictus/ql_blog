defmodule QlBlog.Repo.Migrations.AddUserIdToArticlesTable do
  use Ecto.Migration

  def change do
    alter table(:articles) do
      add_if_not_exists :user_id, references(:users, on_delete: :delete_all)
    end
  end
end
