defmodule CommunityWeb.Schema.News.PostTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Community.Repo

  alias CommunityWeb.Resolvers

  object :post do
    field :id, non_null(:id)
    field :content, non_null(:string)
    field :link, :link, resolve: assoc(:link)
  end

  object :post_queries do
    field :all_posts, non_null(list_of(non_null(:post))) do
      resolve &Resolvers.News.all_posts/3
    end
  end
end
