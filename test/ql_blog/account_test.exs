defmodule QlBlog.AccountTest do
  use QlBlog.DataCase

  alias QlBlog.Account

  describe "users" do
    alias QlBlog.Account.User

    @valid_attrs %{age: 42, is_admin: true, name: "some name", user_type: "some user_type"}
    @update_attrs %{
      age: 43,
      is_admin: false,
      name: "some updated name",
      user_type: "some updated user_type"
    }
    @invalid_attrs %{age: nil, is_admin: nil, name: nil, user_type: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Account.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Account.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Account.create_user(@valid_attrs)
      assert user.age == 42
      assert user.is_admin == true
      assert user.name == "some name"
      assert user.user_type == "some user_type"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Account.update_user(user, @update_attrs)
      assert user.age == 43
      assert user.is_admin == false
      assert user.name == "some updated name"
      assert user.user_type == "some updated user_type"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_user(user, @invalid_attrs)
      assert user == Account.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Account.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Account.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Account.change_user(user)
    end
  end
end
