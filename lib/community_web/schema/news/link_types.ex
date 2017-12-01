defmodule CommunityWeb.Schema.News.LinkTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Community.Repo

  alias CommunityWeb.Resolvers

  object :link do
    field :id, non_null(:id)
    field :url, non_null(:string)
    field :description, non_null(:string)
    field :post, :post, resolve: assoc(:post)
  end

  object :link_queries do
    field :all_links, non_null(list_of(non_null(:link))) do
      resolve &Resolvers.News.all_links/3
    end
  end

  object :link_mutations do
    field :create_link, :link do
      arg :url, non_null(:string)
      arg :description, non_null(:string)

      resolve &Resolvers.News.create_link/3
    end
  end

end
