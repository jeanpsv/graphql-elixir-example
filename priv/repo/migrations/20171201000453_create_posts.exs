defmodule Community.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :content, :string
      add :link_id, references(:links, on_delete: :nothing)

      timestamps()
    end

    create index(:posts, [:link_id])
  end
end
