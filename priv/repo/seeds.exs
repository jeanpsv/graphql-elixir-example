# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Community.Repo.insert!(%Community.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Community.News

{:ok, post1} = News.create_post(%{content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"})
{:ok, post2} = News.create_post(%{content: "Nullam vitae imperdiet quam, id dignissim magna"})
{:ok, _} = News.create_link(%{url: "http://graphql.org/", description: "The Best Query Language", post_id: post1.id})
{:ok, _} = News.create_link(%{url: "http://dev.apollodata.com/", description: "Awesome GraphQL Client", post_id: post2.id})
