defmodule ImagemanagerprototypeWeb.CMS.PageView do
  use ImagemanagerprototypeWeb, :view

  alias Imagemanagerprototype.CMS
  def author_name(%CMS.Page{author: author}) do
  	author.user.name
  end
end
