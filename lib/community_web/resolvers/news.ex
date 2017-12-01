defmodule CommunityWeb.Resolvers.News do
  alias Community.News

  def all_links(_root, _args, _info) do
    links = News.list_links()
    {:ok, links}
  end

  def all_posts(_root, _args, _info) do
    posts = News.list_posts()
    {:ok, posts}
  end

  def create_link(_root, args, _info) do
    # TODO: add detailed error message handling later
    case News.create_link(args) do
      {:ok, link} -> {:ok, link}
      _error -> {:error, "could not create a link"}
    end
  end
end
