<% username=Request.Cookies("LOGON_USER") 'esponse.write (username)
If username ="" Then
    Response.Write("<script>") 
    Response.Write("window.location.href = ' http://192.168.35.5/login.asp?href=http://192.168.35.5/FOI/default.asp'; ")
    Response.Write(" </script>")
  End If

  

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
    <link rel="stylesheet" href="./css/tempusdominus-bootstrap-4.min.css"/>
    <link rel="stylesheet" href="./font-awesome-4.7.0/css/font-awesome.min.css">
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

      <%
      PBOXNO = request.querystring("PBOXNO") 
      sample_mass = request.querystring("sample_mass")
      
      %>
 
   <form action="" method="get">
      <div class="row justify-content-center mt-3">
        <div class="col-12">
          <div class="form-group row justify-content-center">
        
              <div class="col-md-4 input-group">
                <input type="text" class="form-control" id="scanner_input" name="PBOXNO" autocomplete="off" placeholder="Carton Num">
                <!--<span class="input-group-append"> 
                  <button class="btn btn-warning" type="button" data-toggle="modal" data-target="#livestream_scanner">
                    <i class="fa fa-barcode fa-lg"></i> 
                </button>
                </span> -->
              </div>
          </div> 
          <div class="form-group row justify-content-center">
            <div class="form-check col-5 text-right">
              <input class="form-check-input" type="radio" name="sample_mass" id="sample" value="1"  <% If sample_mass = "1" or sample_mass = "" Then response.write("checked")  End if  %>>
              <label class="form-check-label">
                SAMPLE
              </label>
            </div>
            <div class="form-check col-5 ">
              <input class="form-check-input" type="radio" name="sample_mass" id="mass" value="2" <% If sample_mass = "2" Then response.write("checked")  End if  %>>
              <label class="form-check-label">
                MASS
              </label>
            </div>
          </div>
        </div>
        <button type="submit" class="btn btn-outline-warning" id="btn_search">Search</button> 
      </div> 
      </form>
      <hr>

  <%
 
     If PBOXNO <> "" and sample_mass <> "" Then

    If sample_mass ="1" Then
        checkbox = "sample"
    Else
        checkbox  ="mass"
    End if

      sql = "SELECT count(a.CustCode)as cun_code FROM [Base_Process].[dbo].[FOI_Master] as a"
      sql = sql & " inner join [FGMGR].[dbo].[PACKTRAN] as b" 
      sql = sql & " on a.Custcode = b.CUSTCODE and a.KCEPART = b.KCEPART"
      sql = sql & " Where  CAST(b.PBOXNO AS VARCHAR) = '"&PBOXNO&"' " 
      set row= db.execute(sql) 
      
      If row("cun_code") >= "1" Then
   
        sql = "SELECT count(c.PBOXNO)as cun_PBOXNO  FROM [Base_Process].[dbo].[FOI_FinalOuting] a"  &_
            " inner join [Base_Process].[dbo].[FOI_Master] b"  &_
            " on a.txt_kcepart = b.KCEPART and a.txt_custcode = b.CustCode"  &_
            " inner join [FGMGR].[dbo].[PACKTRAN] c"  &_
            " on a.txt_custcode = c.Custcode and a.txt_kcepart = c.KCEPART"  &_
            " Where a.txt_CartonNum  = '"&PBOXNO&"' and a.txt_type = '"&checkbox&"'"     
           
          set cun = db.execute(sql)
          count_data = cun("cun_PBOXNO")

          If count_data >= "1" Then
          
                sql = " SELECT top 1 *,a.updateBy as update_foi,c.PBOXNO,b.KCEPART FROM [Base_Process].[dbo].[FOI_FinalOuting] a" &_
                      " inner join [Base_Process].[dbo].[FOI_Master] b" &_
                      " on a.txt_kcepart = b.KCEPART and a.txt_custcode = b.CustCode" &_
                      " inner join [FGMGR].[dbo].[PACKTRAN] c" &_
                      " on a.txt_custcode = c.Custcode" &_
                      " Where a.txt_CartonNum  = '"&PBOXNO&"' and  c.PBOXNO  = '"&PBOXNO&"' and a.txt_type = '"&checkbox&"' " 
                      set rs = db.execute(sql)

                 
          Else
             sql = "SELECT top 1 *,a.KCEPART FROM [Base_Process].[dbo].[FOI_Master] as a "  &_
                   " inner join [FGMGR].[dbo].[PACKTRAN] as b"  &_
                   " on a.Custcode = b.Custcode and a.KCEPART = b.KCEPART "  &_
                   " Where b.PBOXNO =  '"&PBOXNO&"'" 
             set rs = db.execute(sql)
             //  response.write(rs("PBOXNO"))    
          End if %>
 
      <form id="insert">
      <div class="row justify-content-center">
         <div class="col-md-6"> 
            
        <table class="table table-sm align-middle text-nowrap table-bordered" style="font-size: 12px">
        <tr>
        <th width="10%" class="text-left">CUSTNAME</th>
          <td><%=RS("CustName") %>
          <input type="hidden" name="txt_CartonNum" value="<%=RS("PBOXNO")%>">
          <input type="hidden" name="txt_type" value="<% If sample_mass = "1" Then response.write("SAMPLE") Else  response.write("MASS") End if   %>"> 
          <input type="hidden" name="txt_CustName" value="<%=RS("CustName")%>">
          <input type="hidden" name="txt_kcepart" value="<%=RS("KCEPART")%>">
          <input type="hidden" name="txt_custcode" value="<%=RS("CustCode")%>">
          </td>
          </tr>
          <tr>
          <th class="text-left">CUSTCODE</th>
          <td><%=RS("CustCode")%></td>
          </tr>
          <tr>
          <th class="text-left" >REV.</th>
          <td><%=RS("REV")%></td>
          </tr>
          <tr>
          <th class="text-left">CUSTPART</th>
          <td><%=RS("CustPart")%></td>
          </tr>
      </table>  
      <table class="table table-bordered table-sm text-nowrap align-middle" style="font-size: 12px;">
          <tr>
            <th width="10%">SHIPMENT DATE</th>
             <td>
              <div class="container">
                    <div class="row">
                        <div class="col-sm-12 p-0">
                            <input type="text" autocomplete="off" class="form-control form-control-sm datetimepicker-input" id="datetimepicker5" data-toggle="datetimepicker" data-target="#datetimepicker5" name="txt_Shipment_date"  value="<%If count_data >="1" Then response.write(rs("txt_Shipment_date")) %>" required/>
                        </div> 
                    </div>
                </div>
            </td> 
          </tr>
          <tr>
            <th>INVOICE NO.</th>
            <td><input type="text" autocomplete="off" class="form-control form-control-sm" name="txt_invoice_no" value="<%=rs("SO_NUMBER")%>"></td>
          </tr>
          <tr>
            <th>WO#LOT</th> 
            <td><input type="text" autocomplete="off" class="form-control form-control-sm" name="txt_wo_lot" value="<%=rs("BASEWO")%>"></td>
          </tr>
          <tr>
            <th>MI. ISSUE</th>
            <td><input type="text" autocomplete="off" class="form-control form-control-sm" name="txt_mi_issue" value="<% If count_data >="1" Then response.write(rs("txt_mi_issue"))  %>" required> </td>
          </tr> 
    </table>  
