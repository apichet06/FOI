<input type="text" autocomplete="off" class="form-control form-control-sm" id="rbt_PL_SpecialLabelRemark" name="rbt_PL_SpecialLabelRemark" maxlength="20"
value="<% if count_data >="1" then response.write(rs("rbt_PL_SpecialLabelRemark"))%>">

<% username =Request.Cookies("LOGON_USER") 'esponse.write (username)
  If username ="" Then
    Response.Write("<script>") 
    Response.Write("window.location.href = ' http://192.168.35.5/login.asp?href=http://192.168.35.5/FOI/default.asp'; ")
    Response.Write("</script>")
  End If
  'response.write(Year(NOW()) &"-"& Month(NOW()) &"-"& day(NOW()) &" "& Time)

  %>
  <!--#include file = "backend/connection/db.asp"-->
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <title>FOI</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="manifest" href="./manifest.json">
  </head>

  <body>
    <!--#include file="memu/menu.asp"--> 
    <div class="container-fluid">
      <div class="row pt-3">
        <div class="col-sm-12">
          <div class="text-center pt-2 font-weight-bold" style="font-size:20px;">
            FINAL OUTING INSPECTION CHECK LIST
            <hr> 
          </div>
        </div>
      </div>

      <div class="row justify-content-center mt-3">
        <div class="col-12">
          <div class="form-group row">
            <label class="col-4 col-form-label text-right">CUSTCODE :</label>
            <div class="col-5">
              <input type="text" class="form-control" id="txt_custcode" value="10122">
            </div>
          </div>
          <div class="form-group row">
            <label class="col-4 col-form-label text-right">KCEPART :</label>
            <div class="col-5">
              <input type="text" class="form-control" id="txt_kcepart" value="1AE545M06001">
            </div>
          </div>
          <div class="form-group row justify-content-center">
            <div class="form-check col-5 text-right">
              <input class="form-check-input" type="radio" name="sample_mass" id="sample" value="1" checked>
              <label class="form-check-label">
                SAMPLE
              </label>
            </div>
            <div class="form-check col-5 ">
              <input class="form-check-input" type="radio" name="sample_mass" id="mass" value="2">
              <label class="form-check-label">
                MASS
              </label>
            </div>
          </div>
        </div>
        <button type="button" class="btn btn-outline-warning" id="btn_search">Search</button> 
      </div> 
      <hr>
      <form id="insert">
      <div class="row justify-content-center">
         <div class="col-md-6">  
         <div id="inspection-list"></div> 
         </div>
      </div> 
      </form> 
    </div>
    
    <hr>
     <script src="./js/jquery.min.js"></script>
    <script src="./js/bootstrap.bundle.min.js"></script>
    <script src="./js/Inspection.js"></script>
    <script src="./manages/script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> 
  </body> 
  </html>