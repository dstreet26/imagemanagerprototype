defmodule Imagemanagerprototype.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Imagemanagerprototype.Repo

  alias Imagemanagerprototype.Accounts.{User, Credential,UserType}

  def valid_user_actions do
    ["can_make_thumbnails",
      "can_add_users",
      "can_delete_users",
      "can_add_new_fields",
      "can_modify_fields",
      "can_view_high_res_image",
      "can_comment"
      ]
  end


  def valid_user_actions_checkbox_list do
    valid_user_actions() 
    |> Enum.map(fn x -> %{action: x, isChecked: false} end)
  end

  def authenticate_by_email_password(email, password) do
    query =
      from u in User,
        inner_join: c in assoc(u, :credential),
        where: c.email == ^email

    case Repo.one(query) do
      %User{} = user ->
        fulluser = get_user!(user.id)
        case Comeonin.Pbkdf2.checkpw(password, fulluser.credential.crypted_password) do
          true -> {:ok, user}
          _ -> {:error, :unauthorized}
            
        end
        
      nil ->
        {:error, :unauthorized}
    end
  end

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    # Repo.all(User)
    User 
    |> Repo.all() 
    |> Repo.preload(:credential) 
    |> Repo.preload(:user_type)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  # def get_user!(id), do: Repo.get!(User, id)
  def get_user!(id) do
    User 
    |> Repo.get!(id) 
    |> Repo.preload(:credential)
    |> Repo.preload(:user_type)
  end

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}, user_type_id) do
    %User{}
    |> User.changeset(attrs)
    |> Ecto.Changeset.cast_assoc(:credential, with: &Credential.changeset/2)
    |> Ecto.Changeset.put_change(:user_type_id, user_type_id)
    |> Repo.insert()
  end
  
  

  

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Ecto.Changeset.cast_assoc(:credential, with: &Credential.changeset/2)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  

  @doc """
  Returns the list of credentials.

  ## Examples

      iex> list_credentials()
      [%Credential{}, ...]

  """
  def list_credentials do
    Repo.all(Credential)
  end

  @doc """
  Gets a single credential.

  Raises `Ecto.NoResultsError` if the Credential does not exist.

  ## Examples

      iex> get_credential!(123)
      %Credential{}

      iex> get_credential!(456)
      ** (Ecto.NoResultsError)

  """
  def get_credential!(id), do: Repo.get!(Credential, id)

  @doc """
  Creates a credential.

  ## Examples

      iex> create_credential(%{field: value})
      {:ok, %Credential{}}

      iex> create_credential(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_credential(attrs \\ %{}) do
    %Credential{}
    |> Credential.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a credential.

  ## Examples

      iex> update_credential(credential, %{field: new_value})
      {:ok, %Credential{}}

      iex> update_credential(credential, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_credential(%Credential{} = credential, attrs) do
    credential
    |> Credential.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Credential.

  ## Examples

      iex> delete_credential(credential)
      {:ok, %Credential{}}

      iex> delete_credential(credential)
      {:error, %Ecto.Changeset{}}

  """
  def delete_credential(%Credential{} = credential) do
    Repo.delete(credential)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking credential changes.

  ## Examples

      iex> change_credential(credential)
      %Ecto.Changeset{source: %Credential{}}

  """
  def change_credential(%Credential{} = credential) do
    Credential.changeset(credential, %{})
  end

  # alias Imagemanagerprototype.Accounts.UserType

  @doc """
  Returns the list of user_types.

  ## Examples

      iex> list_user_types()
      [%UserType{}, ...]

  """
  def list_user_types do
    Repo.all(UserType)
  end

  def list_user_types_just_type do
    UserType
    |> Repo.all()
    |> Enum.map(fn x -> x.type end)

  end

  @doc """
  Gets a single user_type.

  Raises `Ecto.NoResultsError` if the User type does not exist.

  ## Examples

      iex> get_user_type!(123)
      %UserType{}

      iex> get_user_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_type!(id), do: Repo.get!(UserType, id)

  @doc """
  Creates a user_type.

  ## Examples

      iex> create_user_type(%{field: value})
      {:ok, %UserType{}}

      iex> create_user_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_type(attrs \\ %{}) do
    %UserType{}
    |> UserType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_type.

  ## Examples

      iex> update_user_type(user_type, %{field: new_value})
      {:ok, %UserType{}}

      iex> update_user_type(user_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_type(%UserType{} = user_type, attrs) do
    user_type
    |> UserType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a UserType.

  ## Examples

      iex> delete_user_type(user_type)
      {:ok, %UserType{}}

      iex> delete_user_type(user_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_type(%UserType{} = user_type) do
    Repo.delete(user_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_type changes.

  ## Examples

      iex> change_user_type(user_type)
      %Ecto.Changeset{source: %UserType{}}

  """
  def change_user_type(%UserType{} = user_type) do
    UserType.changeset(user_type, %{})
  end

  alias Imagemanagerprototype.Accounts.AccessKey

  @doc """
  Returns the list of access_keys.

  ## Examples

      iex> list_access_keys()
      [%AccessKey{}, ...]

  """
  def list_access_keys do
    Repo.all(AccessKey)
    |> Repo.preload(:user_type)
  end

  @doc """
  Gets a single access_key.

  Raises `Ecto.NoResultsError` if the Access key does not exist.

  ## Examples

      iex> get_access_key!(123)
      %AccessKey{}

      iex> get_access_key!(456)
      ** (Ecto.NoResultsError)

  """
  def get_access_key!(id), do: Repo.get!(AccessKey, id) |> Repo.preload(:user_type)

# def check_access_key!(access_key) do
#   query = from ak in AccessKey,
#     where: ak.access_key == ^access_key,
#     select: {
#       ak.id, 
#       ak.access_key, 
#       ak.user_type_id 
#     }
    

#       Repo.one(query)
# end
def check_access_key!(access_key) do
  Repo.get_by(AccessKey, access_key: access_key)
end

  @doc """
  Creates a access_key.

  ## Examples

      iex> create_access_key(%{field: value})
      {:ok, %AccessKey{}}

      iex> create_access_key(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_access_key(attrs \\ %{}, user_type_id) do
    %AccessKey{}
    |> AccessKey.changeset(attrs)
    |> Ecto.Changeset.put_change(:user_type_id, user_type_id)
    |> Repo.insert()
  end

  @doc """
  Updates a access_key.

  ## Examples

      iex> update_access_key(access_key, %{field: new_value})
      {:ok, %AccessKey{}}

      iex> update_access_key(access_key, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_access_key(%AccessKey{} = access_key, attrs) do
    access_key
    |> AccessKey.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a AccessKey.

  ## Examples

      iex> delete_access_key(access_key)
      {:ok, %AccessKey{}}

      iex> delete_access_key(access_key)
      {:error, %Ecto.Changeset{}}

  """
  def delete_access_key(%AccessKey{} = access_key) do
    Repo.delete(access_key)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking access_key changes.

  ## Examples

      iex> change_access_key(access_key)
      %Ecto.Changeset{source: %AccessKey{}}

  """
  def change_access_key(%AccessKey{} = access_key) do
    AccessKey.changeset(access_key, %{})
  end
end