<hr>
       
<% If sample_mass ="2" Then %>
<table class="table table-sm table-bordered" style="font-size: 12px">
        <thead class="table-success">
          <tr>
            <th >DOCUMENT CHECK</th>
            <th scope="col">SPECIFICATION</th>
            <th scope="col">ACTUAL</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td scope="row">1.COPPER THK. (IN HOLE/SURFACE) </td>
            <td>N/A</td>
            <td>N/A</td>
          </tr>
          <tr>
            <td scope="row">2.S/M THK.(ON CKT./LAMINATE)</td>
            <td>N/A</td>
            <td>N/A</td>
          </tr>
          <tr>
            <td scope="row">3.FINISHED SURFACE/THICKNESS</td>
            <td>N/A</td>
            <td>N/A</td>
          </tr>
          <tr>
            <th scope="row">4.HOLE SIZE REFERENCE MI.</th>
            <td>N/A</td>
            <td>N/A</td>
          </tr>
          <tr>
            <td scope="row">5.LINE WIDTH & SPACING REFERENCE MI.</td>
            <td>N/A</td>
            <td>N/A</td>
          </tr>
          <tr>
            <td scope="row">6.DIMENSION PROFILE REFERENCE DRAWING</td>
            <td>N/A</td>
            <td>N/A</td>
          </tr>
          <tr>
            <td scope="row">7.SODERABILITY TESTED</td>
            <td>N/A</td>
            <td>N/A</td>
          </tr>
          <tr>
            <td scope="row">8.IONIC CONTAMINATION <font class="text-info"><%=rs("Ionic")%></font></td>
            <td>N/A</td>
            <td>N/A</td>
          </tr>
          <tr>
            <td scope="row">9.OTHERS <font class="text-info">N/A</font></td>
            <td>N/A</td>
            <td>N/A</td>
          </tr>
        </tbody>
      
    <%  Else  %> 
    <table class="table table-sm table-bordered" style="font-size: 12px">
        <thead class="table-success">
          <tr>
            <th>DOCUMENT CHECK</th> 
            <th scope="col">SPECIFICATION</th>
            <th scope="col">ACTUAL</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td scope="row">1.COPPER THK. (IN HOLE/SURFACE) </td>
       
            <td>N/A </td>
            <td> 
            <div class="form-check"><input class="form-check-input" type="checkbox" name="txt_copper_thk"value="1" <%  if count_data >="1" then if rs("txt_copper_thk") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div></td>
          </tr>
          <tr>
            <td scope="row">2.S/M THK.(ON CKT./LAMINATE)</td>
            <td>N/A</td>
            <td> 
            <div class="form-check"><input class="form-check-input" type="checkbox" name="txt_sm_thk"value="1" <%  if count_data >="1" then if rs("txt_sm_thk") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div></td>
          </tr>
          <tr>
            <td scope="row">3.FINISHED SURFACE/THICKNESS</td>
            <td>N/A</td>
            <td> 
            <div class="form-check"><input class="form-check-input" type="checkbox" name="txt_finish_surface"value="1" <%  if count_data >="1" then if rs("txt_finish_surface") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div></td>
          </tr>
          <tr>
            <td scope="row">4.HOLE SIZE REFERENCE MI.</td>
            <td>N/A</td>
            <td> 
            <div class="form-check"><input class="form-check-input" type="checkbox" name="txt_hole_size"value="1" <%  if count_data >="1" then if rs("txt_hole_size") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div></td>
          </tr>
          <tr>
            <td scope="row">5.LINE WIDTH & SPACING REFERENCE MI.</td>
            <td>N/A</td>
            <td> 
            <div class="form-check"><input class="form-check-input" type="checkbox" name="txt_line_width"value="1" <%  if count_data >="1" then if rs("txt_line_width") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div></td>
          </tr>
          <tr>
            <td scope="row">6.DIMENSION PROFILE REFERENCE DRAWING</td>
            <td>N/A</td>
            <td> 
            <div class="form-check"><input class="form-check-input" type="checkbox" name="txt_dimension_frofile"value="1" <%  if count_data >="1" then if rs("txt_dimension_frofile") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div></td>
          </tr>
          <tr>
            <td scope="row">7.SODERABILITY TESTED</td>
            <td>N/A</td>
            <td> 
            <div class="form-check"><input class="form-check-input" type="checkbox" name="txt_soderability"value="1" <%  if count_data >="1" then if rs("txt_soderability") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div></td>
          </tr>
          <tr>
            <td scope="row">8.IONIC CONTAMINATION  <font class="text-info"><%=rs("Ionic")%></font></td>
            <td>N/A</td>
            <td> 
            <div class="form-check"><input class="form-check-input" type="checkbox" name="txt_ionic"value="1" <%  if count_data >="1" then if rs("txt_ionic") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div></td>
          </tr>
          <tr>
            <td scope="row">9.OTHERS <font class="text-info">N/A</font></td>
            <td>N/A</td>
            <td> 
            <div class="form-check"><input class="form-check-input" type="checkbox" name="txt_others"value="1" <%  if count_data >="1" then if rs("txt_others") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div></td>
          </tr>
        </tbody>
      
     <% End if %>   
