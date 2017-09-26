defmodule Imagemanagerprototype.AccountsTest do
  use Imagemanagerprototype.DataCase

  alias Imagemanagerprototype.Accounts

  describe "users" do
    alias Imagemanagerprototype.Accounts.User

    @valid_attrs %{name: "some name", username: "some username"}
    @update_attrs %{name: "some updated name", username: "some updated username"}
    @invalid_attrs %{name: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.name == "some name"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Accounts.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.name == "some updated name"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "credentials" do
    alias Imagemanagerprototype.Accounts.Credential

    @valid_attrs %{email: "some email"}
    @update_attrs %{email: "some updated email"}
    @invalid_attrs %{email: nil}

    def credential_fixture(attrs \\ %{}) do
      {:ok, credential} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_credential()

      credential
    end

    test "list_credentials/0 returns all credentials" do
      credential = credential_fixture()
      assert Accounts.list_credentials() == [credential]
    end

    test "get_credential!/1 returns the credential with given id" do
      credential = credential_fixture()
      assert Accounts.get_credential!(credential.id) == credential
    end

    test "create_credential/1 with valid data creates a credential" do
      assert {:ok, %Credential{} = credential} = Accounts.create_credential(@valid_attrs)
      assert credential.email == "some email"
    end

    test "create_credential/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_credential(@invalid_attrs)
    end

    test "update_credential/2 with valid data updates the credential" do
      credential = credential_fixture()
      assert {:ok, credential} = Accounts.update_credential(credential, @update_attrs)
      assert %Credential{} = credential
      assert credential.email == "some updated email"
    end

    test "update_credential/2 with invalid data returns error changeset" do
      credential = credential_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_credential(credential, @invalid_attrs)
      assert credential == Accounts.get_credential!(credential.id)
    end

    test "delete_credential/1 deletes the credential" do
      credential = credential_fixture()
      assert {:ok, %Credential{}} = Accounts.delete_credential(credential)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_credential!(credential.id) end
    end

    test "change_credential/1 returns a credential changeset" do
      credential = credential_fixture()
      assert %Ecto.Changeset{} = Accounts.change_credential(credential)
    end
  end

  describe "user_types" do
    alias Imagemanagerprototype.Accounts.UserType

    @valid_attrs %{actions: [], type: "some type"}
    @update_attrs %{actions: [], type: "some updated type"}
    @invalid_attrs %{actions: nil, type: nil}

    def user_type_fixture(attrs \\ %{}) do
      {:ok, user_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user_type()

      user_type
    end

    test "list_user_types/0 returns all user_types" do
      user_type = user_type_fixture()
      assert Accounts.list_user_types() == [user_type]
    end

    test "get_user_type!/1 returns the user_type with given id" do
      user_type = user_type_fixture()
      assert Accounts.get_user_type!(user_type.id) == user_type
    end

    test "create_user_type/1 with valid data creates a user_type" do
      assert {:ok, %UserType{} = user_type} = Accounts.create_user_type(@valid_attrs)
      assert user_type.actions == []
      assert user_type.type == "some type"
    end

    test "create_user_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user_type(@invalid_attrs)
    end

    test "update_user_type/2 with valid data updates the user_type" do
      user_type = user_type_fixture()
      assert {:ok, user_type} = Accounts.update_user_type(user_type, @update_attrs)
      assert %UserType{} = user_type
      assert user_type.actions == []
      assert user_type.type == "some updated type"
    end

    test "update_user_type/2 with invalid data returns error changeset" do
      user_type = user_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user_type(user_type, @invalid_attrs)
      assert user_type == Accounts.get_user_type!(user_type.id)
    end

    test "delete_user_type/1 deletes the user_type" do
      user_type = user_type_fixture()
      assert {:ok, %UserType{}} = Accounts.delete_user_type(user_type)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user_type!(user_type.id) end
    end

    test "change_user_type/1 returns a user_type changeset" do
      user_type = user_type_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user_type(user_type)
    end
  end

  describe "access_keys" do
    alias Imagemanagerprototype.Accounts.AccessKey

    @valid_attrs %{access_key: "some access_key"}
    @update_attrs %{access_key: "some updated access_key"}
    @invalid_attrs %{access_key: nil}

    def access_key_fixture(attrs \\ %{}) do
      {:ok, access_key} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_access_key()

      access_key
    end

    test "list_access_keys/0 returns all access_keys" do
      access_key = access_key_fixture()
      assert Accounts.list_access_keys() == [access_key]
    end

    test "get_access_key!/1 returns the access_key with given id" do
      access_key = access_key_fixture()
      assert Accounts.get_access_key!(access_key.id) == access_key
    end

    test "create_access_key/1 with valid data creates a access_key" do
      assert {:ok, %AccessKey{} = access_key} = Accounts.create_access_key(@valid_attrs)
      assert access_key.access_key == "some access_key"
    end

    test "create_access_key/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_access_key(@invalid_attrs)
    end

    test "update_access_key/2 with valid data updates the access_key" do
      access_key = access_key_fixture()
      assert {:ok, access_key} = Accounts.update_access_key(access_key, @update_attrs)
      assert %AccessKey{} = access_key
      assert access_key.access_key == "some updated access_key"
    end

    test "update_access_key/2 with invalid data returns error changeset" do
      access_key = access_key_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_access_key(access_key, @invalid_attrs)
      assert access_key == Accounts.get_access_key!(access_key.id)
    end

    test "delete_access_key/1 deletes the access_key" do
      access_key = access_key_fixture()
      assert {:ok, %AccessKey{}} = Accounts.delete_access_key(access_key)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_access_key!(access_key.id) end
    end

    test "change_access_key/1 returns a access_key changeset" do
      access_key = access_key_fixture()
      assert %Ecto.Changeset{} = Accounts.change_access_key(access_key)
    end
  end
end
