<% username=Request.Cookies("LOGON_USER")  
   sql = "SELECT [EI_Title],[EI_FirstName],[EI_LastName],[EI_DepartmentShort] FROM MA_EffectiveUser Where Username =  '"+username+"'"

   set rs_userlogin = db96.execute(sql)
   if rs_userlogin.eof = false then
        name =  rs_userlogin("EI_Title") & "" & rs_userlogin("EI_FirstName") &" "& rs_userlogin("EI_LastName") &" "& rs_userlogin("EI_DepartmentShort")
        user = rs_userlogin("EI_FirstName")
     If   rs_userlogin("EI_DepartmentShort") <>"QUA" and rs_userlogin("EI_DepartmentShort") <>"IT"  Then %>
    <script>
        $(document).ready(function() {
            Swal.fire({
                title: 'Oops...',
                text: "เข้าใช้งานได้เฉพาะ FOI และ MIS เท่านั้น!",
                icon: 'error',
                showCancelButton: false,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'OK'
            }).then((result) => {
                if (result.isConfirmed) {
                    location.href = "http://192.168.35.5/login.asp?href=http://192.168.35.5/FOI/";

                }
            })
        });
    </script>

    <% 
 
     End if




    end if

    logout =  Request.Form("Logout") 
 If logout  ="Logout"  Then
 For Each cookie in Response.Cookies
    Response.Cookies(cookie).Expires = DateAdd("d",-1,now())
  Response.Redirect "http://192.168.35.5/login.asp?href=http://192.168.35.5/FOI/"
Next
 Else
     ' false
 End if
 
part_file = left(Request.ServerVariables("SCRIPT_NAME"),InStrRev(Request.ServerVariables("SCRIPT_NAME"),"/")) 
%>
<style> 
body {
  min-height: 75rem;
  padding-top: 4.5rem;
}
</style>

<nav class="navbar navbar-expand-lg navbar-light fixed-top" style="background-color: #e3f2fd;"> 
  <a class="navbar-brand" href="#"><% If UCase(part_file) ="/FOI/" Then %>
    <img src="./img/logo.gif" width="40" />
  <% Else %>
  <img src="../img/logo.gif" width="40" />
  <% End if %> </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item ">
        <a class="nav-link" href="http://192.168.35.5/FOI/default.asp"> FOI Final</a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="http://192.168.35.5/FOI/FOI_Master/default.asp">FOI Master</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Report
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="http://192.168.35.5/FOI/list_data/list_Foi_master.asp"> FOI Master Report</a>
          <a class="dropdown-item" href="http://192.168.35.5/FOI/list_data/list_Foi.asp">Check List Report</a> 
        </div>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0" method="post">
        <div>
                        <%=name%> &nbsp;
                            <input type="text" name="Logout" value="Logout" hidden="true">
                            <button type="submit" class="btn btn-sm btn-outline-secondary">logout</button>
         </div>
    </form>
  </div>
</nav> 
 