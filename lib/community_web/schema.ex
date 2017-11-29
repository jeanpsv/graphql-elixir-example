defmodule CommunityWeb.Schema do
  use Absinthe.Schema

  import_types CommunityWeb.Schema.News.LinkTypes

  query do
    import_fields :link_queries
  end

  mutation do
    import_fields :link_mutations
  end
end