<hr>
       
    
      <thead class="table-success ">
        <tr>
          <th scope="col">CUSTOMER REQUIREMENT CHECK</th>
          <th scope="col"></th>
          <th scope="col">ACTUAL</th> 
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row" colspan="3">INSPECTION</th>
        </tr>
        <tr>
          <td>Q'TY SHIP/SAMPLING Q'TY.(PNL)</td>
          <td>N/A</td>
          <td>
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="QTYSHIP" name="txt_QTYSHIP" maxlength="20" value="<% if count_data >="1" then response.write(rs("txt_QTYSHIP"))%>">
          </td>
        </tr>
        <tr>
          <th scope="row" colspan="3">1.SOLDER MASK</th>
        </tr>
        <tr>
          <td>SIDE:
            <input type="checkbox" <% If rs("SM_CS")="X" Then  response.write("checked") End if%> disabled /> C/S
            <input type="checkbox" <% If rs("SM_SS")="X" Then  response.write("checked") End if%> disabled /> S/S
            <input type="checkbox" <% If rs("SM_NA")="X" Then  response.write("checked") End if%> disabled /> N/A
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox"  value="1" name="rbt_SMSide" <% if count_data >="1" then if rs("rbt_SMSide") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>COLOR:<font class="text-info"><%=RS("SM_Color")%></font>
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_SMColor" value="1" <%  if count_data >="1" then if rs("rbt_SMColor") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>BRAND/SERIES: <font class="text-info"><%=RS("SM_Brand")%></font>
          </td>
          <td>N.D.</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_SMBrand"value="1" <%  if count_data >="1" then if rs("rbt_SMBrand") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>
          <th scope="row" colspan="3">2.LEGEND</th>
        </tr>
        <tr>

          <td>SIDE:
            <input type="checkbox" <% If rs("LP_CS")="X" Then  response.write("checked") End if%> disabled /> C/S
            <input type="checkbox" <% If rs("LP_SS")="X" Then  response.write("checked") End if%> disabled /> S/S
            <input type="checkbox" <% If rs("LP_NA")="X" Then  response.write("checked") End if%> disabled /> N/A
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_LPSide"value="1" <%  if count_data >="1" then if rs("rbt_LPSide") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>COLOR: <font class="text-info"><%=RS("LP_Color")%></font>
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_LPColor"value="1" <%  if count_data >="1" then if rs("rbt_LPColor") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>BRAND/SERIES: <font class="text-info"> <%=RS("LP_Brand")%></font>
          </td>
          <td>N.D.</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_LPBrand"value="1" <%  if count_data >="1" then if rs("rbt_LPBrand") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>
          <th scope="row" colspan="3">3.CARBON PRINTING</th>
        </tr>

        <tr>

          <td>SIDE:
            <input type="checkbox" <% If rs("CBI_CS")="X" Then  response.write("checked") End if%> disabled /> C/S
            <input type="checkbox" <% If rs("CBI_SS")="X" Then  response.write("checked") End if%> disabled /> S/S
            <input type="checkbox" <% If rs("CBI_NA")="X" Then  response.write("checked") End if%> disabled /> N/A
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_CBISide"value="1" <%  if count_data >="1" then if rs("rbt_CBISide") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr> 
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_CBIColor"value="1" <%  if count_data >="1" then if rs("rbt_CBIColor") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>
          <th scope="row" colspan="3">4.PELABLE MASK</th>
        </tr>

        <tr>

          <td>SIDE:
            <input type="checkbox" <% If rs("PB_CS")="X" Then  response.write("checked") End if%> disabled /> C/S
            <input type="checkbox" <% If rs("PB_SS")="X" Then  response.write("checked") End if%> disabled /> S/S
            <input type="checkbox" <% If rs("PB_NA")="X" Then  response.write("checked") End if%> disabled /> N/A
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PBSide"value="1" <%  if count_data >="1" then if rs("rbt_PBSide") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>COLOR:<font class="text-info"><%=RS("PB_Color")%></font>
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PBColor"value="1" <%  if count_data >="1" then if rs("rbt_PBColor") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr> 
          <td>BRAND/SERIES: <font class="text-info"><%=RS("PB_Brand")%></font>
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PBBrand"value="1" <%  if count_data >="1" then if rs("rbt_PBBrand") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        <tr>
          <td>POSITION PER ART WORK</td>
          <td>N/A</td>
        </tr>
        </tr>
        <tr>
          <th scope="row" colspan="3">5.MARKING</th>
        </tr>
        <tr>

          <td>SIDE:
            <input type="checkbox" <% If rs("UL_CS")="X" Then  response.write("checked") End if%> disabled /> C/S
            <input type="checkbox" <% If rs("UL_SS")="X" Then  response.write("checked") End if%> disabled /> S/S
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_ULSide"value="1" <%  if count_data >="1" then if rs("rbt_ULSide") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>UL LOGO: <font class="text-info">
          <%=RS("UL_Logo")%></font> /ON <font class="text-info"><%=RS("UL_PrintOn")%></font>
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_ULLogo"value="1" <%  if count_data >="1" then if rs("rbt_ULLogo") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>SIDE:
            <input type="checkbox" <% If rs("DC_CS")="X" Then  response.write("checked") End if%> disabled /> C/S
            <input type="checkbox" <% If rs("DC_SS")="X" Then  response.write("checked") End if%> disabled /> S/S
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_DCSide"value="1" <%  if count_data >="1" then if rs("rbt_DCSide") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>DATECODE: <font class="text-info"><%=RS("DC_DC")%></font> /ON <font class="text-info"> <%=RS("DC_PrintOn")%></font>
          </td>
          <td>N/A</td>
          <td>
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="DCMarking" name="txt_DCMarking" maxlength="20"
              value="<% if count_data >="1" then response.write(rs("txt_DCMarking"))%>">
          </td>
        </tr>
        <tr>

          <td>ET MARK:
            <input type="checkbox" <% If rs("ET_Edge")="X" Then  response.write("checked") End if%> disabled /> EDGE MARK
            <input type="checkbox" <% If rs("ET_Stamp")="X" Then  response.write("checked") End if%> disabled /> STAMP
          </td>
          <td>N/A</td>
          <td>
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="ETMark" name="txt_ETMark" maxlength="20"
            value="<% if count_data >="1" then response.write(rs("txt_ETMark"))%>">
          </td>
        </tr>
        <tr>

          <td>SIDE:
            <input type="checkbox" <% If rs("ET_CS")="X" Then  response.write("checked") End if%> disabled /> C/S
            <input type="checkbox" <% If rs("ET_SS")="X" Then  response.write("checked") End if%> disabled /> S/S
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_ETSide"value="1" <%  if count_data >="1" then if rs("rbt_ETSide") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>CUST. P/N(ON BOARD): <font class="text-info">
          <%=RS("CustOnBoard")%></font>
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_CustOnBoard"value="1" <%  if count_data >="1" then if rs("rbt_CustOnBoard") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>
          <td>KCE P/N(ON BOARD): <font class="text-info">
          <%=RS("KCEOnBoard")%></font>
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_KCEOnBoard"value="1" <%  if count_data >="1" then if rs("rbt_KCEOnBoard") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>
          <th scope="row" colspan="3">6. SURFACE FINISH</th>
        </tr>
        <tr>

          <td>SURFACE FINISH: <font class="text-info">
          <%=RS("Surface")%></font>
          </td>
          <td>N.D.</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_Surface"value="1" <%  if count_data >="1" then if rs("rbt_Surface") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>DATECODE CONTROL: <font class="text-info">
          <%=RS("DCControl")%></font> WEEK</td>
          <td>N/A</td>
          <td>
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="DCControl" name="txt_DCControl" maxlength="20"
            value="<% if count_data >="1" then response.write(rs("txt_DCControl"))%>">
          </td>
        </tr>

        <tr>
          <th scope="row" colspan="3">7. STEP/REPERT</th>
        </tr>
        <tr>

          <td>
            <input type="checkbox" <% If rs("ST_Single")="X" Then  response.write("checked") End if%> disabled /> SINGLE
            <input type="checkbox" <% If rs("ST_Mulity")="X" Then  response.write("checked") End if%> disabled /> MULTIFORM
            <font class="text-info">
          <%=RS("ST_Pcs")%></font> PCS.
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_Step"value="1" <%  if count_data >="1" then if rs("rbt_Step") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" <% If rs("XO_Scrap")="X" Then  response.write("checked") End if%> disabled /> SCRAP ALLOW
            <font class="text-info"><%=RS("XO_Qty")%>
            </font> PCS/MULTIFORM
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_XOScrap"value="1" <%  if count_data >="1" then if rs("rbt_XOScrap") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" XO_SCMark != "" && data.XO_SCMark <% If rs("CBI_NA")="X" Then  response.write("checked") End if%> disabled /> SCRAP MARK
            <font class="text-info">   <%=RS("XO_MarkIDE")%> </font>
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_XOSCMark"value="1" <%  if count_data >="1" then if rs("rbt_XOSCMark") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>BOARD PROFILE <font class="text-info">
          <%=RS("BoardProfile")%></font>
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_BoardProfile"value="1" <%  if count_data >="1" then if rs("rbt_BoardProfile") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
      </tbody>
     
      <thead class="table-success">
        <tr>
          <th scope="col">PACKAGE & PACKING CHECK</th>
          <th scope="col"></th>
          <th scope="col">ACTUAL</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row" colspan="3">1. PACKING</th>
        </tr>
        <tr>
          <td>Q'TY PACKAGE /SAMPLING Q'TY PACKAGE</td>
          <td>N/A</td>
          <td>
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="QTYPACKAGE" name="txt_QTYPACKAGE" maxlength="20" value="<% if count_data >="1" then response.write(rs("txt_QTYPACKAGE"))%>"/>
          </td>
        </tr>
        <tr>

          <td>Q'TY /PACK <font class="text-info">
          <%=RS("PS_QtyPack")%></font> PNL</td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PS_QtyPack"value="1" <%  if count_data >="1" then if rs("rbt_PS_QtyPack") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" <% If rs("PS_OneWayBoard")="X" Then  response.write("checked") End if%> disabled />
            Arrange Boards with one direction
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PS_OneWayBoard"value="1" <%  if count_data >="1" then if rs("rbt_PS_OneWayBoard") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" <% If rs("PS_VacuumPackPE")="X" Then  response.write("checked") End if%> disabled />
            Vacuum Pack by Air bubble & Placstic Wrap (PE)
          </td>
          <td>N.D.</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PS_VacuumPackPE"value="1" <%  if count_data >="1" then if rs("rbt_PS_VacuumPackPE") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" <% If rs("PS_VacuumPackESD")="X" Then  response.write("checked") End if%> disabled />
            Vacuum Pack by Air bubble & Placstic Wrap (ESD)
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PS_VacuumPackESD"value="1" <%  if count_data >="1" then if rs("rbt_PS_VacuumPackESD") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" <% If rs("PS_VacuumNylon")="X" Then  response.write("checked") End if%> disabled />
            Vacuum Heat seal by Nylon Plastic bag
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PS_VacuumNylon"value="1" <%  if count_data >="1" then if rs("rbt_PS_VacuumNylon") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" <% If rs("PS_Aluminum")="X" Then  response.write("checked") End if%> disabled /> Vacuum
            Pack ด้วย Aluminum bag (MBB Packing)
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PS_Aluminum"value="1" <%  if count_data >="1" then if rs("rbt_PS_Aluminum") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" <% If rs("PS_SulphurFree")="X" Then  response.write("checked") End if%> disabled />
            Cover Sulphur free paper  top and bottom don't touch Plastic bag
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PS_SulphurFree"value="1" <%  if count_data >="1" then if rs("rbt_PS_SulphurFree") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" <% If rs("PS_Siliga")="X" Then  response.write("checked") End if%> disabled /> SILICA GEL
            <font class="text-info">
          <%=RS("PS_RemarkSILICAGEL")%></font>
          </td>
          <td>N.D.</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PS_RemarkSILICAGEL"value="1" <%  if count_data >="1" then if rs("rbt_PS_RemarkSILICAGEL") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" <% If rs("PS_HIC")="X" Then  response.write("checked") End if%> disabled /> Humidity indicator card (HIC) <font class="text-info">
          <%=RS("PS_HIC10")%></font> 
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PS_HIC"value="1" <%  if count_data >="1" then if rs("rbt_PS_HIC") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" <% If rs("PS_Others")="X" Then  response.write("checked") End if%> disabled /> Other <font
              class="text-info"> <%=RS("PS_OthersRemark")%></font> %
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PS_Others"value="1" <%  if count_data >="1" then if rs("rbt_PS_Others") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>
          <th scope="row" colspan="3">2.PACKING LABELING</th>
        </tr>
        <tr>
          <td>
            <input type="checkbox" <% If rs("PL_KCELabel")="X" Then  response.write("checked") End if%> disabled /> KCE LABEL
            /KCE P/N <font class="text-info">
          <%=RS("KCEPART")%></font> REV. <font class="text-info"><%=RS("REV")%></font>
          </td>
          <td>N.D.</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PL_KCELabel"value="1" <%  if count_data >="1" then if rs("rbt_PL_KCELabel") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" <% If rs("CustPart")="X" Then  response.write("checked") End if%> disabled /> CUST P/N <font
              class="text-info">
          <%=RS("CustPart")%></font>
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PL_CustPart"value="1" <%  if count_data >="1" then if rs("rbt_PL_CustPart") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" <% If rs("PL_CustLabel")="X" Then  response.write("checked") End if%> disabled /> CUST LABEL
          </td>
          <td>N/A</td>
          <td>
            <!--<div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PL_CustLabel"value="1" <%  if count_data >="1" then if rs("rbt_PL_CustLabel") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>-->
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="rbt_PL_CustLabel" name="rbt_PL_CustLabel" maxlength="20"
            value="<% if count_data >="1" then response.write(rs("rbt_PL_CustLabel"))%>">
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" <% If rs("PL_Rohs")="X" Then  response.write("checked") End if%> disabled /> RoHS Conpliance
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PL_Rohs"value="1" <%  if count_data >="1" then if rs("rbt_PL_Rohs") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>SPECIAL MARK <font class="text-info">
          <%=RS("PL_SpecialLabelRemark")%></font>
          </td>
          <td>N/A</td>
          <td>
             <!--<div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PL_SpecialLabelRemark"value="1" <%  if count_data >="1" then if rs("rbt_PL_SpecialLabelRemark") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div> -->
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="rbt_PL_SpecialLabelRemark" name="rbt_PL_SpecialLabelRemark" maxlength="20"
            value="<% if count_data >="1" then response.write(rs("rbt_PL_SpecialLabelRemark"))%>"> 
          </td>
        </tr>
        <tr>
          <th scope="row">3.CARTON PACKING</th>
        </tr>
        <tr>

          <td>Q'TY/BOX (REFER.PACKING LIST</td>
          <td>N/A</td>
          <td>
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="TQYCarton" name="txt_TQYCarton" maxlength="20"
            value="<% if count_data >="1" then response.write(rs("txt_TQYCarton"))%>"> 
          </td>
        </tr>
        <tr>

          <td>MATERIAL <font class="text-info">
          <%=RS("CT_Material")%></font>
          </td>
          <td>N.D.</td>
          <td>
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="CARTONMATERIAL" name="txt_CT_Material"
              maxlength="20" value="<% if count_data >="1" then response.write(rs("txt_CT_Material"))%>">
          </td>
        </tr>
        <tr>

          <td>MAX WEIGHT <font class="text-info">
          <%=RS("CT_Weight")%></font> KG.(MAX)</td>
          <td>N/A</td>
          <td>
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="CARTONWEIGHT" name="txt_CT_Weight"
              maxlength="20" value="<% if count_data >="1" then response.write(rs("txt_CT_Weight"))%>">
          </td>
        </tr>
        <tr>
          <td>Q'TY BOX PER SHIPMENT : REF. PACKING LIST</td>
          <td>N/A</td>
          <td>
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="CARTONQTYBOX" name="txt_CT_QTY" maxlength="20"
            value="<% if count_data >="1" then response.write(rs("txt_CT_QTY"))%>">
          </td>
        </tr>
        <tr>
          <th scope="row">4.CARTON LABELING</th>
        </tr>
        <tr>

          <td>
            <input type="checkbox"  <% If rs("CL_KCELabel")="X" Then  response.write("checked") End if%> disabled /> KCE LABEL
            /KCE P/N <font class="text-info">
          <%=RS("KCEPART")%></font> REV. <font class="text-info"><%=RS("REV")%></font>
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_CL_KCEPART"value="1" <%  if count_data >="1" then if rs("rbt_CL_KCEPART") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" <% If rs("CustPart")="X" Then  response.write("checked") End if%> disabled /> CUST P/N <font
              class="text-info">
          <%=RS("CustPart")%></font>
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_CL_CustPart"value="1" <%  if count_data >="1" then if rs("rbt_CL_CustPart") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" <% If rs("CL_CustLabel")="X" Then  response.write("checked") End if%> disabled /> CUST LABEL <font class="text-info">
          <%=RS("CL_CustLabel") %></font>
          </td>
          <td>N/A</td>
          <td>
            <!--<div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_CL_CustLabel"value="1" <%  if count_data >="1" then if rs("rbt_CL_CustLabel") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>-->
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="rbt_CL_CustLabel" name="rbt_CL_CustLabel" maxlength="20"
            value="<% if count_data >="1" then response.write(rs("rbt_CL_CustLabel"))%>">
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" <% If RS("CL_Rohs")="X" Then  response.write("checked") End if %> disabled /> RoHS Compliance <font class="text-info"><%=RS("CL_Rohs")%></font>
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_CL_Rohs"value="1" <% if count_data >="1" then if rs("rbt_CL_Rohs") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>
           </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" 
              disabled /> SPECIAL MARK <font class="text-info">
          <%=RS("CL_SpecialLabelRemark")%></font>
          </td>
          <td>N/A</td>
          <td>
            <!--<div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_CL_SpecialLabelRemark"value="1" <% if count_data >="1" then if rs("rbt_CL_SpecialLabelRemark") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>-->
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="rbt_CL_SpecialLabelRemark" name="rbt_CL_SpecialLabelRemark" maxlength="20"
            value="<% if count_data >="1" then response.write(rs("rbt_CL_SpecialLabelRemark"))%>"> 
          </td>
        </tr>
        <tr>

          <td>SAMPLING BOX NO.</td>
          <td>N/A</td>
          <td>
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="txt_CL_SAMPLING" name="txt_CL_SAMPLING"
              maxlength="150" value="<% if count_data >="1" then response.write(rs("txt_CL_SAMPLING"))%>">
          </td>
        </tr>
      </tbody>
  
      <thead class="table-success">
        <tr>
          <th scope="col"></th>
          <th scope="col"></th>
          <th scope="col">ACTUAL</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row" colspan="3">1.DOCUMENT SUBMISSION</th>
        </tr>
        <tr>
          <td>
            <input type="checkbox" <% If rs("CBI_NA")="X" Then  response.write("checked") End if%> disabled /> C OF C
          </td>
          <td>N/A</td>
          <td>
           <!--<div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_QA_CofC"value="1" <%  if count_data >="1" then if rs("rbt_QA_CofC") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>--> 
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="rbt_QA_CofC" name="rbt_QA_CofC"
              maxlength="150" value="<% if count_data >="1" then response.write(rs("rbt_QA_CofC"))%>">
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" <% If rs("QA_INS_FA")="X" Then  response.write("checked") End if%> disabled /> INSPECTION /
            FA. REPORT
          </td>
          <td>N/A</td>
          <td>
            <!--<div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_QA_INS_FA"value="1" <%  if count_data >="1" then if rs("rbt_QA_INS_FA") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>-->
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="rbt_QA_INS_FA" name="rbt_QA_INS_FA"
              maxlength="150" value="<% if count_data >="1" then response.write(rs("rbt_QA_INS_FA"))%>">
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" <% If rs("QA_SolderTest")="X" Then  response.write("checked") End if%> disabled />
            SOLDERABILITY TEST REPORT
          </td>
          <td>N/A</td>
          <td>
            <!--<div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_QA_SolderTest"value="1" <%  if count_data >="1" then if rs("rbt_QA_SolderTest") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>-->
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="rbt_QA_SolderTest" name="rbt_QA_SolderTest"
              maxlength="150" value="<% if count_data >="1" then response.write(rs("rbt_QA_SolderTest"))%>">
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" <% If rs("QA_PHOTO")="X" Then  response.write("checked") End if%> disabled /> PHOTO REPORT
          </td>
          <td>N/A</td>
          <td>
             <!--<div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_QA_PHOTO"value="1" <%  if count_data >="1" then if rs("rbt_QA_PHOTO") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>-->
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="rbt_QA_PHOTO" name="rbt_QA_PHOTO"
              maxlength="150" value="<% if count_data >="1" then response.write(rs("rbt_QA_PHOTO"))%>">
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" <% If rs("QA_SPC")="X" Then  response.write("checked") End if%> disabled /> SPC REPORT
          </td>
          <td>N/A</td>
          <td>
            <!--<div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_QA_SPC"value="1" <%  if count_data >="1" then if rs("rbt_QA_SPC") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>-->
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="rbt_QA_SPC" name="rbt_QA_SPC"
              maxlength="150" value="<% if count_data >="1" then response.write(rs("rbt_QA_SPC"))%>">
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" <% If rs("QA_MICRO")="X" Then  response.write("checked") End if%> disabled /> MICRO SECTION
            <font class="text-info">
          <%=RS("QA_Pcs")%></font> PCS.
          </td>
          <td>N/A</td>
          <td>
            <!--<div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_QA_MICRO"value="1" <%  if count_data >="1" then if rs("rbt_QA_MICRO") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>-->
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="rbt_QA_MICRO" name="rbt_QA_MICRO"
              maxlength="150" value="<% if count_data >="1" then response.write(rs("rbt_QA_MICRO"))%>">
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" <% If rs("QA_SampleBoardTest")="X" Then  response.write("checked") End if%> disabled/> SAMPLE BOARD TEST <font class="text-info">
          <%=RS("QA_Test")%></font> PCS.
          </td>
          <td>N/A</td>
          <td>
            <!--<div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_QA_SampleBoardTest"value="1" <%  if count_data >="1" then if rs("rbt_QA_SampleBoardTest") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>-->
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="rbt_QA_SampleBoardTest" name="rbt_QA_SampleBoardTest"
              maxlength="150" value="<% if count_data >="1" then response.write(rs("rbt_QA_SampleBoardTest"))%>">
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" <% If rs("QA_SampleBoardNotTest")="X" Then  response.write("checked") End if%>
              disabled /> SAMPLE BOARD NO TEST <font class="text-info">
          <%=RS("QA_NotTest")%></font> PCS.
          </td>
          <td>N/A</td>
          <td>
            <!--<div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_QA_SampleBoardNotTest"value="1" <%  if count_data >="1" then if rs("rbt_QA_SampleBoardNotTest") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>-->
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="rbt_QA_SampleBoardNotTest" name="rbt_QA_SampleBoardNotTest"
              maxlength="150" value="<% if count_data >="1" then response.write(rs("rbt_QA_SampleBoardNotTest"))%>">
          </td>
        </tr>
        <tr> 
          <td>
            <input type="checkbox"  <% If rs("QA_PPAP")="X" Then  response.write("checked") End if%> disabled /> PPAP LEVEL <font
              class="text-info">
          <%=RS("QA_Level")%></font> PCS.
          </td>
          <td>N/A</td>
          <td>
            <!--<div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_QA_PPAP"value="1" <%  if count_data >="1" then if rs("rbt_QA_PPAP") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>-->
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="rbt_QA_PPAP" name="rbt_QA_PPAP"
              maxlength="150" value="<% if count_data >="1" then response.write(rs("rbt_QA_PPAP"))%>">
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" <% If rs("QA_Other")="X" Then  response.write("checked") End if%> disabled /> OTHER <font
              class="text-info">
          <%=RS("QA_OtherRequirement")%></font>
          </td>
          <td>N/A</td>
          <td>
           <!--<div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_QA_Other"value="1" <%  if count_data >="1" then if rs("rbt_QA_Other") = "1" then response.write("checked")  end if end if %>>
            <label class="form-check-label"> OK </label></div>--> 
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="rbt_QA_Other" name="rbt_QA_Other"
              maxlength="150" value="<% if count_data >="1" then response.write(rs("rbt_QA_Other"))%>">
          </td>
        </tr>
        <tr>

          <td>DATECODE / Q'TY SHIPMENT</td>
          <td></td>
          <td>
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="DCSHIP" name="txt_DCSHIP" maxlength="50"
            value="<% if count_data >="1" then response.write(rs("txt_DCSHIP"))%>">
          </td>
        </tr>
        <tr>
          <!--<td colspan="3">REMARK</td> --> 
        </tr>
        <tr> 
          <!--<td colspan="3">- ห้ามส่งงาน DATA CODE เกิน 12 สัปดาห์</td> -->
        </tr>

      </tbody>
    </table>  
    
    
            <div class="modal-footer">
            <button type="submit" class="btn btn-outline-success text-right" id="btn_Save">Save</button>
            </div>  
         </div>
      </div> 
      </form>
       <%
        Else %>
        <div class="row justify-content-center">
          <div class="col-md-6">
            <div class="alert alert-danger text-center" role="alert">FOI Master No Data</div>
          </div>
        </div>
      <%
        End if 

       End if 
       %>
       
    </div>
        
        </tbody> 

        </table>
       
    <hr>
       <!--#include file = "./manages/modal.asp"-->
 
    <script src="./js/jquery.min.js"></script>
    <script src="./js/bootstrap.bundle.min.js"></script>
    <script src="./js/Inspection.js"></script>
    <script src="./manages/script.js"></script>
    <script src="./js/sweetalert2@11.js"></script>
    <script type="text/javascript" src="./js/moment.min.js"></script>
    <script src="./js/tempusdominus-bootstrap-4.min.js" crossorigin="anonymous"></script>
    <script src="./js/quagga.min.js"></script> 
    <script src="./manages/scan_barcode.js"></script>
    <style>
      #interactive.viewport {position: relative; width: 100%; height: auto; overflow: hidden; text-align: center;}
      #interactive.viewport > canvas, #interactive.viewport > video {max-width: 100%;width: 100%;}
      canvas.drawing, canvas.drawingBuffer {position: absolute; left: 0; top: 0;}
    </style>
    <script type="text/javascript">
            $(function () {
                $('#datetimepicker5').datetimepicker({
                    format: 'L'
                });
            }); 
    </script>
 
  </body> 
  </html>