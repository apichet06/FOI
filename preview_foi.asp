<% username=Request.Cookies("LOGON_USER") 'esponse.write (username)
If username ="" Then
    Response.Write("<script>") 
    Response.Write("window.location.href = ' http://192.168.35.5/login.asp?href=http://192.168.35.5/FOI/default.asp'; ")
    Response.Write(" </script>")
  End If

  'response.write(Year(NOW()) &"-"& Month(NOW()) &"-"& day(NOW()) &" "& Time)

  %>
  <!--#include file = "backend/connection/db.asp"-->

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Preview FOI</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css" />
</head>
<style>
    table.bordered>tbody>tr>td {
        border: 1px solid white;
    }
    table{
        font-size:12px;
    } 
    @media print {
    tr.vendorListHeading {
        background-color: #1a4567 !important;
        -webkit-print-color-adjust: exact; 
    }
}

@media print {
    .vendorListHeading th {
        color: white !important;
    }
}
</style>

<body>
 <!--#include file="memu/menu.asp"--> 

 <%
 
    FO_ID = request.querystring("FO_ID")
    CUSTCODE = request.querystring("CUSTCODE")
    KCEPART = request.querystring("KCEPART")

    sql = " SELECT *,b.updateBy as update_foi FROM [FGMGR].[dbo].[PACKTRAN] a " &_
          " inner join [Base_Process].[dbo].[FOI_FinalOuting] b " &_
          " on b.txt_kcepart = a.KCEPART and b.txt_custcode = a.CUSTCODE " &_
          " inner join [Base_Process].[dbo].[FOI_Master] c " &_
          " on a.KCEPART = c.KCEPART and c.CustCode = a.CUSTCODE " &_
          " where a.KCEPART = '"&KCEPART&"' and a.CUSTCODE = '"&CUSTCODE&"' and b.FO_ID ='"&FO_ID&"'"

    RS = db.execute(sql)
    
  %>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <table class=" table table-sm table-bordered table-responsive text-nowrap align-middle ">
                    <tr>
                        <td><img src="./img/logo_kce.png" width="100" /></td>
                        <td width="100%" class="text-center text-nowrap align-middle table-success">
                            FINAL OUTGOING INSPECTION CHECK LIST
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table width="100%" class="bordered table-responsive-sm" >
                                <tr>
                                    <td colspan="2">CODE : <u class="text-primary"><%=RS("CustCode")%></u></td>
                                    <td colspan="4" class="text-nowrap align-middle">CUSTOMER NAME : <u class="text-primary"><%=RS("CustName")%></u> </td>
                                </tr>
                                <tr>
                                    <td colspan="2">KCE P/N : <u class="text-primary"><%=RS("KCEPART")%></u> </td>
                                    <td>REV. : <u class="text-primary"><%=RS("REV")%></u></td>
                                    <td colspan="3">CUSTOMER PART : <u class="text-primary"> <%=RS("CustPart")%></u></td>
                                </tr>
                                <tr>
                                    <td colspan="3"></td>
                                    <td> 
                                    <%  If RS("txt_type") = "SAMPLE" Then %>
                                      <img src="./img/checkbox1.png" width="15" />
                                    <% Else %>
                                       <img src="./img/checkbox2.png" width="15" />
                                    <% End if %>
                                         NEW PART (TRIAL)
                                    </td>
                                    <td  >
                                    <% If RS("txt_type") = "MASS" Then %>
                                      <img src="./img/checkbox1.png" width="15" />
                                    <% Else %>
                                       <img src="./img/checkbox2.png" width="15" />
                                    <% End if %>
                                         MASS PRODUCTION
                                    </td>
                                    <td>
                                         <!--<img src="./img/checkbox2.png" width="15" /> PRODUCT AUDIT -->
                                    </td> 
                                </tr>
                            </table>
                            <table width="100%">
                                <tr class="table-success text-center">
                                    <td>REMARK :</td>
                                    <td></td>
                                    <td>สารต้องห้าม</td>
                                    <td>SHIPMENT DATE / INVOICE NO. / WO#LOT / MI. ISSUE</td>
                                </tr>
                                <tr>
                                    <td colspan="2" rowspan="5">SAMPLE NEW PART; PPAP3</td>
                                </tr>
                                <tr>
                                    <td class="table-success text-center">RoHS Directive</td>
                                    <td><%=RS("txt_shipment_date")%></td>
                                </tr>
                                <tr>
                                    <td class="table-success text-center">REF. QA-SD-01</td>
                                    <td><%=RS("txt_invoice_no")%></td>
                                </tr>
                                <tr>
                                    <td class="table-success text-center">.</td>
                                    <td><%=RS("txt_wo_lot")%></td>
                                </tr>
                                <tr>
                                    <td class="table-success text-center">
                                        Result/Expire date
                                    </td>
                                    <td><%=RS("txt_mi_issue")%></td>
                                </tr>

                                <tr class="table-success">
                                    <td>DOCUMENT CHECK</td>
                                    <td>SPECIFICATION</td>
                                    <td colspan="2" class="text-center">ACTUAL</td>
                                </tr>

                                <!-- #################### -->
                                <% If RS("txt_type") = "MASS" Then  %>
                                     
                                <tr>
                                    <td colspan="2">1. COPPER THK.(IN HOLE/ON SURFACE)</td>
                                    <td class="text-center">N/A</td>
                                    <td class="text-center">N/A</td>
                                </tr>
                                <tr>
                                    <td colspan="2">2.S/M THK.(ON CKT./LAMINATE)</td>
                                    <td class="text-center">N/A</td>
                                    <td class="text-center">N/A</td>
                                </tr>
                                <tr>
                                    <td colspan="2">3.FINISHED SURFACE/THICKNESS</td>
                                    <td class="text-center">N/A</td>
                                    <td class="text-center">N/A</td>
                                </tr>
                                <tr>
                                    <td colspan="2">4.HOLE SIZE REFERENCE MI.</td>
                                    <td class="text-center">N/A</td>
                                    <td class="text-center">N/A</td>
                                </tr>
                                <tr>
                                    <td colspan="2">5.LINE WIDTH & SPACING REFERENCE MI.</td>
                                    <td class="text-center">N/A</td>
                                    <td class="text-center">N/A</td>
                                </tr>
                                <tr>
                                    <td colspan="2">6.DIMENSION PROFILE REFERENCE DRAWING</td>
                                    <td class="text-center">N/A</td>
                                    <td class="text-center">N/A</td>
                                </tr>
                                <tr>
                                    <td colspan="2">7.SODERABILITY TESTED</td>
                                    <td class="text-center">N/A</td>
                                    <td class="text-center">N/A</td>
                                </tr>
                                <tr>
                                    <td colspan="2">8.IONIC CONTAMINATION <font class="text-info"><%=rs("Ionic")%></font></td>
                                    <td class="text-center">N/A</td>
                                    <td class="text-center">N/A</td>
                                </tr>
                                <tr>
                                    <td colspan="2">9.OTHERS <font class="text-info">N/A</font></td>
                                    <td class="text-center">N/A</td>
                                    <td class="text-center">N/A</td>
                                </tr>

                                     
                                <% Else %>
                                    
                                <tr>
                                    <td colspan="2">1. COPPER THK.(IN HOLE/ON SURFACE)</td>
                                    <td class="text-center">N/A</td>
                                    <td class="text-center"><% If RS("txt_copper_thk") ="1" Then  response.write("Acc") End if%></td>
                                </tr>
                                <tr>
                                    <td colspan="2">2.S/M THK.(ON CKT./LAMINATE)</td>
                                    <td class="text-center">N/A</td>
                                    <td class="text-center"><% If RS("txt_sm_thk")="1" Then  response.write("Acc") End if%></td>
                                </tr>
                                <tr>
                                    <td colspan="2">3.FINISHED SURFACE/THICKNESS</td>
                                    <td class="text-center">N/A</td>
                                    <td class="text-center"><% If RS("txt_finish_surface")="1" Then  response.write("Acc") End if%></td>
                                </tr>
                                <tr>
                                    <td colspan="2">4.HOLE SIZE REFERENCE MI.</td>
                                    <td class="text-center">N/A</td>
                                    <td class="text-center"><% If RS("txt_hole_size")="1" Then  response.write("Acc") End if%></td>
                                </tr>
                                <tr>
                                    <td colspan="2">5.LINE WIDTH & SPACING REFERENCE MI.</td>
                                    <td class="text-center">N/A</td>
                                    <td class="text-center"><% If RS("txt_line_width")="1" Then  response.write("Acc") End if%></td>
                                </tr>
                                <tr>
                                    <td colspan="2">6.DIMENSION PROFILE REFERENCE DRAWING</td>
                                    <td class="text-center">N/A</td>
                                    <td class="text-center"><% If RS("txt_dimension_frofile")="1" Then  response.write("Acc") End if%></td>
                                </tr>
                                <tr>
                                    <td colspan="2">7.SODERABILITY TESTED</td>
                                    <td class="text-center">N/A</td>
                                    <td class="text-center"><% If RS("txt_soderability")="1" Then  response.write("Acc") End if%></td>
                                </tr>
                                <tr>
                                    <td colspan="2">8.IONIC CONTAMINATION <font class="text-info"><%=rs("Ionic")%></font></td>
                                    <td class="text-center">N/A</td>
                                    <td class="text-center"><% If RS("txt_ionic")="1" Then  response.write("Acc") End if%></td>
                                </tr>
                                <tr>
                                    <td colspan="2">9.OTHERS <font class="text-info">N/A</font></td>
                                    <td class="text-center">N/A</td>
                                    <td class="text-center"><% If RS("txt_others")="1" Then  response.write("Acc") End if%></td>
                                </tr> 
 
                               <% End if %>
                                
                                  
                                 
                               <!-- #################### -->

                                <tr class="table-success text-center">
                                    <td colspan="2">CUSTOMER REQUIREMENT CHECK</td> 
                                    <td>ACTUAL</td>
                                    <td>SHIPMENT DATE / INVOICE NO. / WO#LOT / MI. ISSUE</td>
                                </tr> 
                                <tr >
                                    <td>INSPECTION</td> 
                                    <td>Q'TY SHIP/SAMPLING Q'TY.(PNL)</td>
                                    <td class="text-center">N/A</td>
                                    <td class="text-center"><%=RS("txt_QTYSHIP")%></td>
                                </tr>
                                <tr>
                                    <td rowspan="3">1.SOLDER MASK</td> 
                                    <td>SIDE:
                                        <input type="checkbox" <% If rs("SM_CS")="X" Then  response.write("checked") End if%> disabled /> C/S
                                        <input type="checkbox" <% If rs("SM_SS")="X" Then  response.write("checked") End if%> disabled /> S/S
                                        <input type="checkbox" <% If rs("SM_NA")="X" Then  response.write("checked") End if%> disabled /> N/A
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td class="text-center">
                                        <div class="text-center"><% if rs("rbt_SMSide") ="1" Then   response.Write("OK") End if %></div>
                                    </td>
                                </tr>

                                <tr> 
                                    <td>COLOR:<font class="text-info"><%=RS("SM_Color")%></font>
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                    <div class="text-center"> <% if rs("rbt_SMColor") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>BRAND/SERIES: <font class="text-info"><%=RS("SM_Brand")%></font>
                                    </td>
                                    <td class="text-center">N.D.</td>
                                    <td>
                                    <div class="text-center"><% if rs("rbt_SMBrand") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                </tr>
                                    <tr>
                                    <td rowspan="3">2.LEGEND</td> 
                                    <td>SIDE:
                                    <input type="checkbox" <% If rs("LP_CS")="X" Then  response.write("checked") End if%> disabled /> C/S
                                    <input type="checkbox" <% If rs("LP_SS")="X" Then  response.write("checked") End if%> disabled /> S/S
                                    <input type="checkbox" <% If rs("LP_NA")="X" Then  response.write("checked") End if%> disabled /> N/A
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                    <div class="text-center"><% if rs("rbt_LPSide") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>COLOR: <font class="text-info"><%=RS("LP_Color")%></font>
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                    <div class="text-center"> <% if rs("rbt_LPColor") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>BRAND/SERIES: <font class="text-info"> <%=RS("LP_Brand")%></font>
                                    </td>
                                    <td class="text-center">N.D.</td>
                                    <td>
                                    <div class="text-center"> <% if rs("rbt_LPBrand") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>
                                    <tr>
                                    <td rowspan="2">3.CARBON PRINTING</td> 
                                    <td>SIDE:
                                    <input type="checkbox" <% If rs("CBI_CS")="X" Then  response.write("checked") End if%> disabled /> C/S
                                    <input type="checkbox" <% If rs("CBI_SS")="X" Then  response.write("checked") End if%> disabled /> S/S
                                    <input type="checkbox" <% If rs("CBI_NA")="X" Then  response.write("checked") End if%> disabled /> N/A
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                    <div class="text-center"> <% if rs("rbt_CBISide") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>COLOR: <font class="text-info"> </font>
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                    <div class="text-center"> <% if rs("rbt_CBIColor") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>
                                    <tr>
                                    <td scope="row" rowspan="4">4.PELABLE MASK</td> 
                                    <td>SIDE:
                                    <input type="checkbox" <% If rs("PB_CS")="X" Then  response.write("checked") End if%> disabled /> C/S
                                    <input type="checkbox" <% If rs("PB_SS")="X" Then  response.write("checked") End if%> disabled /> S/S
                                    <input type="checkbox" <% If rs("PB_NA")="X" Then  response.write("checked") End if%> disabled /> N/A
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                    <div class="text-center"> <% if rs("rbt_PBSide") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>COLOR:<font class="text-info"><%=RS("PB_Color")%></font>
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                    <div class="text-center"> <% if rs("rbt_PBColor") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>
                                    <tr> 
                                    <td>BRAND/SERIES: <font class="text-info"><%=RS("PB_Brand")%></font>
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                    <div class="text-center"> <% if rs("rbt_PBBrand") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    <tr>
                                    <td>POSITION PER ART WORK</td>
                                    <td class="text-center">N/A</td>
                                    <td></td>
                                    </tr>
                                    </tr>
                                    <tr>
                                    <td rowspan="9">5.MARKING</td>
                                    </tr>
                                    <tr> 
                                    <td>SIDE:
                                    <input type="checkbox" <% If rs("UL_CS")="X" Then  response.write("checked") End if%> disabled /> C/S
                                    <input type="checkbox" <% If rs("UL_SS")="X" Then  response.write("checked") End if%> disabled /> S/S
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                    <div class="text-center"> <% if rs("rbt_ULSide") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>UL LOGO: <font class="text-info">
                                    <%=RS("UL_Logo")%></font> /ON <font class="text-info"><%=RS("UL_PrintOn")%></font>
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                    <div class="text-center"> <% if rs("rbt_ULLogo") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>SIDE:
                                    <input type="checkbox" <% If rs("DC_CS")="X" Then  response.write("checked") End if%> disabled /> C/S
                                    <input type="checkbox" <% If rs("DC_SS")="X" Then  response.write("checked") End if%> disabled /> S/S
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                    <div class="text-center"><% if rs("rbt_DCSide") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>DATECODE: <font class="text-info"><%=RS("DC_DC")%></font> /ON <font class="text-info"> <%=RS("DC_PrintOn")%></font>
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td class="text-center"><%=rs("txt_DCMarking")%></td>
                                    </tr>
                                    <tr>

                                    <td>ET MARK:
                                    <input type="checkbox" <% If rs("ET_Edge")="X" Then  response.write("checked") End if%> disabled /> EDGE MARK
                                    <input type="checkbox" <% If rs("ET_Stamp")="X" Then  response.write("checked") End if%> disabled /> STAMP
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td class="text-center"><%=rs("txt_ETMark")%></td>
                                    </tr>
                                    <tr>

                                    <td>SIDE:
                                    <input type="checkbox" <% If rs("ET_CS")="X" Then  response.write("checked") End if%> disabled /> C/S
                                    <input type="checkbox" <% If rs("ET_SS")="X" Then  response.write("checked") End if%> disabled /> S/S
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                    <div class="text-center"> <% if rs("rbt_ETSide") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>CUST. P/N(ON BOARD): <font class="text-info">
                                    <%=RS("CustOnBoard")%></font>
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                    <div class="text-center"><% if rs("rbt_CustOnBoard") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>KCE P/N(ON BOARD): <font class="text-info">
                                    <%=RS("KCEOnBoard")%></font>
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                    <div class="text-center"><% if rs("rbt_KCEOnBoard") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>
                                    <tr>
                                    <td rowspan="2">6. SURFACE FINISH</td>    
                                    <td>SURFACE FINISH: <font class="text-info">
                                    <%=RS("Surface")%></font>
                                    </td>
                                    <td class="text-center">N.D.</td>
                                    <td>
                                    <div class="text-center"><% if rs("rbt_Surface") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>DATECODE CONTROL: <font class="text-info">
                                    <%=RS("DCControl")%></font> WEEK</td>
                                    <td class="text-center">N/A</td>
                                    <td class="text-center"><%=RS("txt_DCControl")%></td>
                                    </tr>

                                    <tr>
                                    <td rowspan="4">7. STEP/REPERT</td> 
                                    <td>
                                    <input type="checkbox" <% If rs("ST_Single")="X" Then  response.write("checked") End if%> disabled /> SINGLE
                                    <input type="checkbox" <% If rs("ST_Mulity")="X" Then  response.write("checked") End if%> disabled /> MULTIFORM
                                    <font class="text-info">
                                    <%=RS("ST_Pcs")%></font> PCS.
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                    <div class="text-center"><% if rs("rbt_Step") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>
                                    <input type="checkbox" <% If rs("XO_Scrap")="X" Then  response.write("checked") End if%> disabled /> SCRAP ALLOW
                                    <font class="text-info"><%=RS("XO_Qty")%>
                                    </font> PCS/MULTIFORM
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                    <div class="text-center"> <% if rs("rbt_XOScrap") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>
                                    <input type="checkbox" <% If rs("CBI_NA")="X" Then  response.write("checked") End if%> disabled /> SCRAP MARK
                                    <font class="text-info">  <%=RS("XO_MarkIDE")%></font>
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                    <div class="text-center"> <% if rs("rbt_XOSCMark") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>BOARD PROFILE <font class="text-info">
                                    <%=RS("BoardProfile")%></font>
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                    <div class="text-center"> <% if rs("rbt_BoardProfile") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>

                                   
                                    <tr class="table-success text-center">
                                    <td colspan="2">PACKAGE & PACKING CHECK</th>
                                    <th scope="col"></th>
                                    <th scope="col">ACTUAL</th>
                                    </tr> 
                                    <tr>
                                    <td rowspan="12">1.PACKING</td>
                                    </tr>
                                    <tr>
                                    <td>Q'TY PACKAGE /SAMPLING Q'TY PACKAGE</td>
                                    <td class="text-center">N/A</td>
                                    <td class="text-center"><%=rs("txt_QTYPACKAGE")%></td>
                                    </tr>
                                    <tr>

                                    <td>Q'TY /PACK <font class="text-info">
                                    <%=RS("PS_QtyPack")%></font> PNL</td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                        <div class="text-center"> <% if rs("rbt_PS_QtyPack") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>
                                        <input type="checkbox" <% If rs("PS_OneWayBoard")="X" Then  response.write("checked") End if%> disabled />
                                        เรียง Board ไปในทิศทางเดียวกัน
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                        <div class="text-center"> <% if rs("rbt_PS_OneWayBoard") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>
                                        <input type="checkbox" <% If rs("PS_VacuumPackPE")="X" Then  response.write("checked") End if%> disabled />
                                        Vacuum Pack ด้วย Air bubble & Placstic Wrap(PE)
                                    </td>
                                    <td class="text-center">N.D.</td>
                                    <td>
                                        <div class="text-center"> <% if rs("rbt_PS_VacuumPackPE") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>
                                        <input type="checkbox" <% If rs("PS_VacuumPackESD")="X" Then  response.write("checked") End if%> disabled />
                                        Vacuum Pack ด้วย Air bubble & Placstic Wrap(ESD)
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                        <div class="text-center"> <% if rs("rbt_PS_VacuumPackESD") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>
                                        <input type="checkbox" <% If rs("PS_VacuumNylon")="X" Then  response.write("checked") End if%> disabled />
                                        Vacuum Heat seal ด้วยถุง Nylon Plastic
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                        <div class="text-center"> <% if rs("rbt_PS_VacuumNylon") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>
                                        <input type="checkbox" <% If rs("PS_Aluminum")="X" Then  response.write("checked") End if%> disabled /> Vacuum
                                        Pack ด้วย Aluminum bag (MBB Packing)
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                        <div class="text-center"> <% if rs("rbt_PS_Aluminum") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>
                                        <input type="checkbox" <% If rs("PS_SulphurFree")="X" Then  response.write("checked") End if%> disabled />
                                        ใช้กระดาษ Sulphur free ปิดบนล่างไม่ให้สัมผัส Plastic
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                        <div class="text-center"> <% if rs("rbt_PS_SulphurFree") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>
                                        <input type="checkbox" <% If rs("PS_Siliga")="X" Then  response.write("checked") End if%> disabled /> SILICA GEL
                                        <font class="text-info">
                                    <%=RS("PS_RemarkSILICAGEL")%></font>
                                    </td>
                                    <td class="text-center">N.D.</td>
                                    <td>
                                        <div class="text-center"> <% if rs("rbt_PS_RemarkSILICAGEL") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>
                                        <input type="checkbox" <% If rs("PS_HIC")="X" Then  response.write("checked") End if%> disabled /> PS_HIC Humidity
                                        indicator card(HIC) <font class="text-info">
                                    <%=RS("PS_HIC10")%></font> %
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                        <div class="text-center"> <% if rs("rbt_PS_HIC") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>
                                        <input type="checkbox" <% If rs("PS_Others")="X" Then  response.write("checked") End if%> disabled /> Other <font
                                        class="text-info"> <%=RS("PS_OthersRemark")%></font> %
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                        <div class="text-center"> <% if rs("rbt_PS_Others") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>
                                    <tr>
                                    <td rowspan="6">2.PACKING LABELING</td>
                                    </tr>
                                    <tr>
                                    <td>
                                        <input type="checkbox" <% If rs("PL_KCELabel")="X" Then  response.write("checked") End if%> disabled /> KCE LABEL
                                        /KCE P/N <font class="text-info">
                                       <%=RS("KCEPART")%></font> REV. <font class="text-info"><%=RS("REV")%></font>
                                    </td>
                                    <td class="text-center">N.D.</td>
                                    <td>
                                        <div class="text-center"> <% if rs("rbt_PL_KCELabel") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>
                                    <tr> 
                                    <td>
                                        <input type="checkbox" <% If rs("CustPart")="X" Then  response.write("checked") End if%> disabled /> CUST P/N <font
                                        class="text-info">
                                    <%=RS("CustPart")%></font>
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                        <div class="text-center"> <% if rs("rbt_PL_CustPart") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>
                                        <input type="checkbox" <% If rs("PL_CustLabel")="X" Then  response.write("checked") End if%> disabled /> CUST LABEL
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                        <div class="text-center"> <% if rs("rbt_PL_CustLabel") ="1" then   response.write("OK") Else response.write(rs("rbt_PL_CustLabel")) end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>
                                        <input type="checkbox" <% If rs("PL_Rohs")="X" Then  response.write("checked") End if%> disabled /> RoHS Conpliance
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                        <div class="text-center"> <% if rs("rbt_PL_Rohs") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>SPECIAL MARK <font class="text-info">
                                    <%=RS("PL_SpecialLabelRemark")%></font>
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                        <div class="text-center"> <% if rs("rbt_PL_SpecialLabelRemark") ="1" then   response.write("OK") Else  response.Write(rs("rbt_PL_SpecialLabelRemark")) end if %></div>
                                    </td>
                                    </tr>
                                    <tr>
                                    <td rowspan="5">3.CARTON PACKING</td>
                                    </tr>
                                    <tr> 
                                    <td>Q'TY/BOX (REFER.PACKING LIST</td>
                                    <td class="text-center">N/A</td>
                                    <td class="text-center"><%=RS("txt_TQYCarton")%></td>
                                    </tr>
                                    <tr>

                                    <td>MATERIAL <font class="text-info">
                                    <%=RS("CT_Material")%></font>
                                    </td>
                                    <td class="text-center">N.D.</td>
                                    <td class="text-center"><%=RS("txt_CT_Material")%></td>
                                    </tr>
                                    <tr>

                                    <td>MAX WEIGHT <font class="text-info">
                                    <%=RS("CT_Weight")%></font> KG.(MAX)</td>
                                    <td class="text-center">N/A</td>
                                    <td class="text-center"><%=RS("txt_CT_Weight")%></td>
                                    </tr>
                                    <tr>
                                    <td>Q'TY BOX PER SHIPMENT : REF. PACKING LIST</td>
                                    <td class="text-center">N/A</td>
                                    <td class="text-center"><%=RS("txt_CT_QTY")%></td>
                                    </tr>

                                    <tr>
                                    <td rowspan="7">4.CARTON LABELING</td>
                                    </tr>
                                    <tr> 
                                    <td>
                                        <input type="checkbox"  <% If RS("CL_KCELabel")="X" Then  response.write("checked") End if%> disabled /> KCE LABEL
                                        /KCE P/N <font class="text-info">
                                    <%=RS("KCEPART")%></font> REV. <font class="text-info"><%=RS("REV")%></font>
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                        <div class="text-center"> <% if RS("rbt_CL_KCEPART") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>
                                        <input type="checkbox" <% If RS("CustPart")="X" Then  response.write("checked") End if%> disabled /> CUST P/N <font
                                        class="text-info">
                                    <%=RS("CustPart")%></font>
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                        <div class="text-center"> <% if RS("rbt_CL_CustPart") ="1" then   response.write("OK") Else  response.write(RS("rbt_CL_CustPart")) end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>
                                        <input type="checkbox" <% If rs("CL_CustLabel")="X" Then  response.write("checked") End if%> disabled /> CUST LABEL <font class="text-info">
                                    <%=RS("CL_CustLabel") %></font>
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                        <div class="text-center"> <% if rs("rbt_CL_CustLabel") ="1" then   response.write("OK") Else response.write(rs("rbt_CL_CustLabel")) end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>
                                        <input type="checkbox" <% If RS("CL_Rohs")="X" Then  response.write("checked") End if %> disabled /> RoHS Compliance <font class="text-info"><%=RS("CL_Rohs")%></font>
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                        <div class="text-center"> <% if rs("rbt_CL_Rohs") ="1" then   response.write("OK") end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>
                                        <input type="checkbox" CL_SpecialLabelRemark != "" && data.CL_SpecialLabelRemark == "X" && "checked"}
                                        disabled /> SPECIAL MARK <font class="text-info">
                                    <%=RS("CL_SpecialLabelRemark")%></font>
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                        <div class="text-center"> <% if rs("rbt_CL_SpecialLabelRemark") ="1" then   response.write("OK") Else  response.Write(rs("rbt_CL_SpecialLabelRemark")) end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>SAMPLING BOX NO.</td>
                                    <td class="text-center">N/A</td>
                                    <td class="text-center"><%=rs("txt_CL_SAMPLING")%></td>
                                    </tr>
                                     

                                    <tr>
                                    <td rowspan="12">1.DOCUMENT SUBMISSION</td>
                                    </tr>
                                    <tr>
                                    <td>
                                        <input type="checkbox" <% If rs("CBI_NA")="X" Then  response.write("checked") End if%> disabled /> C OF C
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                        <div class="text-center"> <% if rs("rbt_QA_CofC") ="1" then   response.write("OK") Else response.write(rs("rbt_QA_CofC")) end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>
                                        <input type="checkbox" <% If rs("QA_INS_FA")="X" Then  response.write("checked") End if%> disabled /> INSPECTION /
                                        FA. REPORT
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                        <div class="text-center"> <% if rs("rbt_QA_INS_FA") ="1" then   response.write("OK") Else response.write(rs("rbt_QA_INS_FA")) end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>
                                        <input type="checkbox" <% If rs("QA_SolderTest")="X" Then  response.write("checked") End if%> disabled />
                                        SOLDERABILITY TEST REPORT
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                        <div class="text-center"> <% if rs("rbt_QA_SolderTest") ="1" then response.write("OK") Else response.write(rs("rbt_QA_SolderTest")) end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>
                                        <input type="checkbox" <% If rs("QA_PHOTO")="X" Then  response.write("checked") End if%> disabled /> PHOTO REPORT
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                        <div class="text-center"> <% if rs("rbt_QA_PHOTO") ="1" then response.write("OK") Else response.write(rs("rbt_QA_PHOTO")) end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>
                                        <input type="checkbox" <% If rs("QA_SPC")="X" Then  response.write("checked") End if%> disabled /> SPC REPORT
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                        <div class="text-center"> <% if rs("rbt_QA_SPC") ="1" then   response.write("OK") Else response.write(rs("rbt_QA_SPC")) end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>
                                        <input type="checkbox" <% If rs("QA_MICRO")="X" Then  response.write("checked") End if%> disabled /> MICRO SECTION
                                        <font class="text-info">
                                    <%=RS("QA_Pcs")%></font> PCS.
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                        <div class="text-center"> <% if rs("rbt_QA_MICRO") ="1" then   response.write("OK") Else response.write(rs("rbt_QA_MICRO")) end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>
                                        <input type="checkbox" <% If rs("QA_SampleBoardTest")="X" Then  response.write("checked") End if%> disabled/> SAMPLE BOARD TEST <font class="text-info">
                                    <%=RS("QA_Test")%></font> PCS.
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                        <div class="text-center"> <% if rs("rbt_QA_SampleBoardTest") ="1" then   response.write("OK") Else response.write(rs("rbt_QA_SampleBoardTest")) end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>
                                        <input type="checkbox" <% If rs("QA_SampleBoardNotTest")="X" Then  response.write("checked") End if%>
                                        disabled /> SAMPLE BOARD NO TEST <font class="text-info">
                                    <%=RS("QA_NotTest")%></font> PCS.
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                        <div class="text-center"> <% if rs("rbt_QA_SampleBoardNotTest") ="1" then   response.write("OK") Else response.write(rs("rbt_QA_SampleBoardNotTest")) end if %></div>
                                    </td>
                                    </tr>
                                    <tr> 
                                    <td>
                                        <input type="checkbox"  <% If rs("QA_PPAP")="X" Then  response.write("checked") End if%> disabled /> PPAP LEVEL <font
                                        class="text-info">
                                    <%=RS("QA_Level")%></font> PCS.
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                        <div class="text-center"> <% if rs("rbt_QA_PPAP") ="1" then   response.write("OK") Else response.write(rs("rbt_QA_PPAP")) end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>
                                        <input type="checkbox" <% If rs("QA_Other")="X" Then  response.write("checked") End if%> disabled /> OTHER <font
                                        class="text-info">
                                    <%=RS("QA_OtherRequirement")%></font>
                                    </td>
                                    <td class="text-center">N/A</td>
                                    <td>
                                        <div class="text-center"> <% if rs("rbt_QA_Other") ="1" then   response.write("OK") Else response.write(rs("rbt_QA_Other")) end if %></div>
                                    </td>
                                    </tr>
                                    <tr>

                                    <td>DATECODE / Q'TY SHIPMENT</td>
                                    <td></td>
                                    <td class="text-center"><%=RS("txt_DCSHIP")%></td>
                                    </tr>
                                    <tr>
                                    <td colspan="4">REMARK</td>  
                                    </tr>
                                    <tr> 
                                    <td colspan="2" class='text-right'>Approved</td> 
                                    <td colspan="2">CHANACHAI.D</td> 
                                    </tr>
                                    <tr class="table-success">
                                        <td colspan="2" class="text-right">INSPECTOR</td>
                                        <% sql = "SELECT [EI_EmployeeID] +' '+ [EI_Title] +''+[EI_FirstName] +' '+[EI_LastName] as name" &_
                                                 " FROM [MainOnline].[dbo].[MA_EffectiveUser] Where Username ='" & rs("update_foi") &"' " 
                                               rs0 = db96.execute(sql)%>
                                        <td colspan="2"><%=rs0("name")%></td>
                                    </tr> 
                                    <tr >
                                        <td colspan="4">
                                        <strong style="text-align:left;">
                                            FM : QA-FOI-01
                                            <span style="float:right;">
                                                REV. 15
                                            </span>
                                        </strong>
                                        </td>  
                                    </tr> 
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

    <script src="./js/jquery.min.js"></script>
    <script src="./js/bootstrap.bundle.min.js"></script>
    <script src="./js/Inspection.js"></script>
    <script src="./manages/script.js"></script>
</body>

</html>