$(document).ready(function () {
  const url = new URL(window.location);

  $("#btn_search").click(async function () {
    const custcode = $("#txt_custcode").val();
    var checkboxs = document.getElementsByName('sample_mass');

    for (var i = 0, length = checkboxs.length; i < length; i++) {
      if (checkboxs[i].checked) {
        sample_mass = checkboxs[i].value;
        break;
      }
    }

    const kcepart = $("#txt_kcepart").val();

    $("#inspection-list").html('<h3 class="text-center">LOADING...</h3>');

    const res = await fetch(`${url.origin}/Foi/backend/data-Inspection.asp`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ custcode, kcepart }),
    });

    const data = await res.json();

    await generationCheckList(data);
  });

  function generationCheckList(data) {
    return new Promise(async (resolve, reject) => {

      let html = ``;

      if (Object.keys(data).length === 0 && data.constructor === Object) {
        html = `<h3 class="text-center text-danger">NOT FOUND!</h3>`;
        $("#inspection-list").html(html);
      } else {
        form_sample = `  
        <table class="table table-sm table-bordered" style="font-size: 12px">
        <thead class="thead-dark">
          <tr>
            <th scope="col">DOCUMENT CHECK</th>
            <th scope="col">SPECIFICATION</th>
            <th scope="col">ACTUAL</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row">1.COPPER THK. (IN HOLE/SURFACE)</th>
            <td>N/A</td>
            <td>N/A</td>
          </tr>
          <tr>
            <th scope="row">2.S/M THK.(ON CKT./LAMINATE)</th>
            <td>N/A</td>
            <td>N/A</td>
          </tr>
          <tr>
            <th scope="row">3.FINISHED SURFACE/THICKNESS</th>
            <td>N/A</td>
            <td>N/A</td>
          </tr>
          <tr>
            <th scope="row">4.HOLE SIZE REFERENCE MI.</th>
            <td>N/A</td>
            <td>N/A</td>
          </tr>
          <tr>
            <th scope="row">5.LINE WIDTH & SPACING REFERENCE MI.</th>
            <td>N/A</td>
            <td>N/A</td>
          </tr>
          <tr>
            <th scope="row">6.DIMENSION PROFILE REFERENCE DRAWING</th>
            <td>N/A</td>
            <td>N/A</td>
          </tr>
          <tr>
            <th scope="row">7.SODERABILITY TESTED</th>
            <td>N/A</td>
            <td>N/A</td>
          </tr>
          <tr>
            <th scope="row">8.IONIC CONTAMINATION</th>
            <td>N/A</td>
            <td>N/A</td>
          </tr>
          <tr>
            <th scope="row">9.OTHERS</th>
            <td>N/A</td>
            <td>N/A</td>
          </tr>
        </tbody>
      </table>`;
        form_mass = `<table class="table table-sm table-bordered" style="font-size: 12px">
        <thead class="thead-dark">
          <tr>
            <th scope="col">DOCUMENT CHECK</th>
            <th scope="col">SPECIFICATION</th>
            <th scope="col">ACTUAL</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row">1.COPPER THK. (IN HOLE/SURFACE)</th>
            <td>N/A</td>
            <td><input type="text" autocomplete="off" class="form-control form-control-sm" name="txt_copper_thk" maxlength="20" required></td>
          </tr>
          <tr>
            <th scope="row">2.S/M THK.(ON CKT./LAMINATE)</th>
            <td>N/A</td>
            <td><input type="text" autocomplete="off" class="form-control form-control-sm" name="txt_sm_thk" maxlength="20" required autocom></td>
          </tr>
          <tr>
            <th scope="row">3.FINISHED SURFACE/THICKNESS</th>
            <td>N/A</td>
            <td><input type="text" autocomplete="off" class="form-control form-control-sm" name="txt_finish_surface" maxlength="20" required></td>
          </tr>
          <tr>
            <th scope="row">4.HOLE SIZE REFERENCE MI.</th>
            <td>N/A</td>
            <td><input type="text" autocomplete="off" class="form-control form-control-sm" name="txt_hole_size" maxlength="20" required></td>
          </tr>
          <tr>
            <th scope="row">5.LINE WIDTH & SPACING REFERENCE MI.</th>
            <td>N/A</td>
            <td><input type="text" autocomplete="off" class="form-control form-control-sm" name="txt_line_width" maxlength="20" required></td>
          </tr>
          <tr>
            <th scope="row">6.DIMENSION PROFILE REFERENCE DRAWING</th>
            <td>N/A</td>
            <td><input type="text" autocomplete="off" class="form-control form-control-sm" name="txt_dimension_frofile" maxlength="20" required></td>
          </tr>
          <tr>
            <th scope="row">7.SODERABILITY TESTED</th>
            <td>N/A</td>
            <td><input type="text" autocomplete="off" class="form-control form-control-sm" name="txt_soderability" maxlength="20" required></td>
          </tr>
          <tr>
            <th scope="row">8.IONIC CONTAMINATION</th>
            <td>N/A</td>
            <td><input type="text" autocomplete="off" class="form-control form-control-sm" name="txt_ionic" maxlength="20" required></td>
          </tr>
          <tr>
            <th scope="row">9.OTHERS</th>
            <td>N/A</td>
            <td><input type="text" autocomplete="off" class="form-control form-control-sm" name="txt_others" maxlength="20" required></td>
          </tr>
        </tbody>
      </table>`;
        html = `
        <table class="table table-sm align-middle text-nowrap table-bordered" style="font-size: 12px">
        <tr>
        <th width="10%" class="text-left">CUSTNAME</th>
        <td>${data.CustName}
        <input type="hidden" name="txt_type" value="${sample_mass == "1" ? "SAMPLE" : "MASS"}"> 
        <input type="hidden" name="txt_CustName" value="${data.CustName}"> 
        <input type="hidden" name="txt_kcepart" value="${data.KCEPART}">
        <input type="hidden" name="txt_custcode" value="${data.CustCode}"></td>
        </tr>
        <tr>
        <th class="text-left">CUSTCODE</th>
        <td>${data.CustCode}</td>
        </tr>
        <tr>
        <th class="text-left" >REV.</th>
        <td>${data.REV}</td>
        </tr>
        <tr>
        <th class="text-left">CUSTPART</th>
        <td>${data.CustPart}</td>
        </tr>
      </table>  
      <table class="table table-bordered table-sm text-nowrap align-middle" style="font-size: 12px;">
          <tr>
            <th width="10%" >SHIPMENT DATE</th> 
             <td> 
              <input type="date" autocomplete="off" class="form-control form-control-sm" name="txt_Shipment_date"  required/>
            </td> 
          </tr>
          <tr>
            <th >INVOICE NO.</th>
            <td><input type="text" autocomplete="off" class="form-control form-control-sm" name="txt_invoice_no" required></td>
          </tr>
          <tr>
            <th>WO#LOT</th> 
            <td><input type="text" autocomplete="off" class="form-control form-control-sm" name="txt_wo_lot" required></td>
          </tr>
          <tr>
            <th>MI. ISSUE</th>
            <td><input type="text" autocomplete="off" class="form-control form-control-sm" name="txt_mi_issue" required> </td>
          </tr> 
    </table>  
<hr>
      ${sample_mass != "" && sample_mass == "1" && form_sample || sample_mass == "2" && form_mass}
       
      <table class="table table-sm table-bordered" style="font-size: 12px">
      <thead class="thead-dark ">
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
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="QTYSHIP" name="txt_QTYSHIP" maxlength="20"
              required>
          </td>
        </tr>
        <tr>
          <th scope="row" colspan="3">1.SOLDER MASK</th>
        </tr>
        <tr>
          <td>SIDE:
            <input type="checkbox" ${data.SM_CS != "" && data.SM_CS == "X" && "checked"} disabled /> C/S
            <input type="checkbox" ${data.SM_SS != "" && data.SM_SS == "X" && "checked"} disabled /> S/S
            <input type="checkbox" ${data.SM_NA != "" && data.SM_NA == "X" && "checked"} disabled /> N/A
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_SMSide" value="1"/>
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>COLOR:<font class="text-info">${data.SM_Color}</font>
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_SMColor" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>BRAND/SERIES: <font class="text-info">${data.SM_Brand}</font>
          </td>
          <td>N.D.</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_SMBrand" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>
          <th scope="row" colspan="3">2.LEGEND</th>
        </tr>
        <tr>

          <td>SIDE:
            <input type="checkbox" ${data.LP_CS != "" && data.LP_CS == "X" && "checked"} disabled /> C/S
            <input type="checkbox" ${data.LP_SS != "" && data.LP_SS == "X" && "checked"} disabled /> S/S
            <input type="checkbox" ${data.LP_NA != "" && data.LP_NA == "X" && "checked"} disabled /> N/A
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_LPSide" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>COLOR: <font class="text-info">${data.LP_Color}</font>
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_LPColor" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>BRAND/SERIES: <font class="text-info">${data.LP_Brand
          }</font>
          </td>
          <td>N.D.</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_LPBrand" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>
          <th scope="row" colspan="3">3.CARBON PRINTING</th>
        </tr>

        <tr>

          <td>SIDE:
            <input type="checkbox" ${data.CBI_CS != "" && data.CBI_CS == "X" && "checked"} disabled /> C/S
            <input type="checkbox" ${data.CBI_SS != "" && data.CBI_SS == "X" && "checked"} disabled /> S/S
            <input type="checkbox" ${data.CBI_NA != "" && data.CBI_NA == "X" && "checked"} disabled /> N/A
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_CBISide" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>COLOR: <font class="text-info">${data.CBI_Color}</font>
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_CBIColor" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>
          <th scope="row" colspan="3">4.PELABLE MASK</th>
        </tr>

        <tr>

          <td>SIDE:
            <input type="checkbox" ${data.PB_CS != "" && data.PB_CS == "X" && "checked"} disabled /> C/S
            <input type="checkbox" ${data.PB_SS != "" && data.PB_SS == "X" && "checked"} disabled /> S/S
            <input type="checkbox" ${data.PB_NA != "" && data.PB_NA == "X" && "checked"} disabled /> N/A
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PBSide" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>COLOR:<font class="text-info">${data.PB_Color}</font>
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PBColor" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>BRAND/SERIES: <font class="text-info">${data.PB_Brand
          }</font>
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PBBrand" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        <tr>
          <td></td>
          <td>POSITION PER ART WORK</td>
        </tr>
        </tr>
        <tr>
          <th scope="row" colspan="3">5.MARKING</th>
        </tr>
        <tr>

          <td>SIDE:
            <input type="checkbox" ${data.UL_CS != "" && data.UL_CS == "X" && "checked"} disabled /> C/S
            <input type="checkbox" ${data.UL_SS != "" && data.UL_SS == "X" && "checked"} disabled /> S/S
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_ULSide" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>UL LOGO: <font class="text-info">${data.UL_Logo
          }</font> /ON <font class="text-info">${data.UL_PrintOn}</font>
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_ULLogo" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>SIDE:
            <input type="checkbox" ${data.DC_CS != "" && data.DC_CS == "X" && "checked"} disabled /> C/S
            <input type="checkbox" ${data.DC_SS != "" && data.DC_SS == "X" && "checked"} disabled /> S/S
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_DCSide" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>DATECODE: <font class="text-info">${data.DC_DC
          }</font> /ON <font class="text-info">${data.DC_PrintOn}</font>
          </td>
          <td>N/A</td>
          <td>
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="DCMarking" name="txt_DCMarking" maxlength="20"
              required>
          </td>
        </tr>
        <tr>

          <td>ET MARK:
            <input type="checkbox" ${data.ET_Edge != "" && data.ET_Edge == "X" && "checked"} disabled /> EDGE MARK
            <input type="checkbox" ${data.ET_Stamp != "" && data.ET_Stamp == "X" && "checked"} disabled /> STAMP
          </td>
          <td>N/A</td>
          <td>
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="ETMark" name="txt_ETMark" maxlength="20"
              required>
          </td>
        </tr>
        <tr>

          <td>SIDE:
            <input type="checkbox" ${data.ET_CS != "" && data.ET_CS == "X" && "checked"} disabled /> C/S
            <input type="checkbox" ${data.ET_SS != "" && data.ET_SS == "X" && "checked"} disabled /> S/S
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_ETSide" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>CUST. P/N(ON BOARD): <font class="text-info">${data.CustOnBoard
          }</font>
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_CustOnBoard" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>KCE P/N(ON BOARD): <font class="text-info">${data.KCEOnBoard
          }</font>
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_KCEOnBoard" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>
          <th scope="row" colspan="3">6. SURFACE FINISH</th>
        </tr>
        <tr>

          <td>SURFACE FINISH: <font class="text-info">${data.Surface
          }</font>
          </td>
          <td>N.D.</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_Surface" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>DATECODE CONTROL: <font class="text-info">${data.DCControl
          }</font> WEEK</td>
          <td>N/A</td>
          <td>
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="DCControl" name="txt_DCControl" maxlength="20"
              required>
          </td>
        </tr>

        <tr>
          <th scope="row" colspan="3">7. STEP/REPERT</th>
        </tr>
        <tr>

          <td>
            <input type="checkbox" ${data.ST_Single != "" && data.ST_Single == "X" && "checked"} disabled /> SINGLE
            <input type="checkbox" ${data.ST_Mulity != "" && data.ST_Mulity == "X" && "checked"} disabled /> MULTIFORM
            <font class="text-info">${data.ST_Pcs
          }</font> PCS.
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_Step" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" ${data.XO_Scrap != "" && data.XO_Scrap == "X" && "checked"} disabled /> SCRAP ALLOW
            <font class="text-info"> ${data.XO_Qty
          } </font> PCS/MULTIFORM
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_XOScrap" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" ${data.XO_SCMark != "" && data.XO_SCMark == "X" && "checked"} disabled /> SCRAP MARK
            <font class="text-info"> ${data.XO_MarkIDE
          } </font>
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_XOSCMark" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>BOARD PROFILE <font class="text-info">${data.BoardProfile
          }</font>
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_BoardProfile" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
      </tbody>
    </table>

    <table class="table table-sm table-bordered" style="font-size: 12px">
      <thead class="thead-dark">
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
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="QTYPACKAGE" name="txt_QTYPACKAGE" maxlength="20"
              required>
          </td>
        </tr>
        <tr>

          <td>Q'TY /PACK <font class="text-info">${data.PS_QtyPack
          }</font> PNL</td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PS_QtyPack" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" ${data.PS_OneWayBoard != "" && data.PS_OneWayBoard == "X" && "checked"} disabled />
            เรียง Board ไปในทิศทางเดียวกัน
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PS_OneWayBoard" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" ${data.PS_VacuumPackPE != "" && data.PS_VacuumPackPE == "X" && "checked"} disabled />
            Vacuum Pack ด้วย Air bubble & Placstic Wrap(PE)
          </td>
          <td>N.D.</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PS_VacuumPackPE" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" ${data.PS_VacuumPackESD != "" && data.PS_VacuumPackESD == "X" && "checked"} disabled />
            Vacuum Pack ด้วย Air bubble & Placstic Wrap(ESD)
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PS_VacuumPackESD" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" ${data.PS_VacuumNylon != "" && data.PS_VacuumNylon == "X" && "checked"} disabled />
            Vacuum Heat seal ด้วยถุง Nylon Plastic
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PS_VacuumNylon" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" ${data.PS_Aluminum != "" && data.PS_Aluminum == "X" && "checked"} disabled /> Vacuum
            Pack ด้วย Aluminum bag (MBB Packing)
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PS_Aluminum" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" ${data.PS_SulphurFree != "" && data.PS_SulphurFree == "X" && "checked"} disabled />
            ใช้กระดาษ Sulphur free ปิดบนล่างไม่ให้สัมผัส Plastic
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PS_SulphurFree" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" ${data.PS_Siliga != "" && data.PS_Siliga == "X" && "checked"} disabled /> SILICA GEL
            <font class="text-info">${data.PS_RemarkSILICAGEL
          }</font>
          </td>
          <td>N.D.</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PS_RemarkSILICAGEL" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" ${data.PS_HIC != "" && data.PS_HIC == "X" && "checked"} disabled /> PS_HIC Humidity
            indicator card(HIC) <font class="text-info">${data.PS_HIC10
          }</font> %
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PS_HIC" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" ${data.PS_Others != "" && data.PS_Others == "X" && "checked"} disabled /> Other <font
              class="text-info"> ${data.PS_OthersRemark}</font> %
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PS_Others" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>
          <th scope="row" colspan="3">2.PACKING LABELING</th>
        </tr>
        <tr>
          <td>
            <input type="checkbox" ${data.PL_KCELabel != "" && data.PL_KCELabel == "X" && "checked"} disabled /> KCE LABEL
            /KCE P/N <font class="text-info">${data.KCEPART
          }</font> REV. <font class="text-info">${data.REV}</font>
          </td>
          <td>N.D.</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PL_KCELabel" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" ${data.CustPart != "" && data.CustPart == "X" && "checked"} disabled /> CUST P/N <font
              class="text-info">${data.CustPart
          }</font>
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PL_CustPart" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" ${data.PL_CustLabel != "" && data.PL_CustLabel == "X" && "checked"} disabled /> CUST
            LABEL
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PL_CustLabel" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" ${data.PL_Rohs != "" && data.PL_Rohs == "X" && "checked"} disabled /> RoHS Conpliance
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PL_Rohs" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>SPECIAL MARK <font class="text-info">${data.PL_SpecialLabelRemark
          }</font>
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_PL_SpecialLabelRemark" value="1">
            <label class="form-check-label"> OK </label></div>
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
              required>
          </td>
        </tr>
        <tr>

          <td>MATERIAL <font class="text-info">${data.CT_Material
          }</font>
          </td>
          <td>N.D.</td>
          <td>
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="CARTONMATERIAL" name="txt_CT_Material"
              maxlength="20" required>
          </td>
        </tr>
        <tr>

          <td>MAX WEIGHT <font class="text-info">${data.CT_Weight
          }</font> KG.(MAX)</td>
          <td>N/A</td>
          <td>
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="CARTONWEIGHT" name="txt_CT_Weight"
              maxlength="20" required>
          </td>
        </tr>
        <tr>
          <td>Q'TY BOX PER SHIPMENT : REF. PACKING LIST</td>
          <td>N/A</td>
          <td>
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="CARTONQTYBOX" name="txt_CT_QTY" maxlength="20"
              required>
          </td>
        </tr>
        <tr>
          <th scope="row">4.CARTON LABELING</th>
        </tr>
        <tr>

          <td>
            <input type="checkbox" ${data.CL_KCELabel != "" && data.CL_KCELabel == "X" && "checked"} disabled /> KCE LABEL
            /KCE P/N <font class="text-info">${data.KCEPART
          }</font> REV. <font class="text-info">${data.REV}</font>
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_CL_KCEPART" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" ${data.CustPart != "" && data.CustPart == "X" && "checked"} disabled /> CUST P/N <font
              class="text-info">${data.CustPart
          }</font>
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_CL_CustPart" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" ${data.CL_CustLabel != "" && data.CL_CustLabel == "X" && "checked"} disabled /> CUST
            LABEL <font class="text-info">${data.CL_CustLabel
          }</font>
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_CL_CustLabel" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" ${data.CL_Rohs != "" && data.CL_Rohs == "X" && "checked"} disabled /> RoHS
            Compliance <font class="text-info">${data.CL_Rohs
          }</font>
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_CL_Rohs" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" ${data.CL_SpecialLabelRemark != "" && data.CL_SpecialLabelRemark == "X" && "checked"}
              disabled /> SPECIAL MARK <font class="text-info">${data.CL_SpecialLabelRemark
          }</font>
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_CL_SpecialLabelRemark" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>SAMPLING BOX NO.</td>
          <td>N/A</td>
          <td>
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="CARTONSAMPLING" name="txt_CL_SAMPLING"
              maxlength="50" required>
          </td>
        </tr>
      </tbody>
    </table>
 
    <table class="table table-sm table-bordered" style="font-size: 12px">
      <thead class="thead-dark">
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
            <input type="checkbox" ${data.QA_CofC != "" && data.QA_CofC == "X" && "checked"} disabled /> C OF C
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_QA_CofC" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" ${data.QA_INS_FA != "" && data.QA_INS_FA == "X" && "checked"} disabled /> INSPECTION /
            FA. REPORT
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_QA_INS_FA" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" ${data.QA_SolderTest != "" && data.QA_SolderTest == "X" && "checked"} disabled />
            SOLDERABILITY TEST REPORT
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_QA_SolderTest" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" ${data.QA_PHOTO != "" && data.QA_PHOTO == "X" && "checked"} disabled /> PHOTO REPORT
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_QA_PHOTO" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" ${data.QA_SPC != "" && data.QA_SPC == "X" && "checked"} disabled /> SPC REPORT
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_QA_SPC" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" ${data.QA_MICRO != "" && data.QA_MICRO == "X" && "checked"} disabled /> MICRO SECTION
            <font class="text-info">${data.QA_Pcs
          }</font> PCS.
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_QA_MICRO" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" ${data.QA_SampleBoardTest != "" && data.QA_SampleBoardTest == "X" && "checked"}
              disabled /> SAMPLE BOARD TEST <font class="text-info">${data.QA_Test
          }</font> PCS.
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_QA_SampleBoardTest" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" ${data.QA_SampleBoardNotTest != "" && data.QA_SampleBoardNotTest == "X" && "checked"}
              disabled /> SAMPLE BOARD NO TEST <font class="text-info">${data.QA_NotTest
          }</font> PCS.
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_QA_SampleBoardNotTest" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr> 
          <td>
            <input type="checkbox" ${data.QA_PPAP != "" && data.QA_PPAP == "X" && "checked"} disabled /> PPAP LEVEL <font
              class="text-info">${data.QA_Level
          }</font> PCS.
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_QA_PPAP" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>
            <input type="checkbox" ${data.QA_Other != "" && data.QA_Other == "X" && "checked"} disabled /> OTHER <font
              class="text-info">${data.QA_OtherRequirement
          }</font>
          </td>
          <td>N/A</td>
          <td>
            <div class="form-check"><input class="form-check-input" type="checkbox" name="rbt_QA_Other" value="1">
            <label class="form-check-label"> OK </label></div>
          </td>
        </tr>
        <tr>

          <td>DATECODE / Q'TY SHIPMENT</td>
          <td></td>
          <td>
            <input type="text" autocomplete="off" class="form-control form-control-sm" id="DCSHIP" name="txt_DCSHIP" maxlength="50"
              required>
          </td>
        </tr>
        <tr>
          <td colspan="3">REMARK</td>  
        </tr>
        <tr> 
          <td colspan="3">1.จำนวนงานต่อกล่องต้องเป็น 25,50,75,100,125,150 etc. (หาร 25 ลงตัว)</td> 
        </tr>

      </tbody>
    </table>
        
 <div class="modal-footer">
 <button type="submit" class="btn btn-outline-success text-right" id="btn_Save">Save</button>
 </div>  
        `;
        $("#inspection-list").html(html);
      }

      resolve();
    });
  }
});
