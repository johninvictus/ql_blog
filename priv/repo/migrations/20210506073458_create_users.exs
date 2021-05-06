defmodule QlBlog.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :user_type, :string
      add :age, :integer
      add :is_admin, :boolean, default: false, null: false

      timestamps()
    end

  end
end
