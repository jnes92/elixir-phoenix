defmodule Discuss.Plugs.SetUser do
    import Plug.Conn #for using assign()
    import Phoenix.Controller #for using get_session

    alias Discuss.Repo
    alias Discuss.User

    def init(_params) do 
    end 

    def call(conn, _params) do
        user_id = get_session(conn, :user_id)
        cond do
            user = user_id && Repo.get(User, user_id) -> 
                assign(conn, :user, user)
            true -> # If no condition gets executed, handle failure: 
                assign(conn, :user, nil)
        end 
    end 
end