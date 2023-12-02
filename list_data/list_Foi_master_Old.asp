<% username=Request.Cookies("LOGON_USER") 'esponse.write (username)
If username ="" Then
    Response.Write("<script>") 
    Response.Write("window.location.href = ' http://192.168.35.5/login.asp?href=http://192.168.35.5/FOI/default.asp'; ")
    Response.Write(" </script>")
  End If

  'response.write(Year(NOW()) &"-"& Month(NOW()) &"-"& day(NOW()) &" "& Time)

  %>
  <!--#include file = "../backend/connection/db.asp"-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FOI Master Report</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="manifest" href="../manifest.json">  
    <link rel="stylesheet" href="../css/dataTables.bootstrap4.min.css" /> 
</head>
<body>
      <!--#include file="../memu/menu.asp"-->

      <div class="container-fluid">
 <div class="row">
    <div class="col-md-12"><H5 class="text-center">FOI MASTER REPORT</H5><hr></div>
   <div class="col-md-12">
   <div class="table-responsive">
    <table class="table table table-bordered table-sm text-nowrap align-middle table-hover" style="font-size: 12px;" id="example"  style="width:100%"> 
        <thead class="thead-light"> 
        <tr class="bg-primary text-center">
            <th colspan="9"></th>
            <th colspan="3">Laminate + Coper foil</th>
            <th colspan="3">FINISHED BOARD THK</th>
            <th colspan="5">S/M</th>
            <th colspan="5">LEGEND</th>
            <th colspan="4">CARBON INK</th>
            <th colspan="5">PELABLL</th>
            <th colspan="4">UL LOGO</th>
            <th colspan="4">DATE CODE</th>
            <th colspan="4">ET</th>
            <th colspan="2">KCE P/N/ CUSTOMER P/N บนบอร์ด</th>
            <th colspan="1">D/C</th>
            <th colspan="3">STEP</th>
            <th colspan="4">X-OUT</th>
            <th colspan="2">IONIC CONTAMINATION</th>
            <th colspan="17">วิธีการแพ็ค (Packing Spec)</th>
            <th colspan="7">ลาเบลหน้าห่อ</th>
            <th colspan="1">REMARK จำนวนต่อห่อ</th>
            <th colspan="2">กล่อง</th>
            <th colspan="7">ลาเบลหน้ากล่อง</th>
            <th colspan="15">QA-CUS-01</th>
            <th colspan="1">SPECIAL NOTE</th>
            <th colspan="3">COCUMENT CHECK</th>
            <th colspan="1">ตรงช่อง DATE CODE</th>
            <th colspan="1">PREPREG</th>
            <th colspan="1">LAMINATE</th>
            <th colspan="6">REMARK DOCUMENT SUBMISSION</th> 
            <th colspan="4">การบันทึกข้อมูล</th>
        </tr>
        <tr class="text-center">
              <th>#</th>
              <th>KCE P/N</th>
              <th>REV.</th>
              <th>CustCode</th>
              <th>CUSTOMER PART</th> 
              <th>SURFACE FINISH</th> 
              <th>BOARD PROFILE</th> 
              <th>LAYER COPPER (Oz.)</th> 
              <th>CORE</th>
              <th>BRAND</th>
              <th>TG</th>
              <th>CU FOIL</th>
              <th>SPEC.</th>
              <th>MIN - MAX</th>
              <th>Unit</th>
              <th>C/S</th>
              <th>S/S</th>
              <th>N/A</th>
              <th>COLOR</th>
              <th>BRAND</th>
              <th>C/S</th>
              <th>S/S</th>
              <th>N/A</th>
              <th>COLOR</th>
              <th>BRAND</th>
              <th>C/S</th>
              <th>S/S</th>
              <th>N/A</th>
              <th>BRAND</th>
              <th>C/S</th>
              <th>S/S</th>
              <th>N/A</th>
              <th>COLOR</th>
              <th>BRAND</th> 
              <th>C/S (X)</th> 
              <th>S/S (X)</th> 
              <th>Print ON</th>
              <th>UL Logo</th> 
              <th>C/S (X)</th> 
              <th>S/S (X)</th> 
              <th>DATE CODE</th>
              <th>Print on</th>
              <th>Edge</th>
              <th>Stamp</th>
              <th>C/S</th>
              <th>S/S</th>
              <th>CUST. (ON BOARD)</th>
              <th>KCE P/N (ON BORD)</th>
              <th>D/C Control (Week)</th>
              <th>Single</th>
              <th>Mulity</th>
              <th>PCS</th>
              <th>SCRAP</th>
              <th>Q'TY</th>
              <th>SC MARK</th>
              <th>MARK IDE</th>
              <th>IONIC</th>
              <th>ugNacl/Sq.</th>
              <th>Q'ty pack</th>
              <th>เรียงบอร์ดทางเดียว</th>
              <th>Vacuum Pack (PE)</th>
              <th>กรณี Double Pack</th>
              <th>Vacuum Pack (ESD)</th>
              <th>กรณี Double Pack</th>
              <th>Vacuum Nylon</th>
              <th>กรณี Double Pack</th>
              <th>Aluminum (MBB)</th>
              <th>กรณี Double Pack</th>
              <th>ห่อ Sulphur free</th>
              <th>Siliga</th> 
              <th>REMARK SILICA GEL</th> 
              <th>HIC</th>
              <th>% HIC (10-60%)</th>
              <th>Others</th>
              <th>Others การบรรจุหีบห่อ (ไม่ใช่ Label)</th>
              <th>KCET LABEL</th>
              <th>RoHS 6/6</th>
              <th>Customer Label</th> 
              <th>ลาเบลพิเศษหน้าห่อ N/A = ไม่มีลาเบลพิเศษ</th> 
              <th>Other</th>
              <th>Special Label (หน้าห่อ)</th> 
              <th>RoHS compliance ลาเบลหน้าห่อ</th> 
              <th>REMARK จำนวนต่อห่อ [ 0 = ไม่มีอะไรพิเศษ]</th> 
              <th>การบบรรจุกล่อง (MATERIAL)</th> 
              <th>น้ำหนัก (WEIGHT)</th> 
              <th>KCET LABEL</th>
              <th>RoHS 6/6</th>
              <th>CUSTOMER LABEL</th>
              <th>ลาเบลพิเศษหน้ากล่อง</th>
              <th>Others</th>
              <th>SPECIAL LABEL (หน้ากล่อง)</th> 
              <th>RoHS Compliance ลาเบลหน้ากล่อง</th> 
              <th>C of C (X)</th>
              <th>INS./FA REPORT (X)</th>
              <th>PHOTO REPORT (X)</th>
              <th>MICRO. (X)</th>
              <th>จำนวนชิ้น</th>
              <th>Sample board (X)</th>
              <th>TEST</th>
              <th>Sample board (X)</th>
              <th>NO TEST</th>
              <th>PPAP (X)</th>
              <th>Level 1, 2 or 3</th>
              <th>Solder test report</th>
              <th>SPC REPORT</th>
              <th>Others (X)</th>
              <th>OTHER REQUIREMENT</th> 
              <th>REMARK : SPECIAL NOTE</th> 
              <th>CHECK LIST UPDATE DATE</th>
              <th>RECORD SPEC BY</th>
              <th>APPROVE BY</th> 
              <th>REMARK : ตรงช่อง DATE CODE</th> 
              <th>PREPREG</th>
              <th>Laminate</th>
              <th>COFC</th>
              <th>INS/FA</th>
              <th>SPC</th>
              <th>PPAP</th>
              <th>PHOTO</th> 
              <th>SOLDER REPORT</th> 
              <th>UpdateDate</th>
              <th>UpdateBy</th>
              <th>Status</th> 
              <th>CancleBy</th> 
            </tr>
        </thead>
        <tbody> 
        <% sql = "SELECT  * FROM [Base_Process].[dbo].[FOI_Master]  "  
        set rs = db.execute(sql)
      
        i = 1 
        do while   not rs.eof   
        ' KCEPART1 = rs("KCEPART") 
        ' KCEPART  =   Split(rs("KCEPART")," ")
 
        %>
        <tr class="text-center">
                <td><%=i%></td> 
                <td><%=rs("KCEPART")%></td>
                <td><%=rs("REV")%></td>
                <td><%=rs("CustCode")%></td>
                <td><%=rs("CustPart")%></td>
                <td><%=rs("Surface")%></td>
                <td><%=rs("BoardProfile")%></td>
                <td><%=rs("LayerCopper")%></td>
                <td><%=rs("Core")%></td>
                <td><%=rs("LMCF_Brand")%></td>
                <td><%=rs("LMCF_TG")%></td>
                <td><%=rs("LMCF_CuFoil")%></td>
                <td><%=rs("FSBT_Spec")%></td>
                <td><%=rs("FSBT_MinMax")%></td>
                <td><%=rs("FSBT_Unit")%></td>
                <td><%=rs("SM_CS")%></td>
                <td><%=rs("SM_SS")%></td>
                <td><%=rs("SM_NA")%></td>
                <td><%=rs("SM_Color")%></td>
                <td><%=rs("SM_Brand")%></td>
                <td><%=rs("LP_CS")%></td>
                <td><%=rs("LP_SS")%></td>
                <td><%=rs("LP_NA")%></td>
                <td><%=rs("LP_Color")%></td>
                <td><%=rs("LP_Brand")%></td>
                <td><%=rs("CBI_CS")%></td>
                <td><%=rs("CBI_SS")%></td>
                <td><%=rs("CBI_NA")%></td>
                <td><%=rs("CBI_Brand")%></td>
                <td><%=rs("PB_CS")%></td>
                <td><%=rs("PB_SS")%></td>
                <td><%=rs("PB_NA")%></td>
                <td><%=rs("PB_Color")%></td>
                <td><%=rs("PB_Brand")%></td>
                <td><%=rs("UL_CS")%></td>
                <td><%=rs("UL_SS")%></td>
                <td><%=rs("UL_PrintOn")%></td>
                <td><%=rs("UL_Logo")%></td>
                <td><%=rs("DC_CS")%></td>
                <td><%=rs("DC_SS")%></td>
                <td><%=rs("DC_DC")%></td>
                <td><%=rs("DC_PrintOn")%></td>
                <td><%=rs("ET_Edge")%></td>
                <td><%=rs("ET_Stamp")%></td>
                <td><%=rs("ET_CS")%></td>
                <td><%=rs("ET_SS")%></td>
                <td><%=rs("CustOnBoard")%></td>
                <td><%=rs("KCEOnBoard")%></td>
                <td><%=rs("DCControl")%></td>
                <td><%=rs("ST_Single")%></td>
                <td><%=rs("ST_Mulity")%></td>
                <td><%=rs("ST_Pcs")%></td>
                <td><%=rs("XO_Scrap")%></td>
                <td><%=rs("XO_Qty")%></td>
                <td><%=rs("XO_SCMark")%></td>
                <td><%=rs("XO_MarkIDE")%></td>
                <td><%=rs("Ionic")%></td>
                <td><%=rs("UgNacl")%></td>
                <td><%=rs("PS_QtyPack")%></td>
                <td><%=rs("PS_OneWayBoard")%></td>
                <td><%=rs("PS_VacuumPackPE")%></td>
                <td><%=rs("PS_DoublePackPE")%></td>
                <td><%=rs("PS_VacuumPackESD")%></td>
                <td><%=rs("PS_DoublePackESD")%></td>
                <td><%=rs("PS_VacuumNylon")%></td>
                <td><%=rs("PS_DoublePackNylon")%></td>
                <td><%=rs("PS_Aluminum")%></td>
                <td><%=rs("PS_DoublePackMBB")%></td>
                <td><%=rs("PS_SulphurFree")%></td>
                <td><%=rs("PS_Siliga")%></td>
                <td><%=rs("PS_RemarkSILICAGEL")%></td>
                <td><%=rs("PS_HIC")%></td>
                <td><%=rs("PS_HIC10")%></td>
                <td><%=rs("PS_Others")%></td>
                <td><%=rs("PS_OthersRemark")%></td>
                <td><%=rs("PL_KCELabel")%></td>
                <td><%=rs("PL_Rohs6/6")%></td>
                <td><%=rs("PL_CustLabel")%></td>
                <td><%=rs("PL_SpecialLabel")%></td>
                <td><%=rs("PL_Other")%></td>
                <td><%=rs("PL_SpecialLabelRemark")%></td>
                <td><%=rs("PL_Rohs")%></td>
                <td><%=rs("PL_PackingRemark")%></td>
                <td><%=rs("CT_Material")%></td>
                <td><%=rs("CT_Weight")%></td>
                <td><%=rs("CL_KCELabel")%></td>
                <td><%=rs("CL_Rohs6/6")%></td>
                <td><%=rs("CL_CustLabel")%></td>
                <td><%=rs("CL_SpecialLabel")%></td>
                <td><%=rs("CL_Other")%></td>
                <td><%=rs("CL_SpecialLabelRemark")%></td>
                <td><%=rs("CL_Rohs")%></td>
                <td><%=rs("QA_CofC")%></td>
                <td><%=rs("QA_INS_FA")%></td>
                <td><%=rs("QA_PHOTO")%></td>
                <td><%=rs("QA_MICRO")%></td>
                <td><%=rs("QA_Pcs")%></td>
                <td><%=rs("QA_SampleBoardTest")%></td>
                <td><%=rs("QA_Test")%></td>
                <td><%=rs("QA_SampleBoardNotTest")%></td>
                <td><%=rs("QA_NotTest")%></td>
                <td><%=rs("QA_PPAP")%></td>
                <td><%=rs("QA_Level")%></td>
                <td><%=rs("QA_SolderTest")%></td>
                <td><%=rs("QA_SPC")%></td>
                <td><%=rs("QA_Other")%></td>
                <td><%=rs("QA_OtherRequirement")%></td>
                <td><%=rs("QA_SpecialNote")%></td>
                <td><%=rs("DocCheck_CUTHK")%></td>
                <td><%=rs("DocCheck_SMTHK")%></td>
                <td><%=rs("DocCheck__SFTHK")%></td>
                <td><%=rs("RemarkDC")%></td>
                <td><%=rs("Prepreg")%></td>
                <td><%=rs("Laminate")%></td>
                <td><%=rs("RD_COFC")%></td>
                <td><%=rs("RD_INS/FA")%></td>
                <td><%=rs("RD_SPC")%></td>
                <td><%=rs("RD_PPAP")%></td>
                <td><%=rs("RD_PHOTO")%></td>
                <td><%=rs("RD_SOLDER")%></td>
                <td><%=rs("UpdateDate")%></td>
                <td><%=rs("UpdateBy")%></td>
                <td><%=rs("Status")%></td>
                <td><%=rs("DeleteBy")%></td>
        </tr>
        <%
          i = i + 1
          rs.movenext
          If i Mod 900 Then
              Response.Flush
          End IF
          loop
        %>
        </tbody>
        </table>
      </div>
   </div>
 </div>
</div>
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.bundle.min.js"></script>
    <script src="../js/Inspection.js"></script>
    <script src="../manages/script.js"></script>
    <script src="../js/jquery.dataTables.min.js"></script>
    <script src="../js/dataTables.bootstrap4.min.js"></script>
   
    <script>
     $(document).ready(function() {
       var table = $('#example').DataTable();
  });
    
  
        </script>
    </script>
</body>
</html>