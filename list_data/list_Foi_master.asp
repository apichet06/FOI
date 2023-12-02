<% 
    username=Request.Cookies("LOGON_USER" ) 'esponse.write (username) 
    If  username="" Then 
        Response.Write("<script>")
        Response.Write("window.location.href = 'http://192.168.35.5/login.asp?href=http://192.168.35.5/FOI/default.asp';")
        Response.Write("</script>") 
    End If 
      'response.write(Year(NOW()) &"-"& Month(NOW()) &"-"& day(NOW()) &" "&Time) 
%>
<!--#include file = "../backend/connection/db.asp"-->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>FOI Master Report</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css" />
    <link rel="manifest" href="../manifest.json" />
    <link rel="stylesheet" href="../css/dataTables.bootstrap4.min.css" />
 
  </head>

  <body>
    <!--#include file="../memu/menu.asp"-->

    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
          <H5 class="text-center">FOI MASTER REPORT</H5>
          <hr />
        </div>
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
            <tr>
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
      $.fn.dataTable.ext.errMode = 'none'; 
        $('#example').on( 'error.dt', function ( e, settings, techNote, message ) {
          console.log( 'An error has been reported by DataTables: ', message );
          }) .DataTable( {  
            serverSide: true,
            "processing": true, 
             dom: "Bfrtip", 
                ajax: {
                    url: 'filejson.asp',
                    type: 'POST'
                }, 
             
    } );
  

} );
    </script>
  </body>
</html>
