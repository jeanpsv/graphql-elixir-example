defmodule Community.NewsTest do
  use Community.DataCase

  alias Community.News

  describe "links" do
    alias Community.News.Link

    @valid_attrs %{description: "some description", url: "some url"}
    @update_attrs %{description: "some updated description", url: "some updated url"}
    @invalid_attrs %{description: nil, url: nil}

    def link_fixture(attrs \\ %{}) do
      post = insert(:post)
      link_attrs = params_for(:link, post: post)
      
      {:ok, link} =
        attrs
        |> Enum.into(link_attrs)
        |> News.create_link()

      link
    end

    test "list_links/0 returns all links" do
      link = link_fixture()
      assert News.list_links() == [link]
    end

    test "get_link!/1 returns the link with given id" do
      link = link_fixture()
      assert News.get_link!(link.id) == link
    end

    test "create_link/1 with valid data creates a link" do
      post = insert(:post)
      valid_attrs = params_for(:link, post: post)
      assert {:ok, %Link{} = link} = News.create_link(valid_attrs)
      assert link.description == valid_attrs.description
      assert link.url == valid_attrs.url
    end

    test "create_link/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = News.create_link(@invalid_attrs)
    end

    test "update_link/2 with valid data updates the link" do
      link = link_fixture()
      update_attrs = params_for(:link)
      assert {:ok, link} = News.update_link(link, update_attrs)
      assert %Link{} = link
      assert link.description == update_attrs.description
      assert link.url == update_attrs.url
    end

    test "update_link/2 with invalid data returns error changeset" do
      link = link_fixture()
      assert {:error, %Ecto.Changeset{}} = News.update_link(link, @invalid_attrs)
      assert link == News.get_link!(link.id)
    end

    test "delete_link/1 deletes the link" do
      link = link_fixture()
      assert {:ok, %Link{}} = News.delete_link(link)
      assert_raise Ecto.NoResultsError, fn -> News.get_link!(link.id) end
    end

    test "change_link/1 returns a link changeset" do
      link = link_fixture()
      assert %Ecto.Changeset{} = News.change_link(link)
    end
  end

  describe "posts" do
    alias Community.News.Post

    @valid_attrs %{content: "some content"}
    @update_attrs %{content: "some updated content"}
    @invalid_attrs %{content: nil}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> News.create_post()

      post
    end

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert News.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert News.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      assert {:ok, %Post{} = post} = News.create_post(@valid_attrs)
      assert post.content == "some content"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = News.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      assert {:ok, post} = News.update_post(post, @update_attrs)
      assert %Post{} = post
      assert post.content == "some updated content"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = News.update_post(post, @invalid_attrs)
      assert post == News.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = News.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> News.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = News.change_post(post)
    end
  end
end
