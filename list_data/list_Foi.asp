<%@Language="VBScript"%>
<%Response.Buffer = False%>
<% username=Request.Cookies("LOGON_USER") 'esponse.write (username)
If username ="" Then
    Response.Write("<script>") 
    Response.Write("window.location.href = ' http://192.168.35.5/login.asp?href=http://192.168.35.5/FOI/default.asp'; ")
    Response.Write(" </script>")
  End If

  'response.write(Year(NOW()) &"-"& Month(NOW()) &"-"& day(NOW()) &" "& Time)

  %>
  <!--#include file = "../backend/connection/db.asp"-->
  <style>
  .verticaltext{
    transform: rotate(90deg);
    transform-origin: left top 0;
        }
  </style>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>รายการเช็คค่า FOI</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="manifest" href="../manifest.json">  
    <link rel="stylesheet" href="../css/dataTables.bootstrap4.min.css" />
    <link rel="stylesheet" href="../css/tempusdominus-bootstrap-4.min.css" />    
</head>
<body >
      <!--#include file="../memu/menu.asp"--> 
<div class="container-fluid">
 <div class="row">
    <div class="col-md-12">
    <H5 class="text-center">FINAL OUTGOING INSPECTION CHECK REPORT</H5>
      <hr>
       <div class="container">
           <form>
            <div class="row g-3 align-items-center justify-content-center">
                <div class="col-auto">
                  <label  class="col-form-label">Start Date : </label>
                </div>
                <div class="col-auto">
                  <input type="text" class="form-control datetimepicker-input" id="datetimepicker1" name="Date_Form" data-toggle="datetimepicker" data-target="#datetimepicker1" placeholder ="วันที่เริ่ม" autocomplete="off"/>
                </div>
                <div class="col-auto">
                  <label  class="col-form-label">To : </label>
                </div>
                <div class="col-auto">
                  <input type="text" class="form-control datetimepicker-input" id="datetimepicker2"  name="Date_To" data-toggle="datetimepicker" data-target="#datetimepicker2" placeholder ="วันที่สิ้นสุด" autocomplete="off"/>
                </div>
                <div class="col-auto"> 
                   <button type="submit" class="btn btn-primary">ค้นหา</button>
                </div>
              
            </div>
        </form>
      </div>
           
    
    <hr>
    </div>
   <div class="col-md-12 table-responsive">
 
                 <% 
                    Date_Form = request.querystring("Date_Form") 
                    Date_To = request.querystring("Date_To") 
                  IF Date_Form <>""  Then %>
                     <strong>  เวลาเริ่ม : <%=Date_Form%> ถึง : <%=Date_To%></strong><hr>
                   <%   End if%>
       

    <table class="table table-bordered table-sm text-nowrap align-middle table-hover" style="font-size:12px;" id="example"> 
        <thead class="thead-light">
            <tr class="text-center">
            <th colspan="12">-</th>
            <th colspan="9">-</th>
            <th colspan="26">CUSTOMER REQUIREMENT CHECK</th>
            <th colspan="26">PACKAGE & PACKING CHECK</th> 
            <th colspan="13">-</th>
        </tr>
        <tr class="text-center">
            <th colspan="12"></th>
            <th colspan="9">DOCUMENT CHECK</th>
            <th colspan="1">INSPECTION</th>
            <th colspan="3">SOLDER MASK</th>
            <th colspan="3">LEGEND</th>
            <th colspan="2">CARBON PRINTING</th>
            <th colspan="3">PELABLE MASK</th>
            <th colspan="8">MARKING</th>
            <th colspan="2">SURFACE FINISH</th>
            <th colspan="4">STEP/REPERT</th>
            <th colspan="11">PACKING</th>
            <th colspan="5">PACKING LABELING</th>
            <th colspan="4">CARTON PACKING</th>
            <th colspan="6">CARTON LABELING</th>
            <th colspan="11">DOCUMENT SUBMISSION</th>
            <th colspan="2">การบันทึกข้อมูล</th>
        </tr>
        <tr class="text-center">
            <th>#</th><th>PREVIEW</th>
            <th>TYPE</th>
            <th>CARTON NUM</th>
            <th>CUSTNAME</th> 
            <th>CUSTCODE</th>
            <th>KCEPRAT</th>
            <th>PlANT</th>
            <th>SHIPMENT DATE</th>
            <th>INVOICE NO.</th>
            <th>WO#LOT</th>
            <th>MI. ISSUE</th>
            <th>COPPER THK. (IN HOLE/SURFACE)</th>
            <th>S/M THK.(ON CKT./LAMINATE)</th>
            <th>FINISHED SURFACE/THICKNESS</th>
            <th>HOLE SIZE REFERENCE MI.</th>
            <th>LINE WIDTH & SPACING REFERENCE MI.</th>
            <th>DIMENSION PROFILE REFERENCE DRAWING</th>
            <th>SODERABILITY TESTED</th>  
            <th>IONIC CONTAMINATION</th>
            <th>OTHERS</th>
            <th>Q'TY SHIP/SAMPLING Q'TY.(PNL)</th>
            <th>SIDE</th>
            <th>COLOR</th>
            <th>BRAND/SERIES</th>
            <th>SIDE</th>
            <th>COLOR</th>
            <th>BRAND/SERIES</th>
            <th>CARBON PRINTING/SIDE</th>
            <th>COLOR</th>
            <th>SIDE</th>
            <th>COLOR</th>
            <th>BRAND/SERIES</th>
            <th>SIDE</th>
            <th>UL LOGO: /ON</th>
            <th>SIDE</th>
            <th>DATECODE</th>
            <th>ET MARK</th>
            <th>SIDE</th>
            <th>CUST. P/N(ON BOARD)</th>
            <th>KCE P/N(ON BOARD)</th>
            <th>SURFACE FINISH/SURFACE FINISH</th>
            <th>DATECODE CONTROL</th>
            <th>STEP/REPERT/SINGLE</th>
            <th>SCRAP ALLOW PCS/MULTIFORM</th>
            <th>SCRAP MARK</th>
            <th>BOARD PROFILE</th>
            <th>Q'TY PACKAGE</th>
            <th>Q'TY /PACK 10 PNL</th>
            <th>เรียง Board ไปในทิศทางเดียวกัน</th>
            <th>Vacuum Pack ด้วย Air bubble & Placstic Wrap(PE)</th>
            <th>Vacuum Pack ด้วย Air bubble & Placstic Wrap(ESD)	</th>
            <th>Vacuum Heat seal ด้วยถุง Nylon Plastic</th>
            <th>Vacuum Pack ด้วย Aluminum bag (MBB Packing)</th>
            <th>ใช้กระดาษ Sulphur free ปิดบนล่างไม่ให้สัมผัส Plastic</th>
            <th>SILICA GEL</th>
            <th>PS_HIC Humidity indicator card(HIC)</th> 
            <th>Other %</th>
            <th>KCE LABEL /KCE P/N</th> 
            <th>CUST P/N</th> 
            <th>CUST LABEL</th>
            <th>RoHS Conpliance</th>
            <th>SPECIAL MARK</th>
            <th>Q'TY/BOX (REFER.PACKING LIST</th>
            <th>MATERIAL</th>
            <th>MAX WEIGHT</th>
            <th>Q'TY BOX PER SHIPMENT</th>
            <th>KCE LABEL /KCE P/N</th> 
            <th>CUST P/N</th>
            <th>CUST LABEL</th>
            <th>RoHS Compliance</th>
            <th>SPECIAL MARK</th>
            <th>SAMPLING BOX NO</th>
            <th>C OF C</th>
            <th>INSPECTION / FA. REPORT</th>
            <th>SOLDERABILITY TEST REPORT</th>
            <th>PHOTO REPORT</th>
            <th>SPC REPORT</th>
            <th>MICRO SECTION</th>
            <th>SAMPLE BOARD TEST</th>
            <th>SAMPLE BOARD NO TEST</th>
            <th>PPAP LEVEL PCS</th>
            <th>OTHER</th>
            <th>DATECODE / Q'TY SHIPMENT</th>
            <th>เวลาบันทึก</th>
            <th>ผู้บันทึก</th>
        </tr>
        </thead>
        <tbody>
    
        <% 
        
        sql = "SELECT * FROM [Base_Process].[dbo].[FOI_FinalOuting] Where  CONVERT(datetime,update_date,103)  between '"&Date_Form&" 00:00:00' AND '"&Date_To&" 23:59:59' order by FO_ID DESC"  
        set rs = db.execute(sql)
        i = 1 
        while not rs.eof 
   
        %>
        <tr class="text-center">
                <td><%=i%></td> 
                <td><a target="_blank" href="http://192.168.35.5/FOI/preview_foi.asp?FO_ID=<%=rs("FO_ID")%>&CUSTCODE=<%=rs("txt_custcode")%>&KCEPART=<%=rs("txt_kcepart")%>">คลิก</a></td> 
                <td><%=rs("txt_type")%> </td>
                <td><%=rs("txt_CartonNum")%></td>
                <td><%=rs("txt_CustName")%></td>
                <td><%=rs("txt_custcode")%></td>
                <td><%=rs("txt_kcepart")%></td>
                <td><%=rs("plant")%></td>
                <td><%=rs("txt_Shipment_date")%></td>
                <td><%=rs("txt_invoice_no")%></td>
                <td><%=rs("txt_wo_lot")%></td>
                <td><%=rs("txt_mi_issue")%></td>
                <td><% if rs("txt_copper_thk")="1" Then   response.Write("ACC") Else  response.Write("N/A") End if %></td>
                <td><% if rs("txt_sm_thk")="1" Then   response.Write("ACC") Else  response.Write("N/A") End if %></td>
                <td><% if rs("txt_finish_surface")="1" Then   response.Write("ACC") Else  response.Write("N/A") End if %></td>
                <td><% if rs("txt_hole_size")="1" Then   response.Write("ACC") Else  response.Write("N/A") End if %></td>
                <td><% if rs("txt_line_width")="1" Then   response.Write("ACC") Else  response.Write("N/A") End if %></td>
                <td><% if rs("txt_dimension_frofile")="1" Then   response.Write("ACC") Else  response.Write("N/A") End if %></td>
                <td><% if rs("txt_soderability")="1" Then   response.Write("ACC") Else  response.Write("N/A") End if %></td>
                <td><% if rs("txt_ionic") ="1" Then   response.Write("ACC") Else  response.Write("N/A") End if %></td>
                <td><% if rs("txt_others") ="1" Then   response.Write("ACC") Else  response.Write("N/A") End if %></td>
                <td><%=rs("txt_QTYSHIP")%></td>
                <td><% if rs("rbt_SMSide") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_SMColor") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_SMBrand") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_LPSide") ="1" Then   response.Write("OK") Else  response.Write("-") End if %></td>
                <td><% if rs("rbt_LPColor") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_LPBrand") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_CBISide") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_CBIColor") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_PBSide") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_PBColor") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_PBBrand") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_ULSide") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_ULLogo") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_DCSide") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td> 
                <td><%=rs("txt_DCMarking")%></td>
                <td><%=rs("txt_ETMark")%></td>
                <td><% if rs("rbt_ETSide") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_CustOnBoard") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_KCEOnBoard") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_Surface") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td> 
                <td><%=rs("txt_DCControl")%></td>
                <td><% if rs("rbt_Step") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_XOScrap") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_XOSCMark") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_BoardProfile") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td> 
                <td><%=rs("txt_QTYPACKAGE")%></td>
                <td><% if rs("rbt_PS_QtyPack") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_PS_OneWayBoard") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_PS_VacuumPackPE") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_PS_VacuumPackESD") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_PS_VacuumNylon") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_PS_Aluminum") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_PS_SulphurFree") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_PS_SulphurFree") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_PS_HIC") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_PS_Others") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_PL_KCELabel") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_PL_CustPart") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_PL_CustPart") ="1" Then   response.Write("OK") Else  response.Write(rs("rbt_PL_CustLabel")) End if %></td>
                <td><% if rs("rbt_PL_Rohs") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_PL_SpecialLabelRemark") ="1" Then   response.Write("OK") Else  response.Write(rs("rbt_PL_SpecialLabelRemark")) End if %></td>
                <td><%=rs("txt_TQYCarton")%></td>
                <td><%=rs("txt_CT_Material")%></td>
                <td><%=rs("txt_CT_Weight")%></td>
                <td><%=rs("txt_CT_QTY")%></td>
                <td><% if rs("rbt_CL_KCEPART") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_CL_CustPart") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_CL_CustLabel") ="1" Then   response.Write("OK") Else  response.Write(rs("rbt_CL_CustLabel")) End if %></td>
                
                <td><% if rs("rbt_CL_Rohs") ="1" Then   response.Write("OK") Else  response.Write("") End if %></td>
                <td><% if rs("rbt_CL_SpecialLabelRemark") ="1" Then   response.Write("OK") Else  response.Write(rs("rbt_CL_SpecialLabelRemark")) End if %></td> 
                <td><%=rs("txt_CL_SAMPLING")%></td>
                <td><% if rs("rbt_QA_CofC") ="1" Then   response.Write("OK") Else  response.Write(rs("rbt_QA_CofC")) End if %></td>
                <td><% if rs("rbt_QA_INS_FA") ="1" Then   response.Write("OK") Else  response.Write(rs("rbt_QA_INS_FA")) End if %></td>
                <td><% if rs("rbt_QA_SolderTest") ="1" Then   response.Write("OK") Else  response.Write(rs("rbt_QA_SolderTest")) End if %></td>
                <td><% if rs("rbt_QA_PHOTO") ="1" Then   response.Write("OK") Else  response.Write(rs("rbt_QA_PHOTO")) End if %></td>
                <td><% if rs("rbt_QA_SPC") ="1" Then   response.Write("OK") Else  response.Write(rs("rbt_QA_SPC")) End if %></td>
                <td><% if rs("rbt_QA_MICRO") ="1" Then   response.Write("OK") Else  response.Write(rs("rbt_QA_MICRO")) End if %></td>
                <td><% if rs("rbt_QA_SampleBoardTest") ="1" Then   response.Write("OK") Else  response.Write(rs("rbt_QA_SampleBoardTest")) End if %></td>
                <td><% if rs("rbt_QA_SampleBoardNotTest") ="1" Then   response.Write("OK") Else  response.Write(rs("rbt_QA_SampleBoardNotTest")) End if %></td>
                <td><% if rs("rbt_QA_PPAP") ="1" Then   response.Write("OK") Else  response.Write(rs("rbt_QA_PPAP")) End if %></td>
                <td><% if rs("rbt_QA_Other") ="1" Then   response.Write("OK") Else  response.Write(rs("rbt_QA_Other")) End if %></td>
                <td><%=rs("txt_DCSHIP")%></td>
                <td><%=rs("update_date")%></td>
                <td><%=rs("UpdateBy")%></td> 
        </tr>
    <%
    i = i + 1
    rs.movenext
        Wend 
        %>
            
        </tbody>

        </table>
   </div>
 </div>
</div>
    

    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.bundle.min.js"></script>
      <script src="../js/moment.min.js"></script>
    <script src="../js/tempusdominus-bootstrap-4.min.js"></script>  
    <script src="../js/Inspection.js"></script>
    <script src="../manages/script.js"></script> 
    <script src="../js/jquery.dataTables.min.js"></script>
    <script src="../js/dataTables.bootstrap4.min.js"></script>
    
    <script>
      $(document).ready(function() {
        $('#example').DataTable();
      });
     
      
         $(function () {
        $('#datetimepicker1').datetimepicker({ 
            viewMode: 'years',
            format: 'YYYY-MM-DD'
            });
        $('#datetimepicker2').datetimepicker({
            useCurrent: false,
            viewMode: 'years',
            format: 'YYYY-MM-DD'
        });
        $("#datetimepicker1").on("change.datetimepicker", function (e) {
            $('#datetimepicker2').datetimepicker('minDate', e.date);
        });
        $("#datetimepicker2").on("change.datetimepicker", function (e) {
            $('#datetimepicker1').datetimepicker('maxDate', e.date);
        });
    });
    </script>
</body>
</html>