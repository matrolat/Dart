

class User{

    String? _username;
    String? _password;

    void setUser(username,password )
    {
      this._username = username;
      this._password = password;
    }

    dynamic getUser()
    {
        return {"username":this._username, "password":this._password  };
    }
}

void main()
{
  User u = User();
  u.setUser("name", "pass");
  Map<String,String?> mp = u.getUser();

  print(mp["username"]);

}