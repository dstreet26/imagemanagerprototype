defmodule ImagemanagerprototypeWeb.UserTypeController do
  use ImagemanagerprototypeWeb, :controller

  alias Imagemanagerprototype.Accounts
  alias Imagemanagerprototype.Accounts.UserType

  def index(conn, _params) do
    user_types = Accounts.list_user_types()
    render(conn, "index.html", user_types: user_types)
  end

  def new(conn, _params) do
    # Create checkbox list with nothing checked
    valid_user_actions = Accounts.valid_user_actions_checkbox_list() 
    

    changeset = Accounts.change_user_type(%UserType{})
    render(conn, "new.html", changeset: changeset,valid_user_actions: valid_user_actions)
  end

 

  def create(conn, %{"user_type" => user_type_params}) do

# 
just_checked_actions = get_just_checked_actions(conn.params["checked_actions"])
    

  new_user_type_params = %{type: user_type_params["type"], actions: just_checked_actions}

    case Accounts.create_user_type(new_user_type_params) do
      {:ok, user_type} ->
        conn
        |> put_flash(:info, "User type created successfully.")
        |> redirect(to: user_type_path(conn, :show, user_type))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset, valid_user_actions: Accounts.valid_user_actions_checkbox_list() )
    end
  end

  defp get_just_checked_actions(checked_actions) do
    checked_actions
     |> Enum.filter(fn {x,y} -> y == "true" end) 
     |> Enum.map(fn {x,y} -> x end)
  end

  defp checked_ids(conn, checked_list) do
    conn.params[checked_list]
    |> filter_true_checkbox
  end

  def show(conn, %{"id" => id}) do
    user_type = Accounts.get_user_type!(id)
    render(conn, "show.html", user_type: user_type)
  end

  def edit(conn, %{"id" => id}) do
    #Get the current user_type
    user_type = Accounts.get_user_type!(id)

    #Create checkbox list with boxes pre-checked based on the current user_type
    currently_selected_user_actions = get_selected_actions(Accounts.valid_user_actions(), user_type.actions)


    changeset = Accounts.change_user_type(user_type)
    render(conn, "edit.html", user_type: user_type, changeset: changeset, valid_user_actions: currently_selected_user_actions)
  end

  defp get_selected_actions(valid_actions, current_actions) do
     valid_actions 
     |> Enum.map(fn valid_action -> 
        %{
          action: valid_action,
          isChecked: Enum.any?(current_actions, fn(current_action) -> 
            current_action == valid_action 
            end
            )}
        end
      )
  end

 


  def update(conn, %{"id" => id, "user_type" => user_type_params}) do

just_checked_actions = get_just_checked_actions(conn.params["checked_actions"])

    user_type = Accounts.get_user_type!(id)
    currently_selected_user_actions = get_selected_actions(Accounts.valid_user_actions(), user_type.actions)

    new_user_type_params = %{type: user_type_params["type"], actions: just_checked_actions}

    # case Accounts.update_user_type(user_type, user_type_params) do
    case Accounts.update_user_type(user_type, new_user_type_params) do
      {:ok, user_type} ->
        conn
        |> put_flash(:info, "User type updated successfully.")
        |> redirect(to: user_type_path(conn, :show, user_type))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", user_type: user_type, changeset: changeset, valid_user_actions: currently_selected_user_actions)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_type = Accounts.get_user_type!(id)
    {:ok, _user_type} = Accounts.delete_user_type(user_type)

    conn
    |> put_flash(:info, "User type deleted successfully.")
    |> redirect(to: user_type_path(conn, :index))
  end
end
