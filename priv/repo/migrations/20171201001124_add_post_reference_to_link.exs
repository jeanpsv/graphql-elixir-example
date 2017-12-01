defmodule Community.Repo.Migrations.AddPostReferenceToLink do
  use Ecto.Migration

  def change do
    alter table(:links) do
      add :post_id, references(:posts, on_delete: :delete_all)
    end
  end
end
