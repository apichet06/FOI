<% username =Request.Cookies("LOGON_USER")
'esponse.write (username)
If username ="" Then
    Response.Write("<script>")
    Response.Write("window.location.href = 'http://192.168.35.5/FOI/default.asp; ")
    Response.Write("</script>") 
 End If
 
 'response.write(Year(NOW()) &"-"& Month(NOW()) &"-"& day(NOW()) &" "& Time)
 
 %>
<!--#include file = "../backend/connection/db.asp"--> 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../css/bootstrap.min.css" /> 
    <link rel="manifest" href="../manifest.json" />
    
    <link rel="stylesheet" href="../css/sweetalert2.min.css" id="theme-styles" />
    <link rel="stylesheet" href="../css/select2.min.css">
    <title>FOI Master</title> 
  </head>
  <body>
    <!--#include file="../memu/menu.asp"-->

    <style> 
              /* The container */
              /* .custom-control-input{
                
                 height: 18px;
                 width: 18px;  
                cursor: pointer; 
              }               */
    </style>
    <div class="container-fluid">
      <div class="row pt-3">
     
        <div class="col-md-12">
          <div
            class="text-center pt-2 mb-1 font-weight-bold"
            style="font-size: 30px"> FOI Master <hr>
          </div>
        </div>
      </div>
    </div>
    <div class="container-fluid">
      <div class="row justify-content-center mt-3">
        <div class="col-md-6 mb-1">
          <div class="card">
            <div class="card-body">
            <div  class="row justify-content-center " >
              <form class="form-inline" method="get" action="default.asp" id="search">
                <label class="my-1 mr-2" >ค้นหา : </label >
                <select class="custom-select my-1 mr-sm-2 select_data " name="KCEPART" width="100%" id="">
                  <option value="">--- CUSTOMER CODE & KCEPART ---</option> 
                  <% sql = "SELECT CUSTCODE,KCEPART From [Base_Process].[dbo].[FOI_Master]  Where Status <> 'N' "
                  Set rs= db.execute(sql)
                  do while rs.EOF= false %>  
                  <option value="<%=rs("CUSTCODE")&","&rs("KCEPART")%>"><%=rs("CUSTCODE")&" - "&rs("KCEPART")%></option>
                  <% 
                      rs.MoveNext 
                      loop 
                  %>
                </select> &nbsp; &nbsp;
                <input type="submit" value="Search" class="btn btn-primary my-1 mr-sm-2" >  
              </form>
              <a href="default.asp" class="btn btn-info my-1 mr-sm-2">NEW</a>
            </div>
            </div>
          </div>
        </div>

 
        <div class="col-md-12 col-lg-12 col-xl-9"><hr>
          <div class="card">
            <div class="card-body"> 
            <%    
                  KCEPART_ = Request.querystring("KCEPART")

                  If KCEPART_ <>"" Then
                      ARRAYDATA = Split(Request.querystring("KCEPART"),",")
                      KCEPART = ARRAYDATA(1)
                      CUSTCODE = ARRAYDATA(0)
                  Else
                      KCEPART = KCEPART_
                      CUSTCODE = ""
                  End if

                  sql = "SELECT * FROM [Base_Process].[dbo].[FOI_Master] WHERE [KCEPART] = '"&KCEPART&"' "
                  rs= db.execute(sql)
                  If KCEPART <> "" Then
                    ID=rs("ID")
                    KCEPART=rs("KCEPART") 
                    REV=rs("REV")
                    CustCode=rs("CustCode")
                    CustPart=rs("CustPart")
                    Surface=rs("Surface")
                    BoardProfile=rs("BoardProfile")
                    LayerCopper=rs("LayerCopper")
                    Core=rs("Core")
                    LMCF_Brand=rs("LMCF_Brand")
                    LMCF_TG=rs("LMCF_TG")
                    LMCF_CuFoil=rs("LMCF_CuFoil")
                    FSBT_Spec=rs("FSBT_Spec")
                    FSBT_MinMax=rs("FSBT_MinMax")
                    FSBT_Unit=rs("FSBT_Unit")
                    SM_CS=rs("SM_CS")
                    SM_SS=rs("SM_SS")
                    SM_NA=rs("SM_NA")
                    SM_Color=rs("SM_Color")
                    SM_Brand=rs("SM_Brand")
                    LP_CS=rs("LP_CS")
                    LP_SS=rs("LP_SS")
                    LP_NA=rs("LP_NA")
                    LP_Color=rs("LP_Color")
                    LP_Brand=rs("LP_Brand")
                    CBI_CS=rs("CBI_CS")
                    CBI_SS=rs("CBI_SS")
                    CBI_NA=rs("CBI_NA")
                    CBI_Brand=rs("CBI_Brand")
                    PB_CS=rs("PB_CS")
                    PB_SS=rs("PB_SS")
                    PB_NA=rs("PB_NA")
                    PB_Color=rs("PB_Color")
                    PB_Brand=rs("PB_Brand")
                    UL_CS=rs("UL_CS")
                    UL_SS=rs("UL_SS")
                    UL_PrintOn=rs("UL_PrintOn")
                    UL_Logo=rs("UL_Logo")
                    DC_CS=rs("DC_CS")
                    DC_SS=rs("DC_SS")
                    DC_DC=rs("DC_DC")
                    DC_PrintOn=rs("DC_PrintOn")
                    ET_Edge=rs("ET_Edge")
                    ET_Stamp=rs("ET_Stamp")
                    ET_CS=rs("ET_CS")
                    ET_SS=rs("ET_SS")
                    CustOnBoard=rs("CustOnBoard")
                    KCEOnBoard=rs("KCEOnBoard")
                    DCControl=rs("DCControl")
                    ST_Single=rs("ST_Single")
                    ST_Mulity=rs("ST_Mulity")
                    ST_Pcs=rs("ST_Pcs")
                    XO_Scrap=rs("XO_Scrap")
                    XO_Qty=rs("XO_Qty")
                    XO_SCMark=rs("XO_SCMark")
                    XO_MarkIDE=rs("XO_MarkIDE")
                    Ionic=rs("Ionic")
                    UgNacl=rs("UgNacl")
                    PS_QtyPack=rs("PS_QtyPack")
                    PS_OneWayBoard=rs("PS_OneWayBoard")
                    PS_VacuumPackPE=rs("PS_VacuumPackPE")
                    PS_DoublePackPE=rs("PS_DoublePackPE")
                    PS_VacuumPackESD=rs("PS_VacuumPackESD")
                    PS_DoublePackESD=rs("PS_DoublePackESD")
                    PS_VacuumNylon=rs("PS_VacuumNylon")
                    PS_DoublePackNylon=rs("PS_DoublePackNylon")
                    PS_Aluminum=rs("PS_Aluminum")
                    PS_DoublePackMBB=rs("PS_DoublePackMBB")
                    PS_SulphurFree=rs("PS_SulphurFree")
                    PS_Siliga=rs("PS_Siliga")
                    PS_RemarkSILICAGEL=rs("PS_RemarkSILICAGEL")
                    PS_HIC=rs("PS_HIC")
                    PS_HIC10=rs("PS_HIC10")
                    PS_Others=rs("PS_Others")
                    PS_OthersRemark=rs("PS_OthersRemark")
                    PL_KCELabel=rs("PL_KCELabel")
                    PL_Rohs6_6=rs("PL_Rohs6/6")
                    PL_CustLabel=rs("PL_CustLabel")
                    PL_SpecialLabel=rs("PL_SpecialLabel")
                    PL_Other=rs("PL_Other")
                    PL_SpecialLabelRemark=rs("PL_SpecialLabelRemark")
                    PL_Rohs=rs("PL_Rohs")
                    PL_PackingRemark=rs("PL_PackingRemark")
                    CT_Material=rs("CT_Material")
                    CT_Weight=rs("CT_Weight")
                    CL_KCELabel=rs("CL_KCELabel")
                    CL_Rohs6_6=rs("CL_Rohs6/6")
                    CL_CustLabel=rs("CL_CustLabel")
                    CL_SpecialLabel=rs("CL_SpecialLabel")
                    CL_Other=rs("CL_Other")
                    CL_SpecialLabelRemark=rs("CL_SpecialLabelRemark")
                    CL_Rohs=rs("CL_Rohs")
                    QA_CofC=rs("QA_CofC")
                    QA_INS_FA=rs("QA_INS_FA")
                    QA_PHOTO=rs("QA_PHOTO")
                    QA_MICRO=rs("QA_MICRO")
                    QA_Pcs=rs("QA_Pcs")
                    QA_SampleBoardTest=rs("QA_SampleBoardTest")
                    QA_Test=rs("QA_Test")
                    QA_SampleBoardNotTest=rs("QA_SampleBoardNotTest")
                    QA_NotTest=rs("QA_NotTest")
                    QA_PPAP=rs("QA_PPAP")
                    QA_Level=rs("QA_Level")
                    QA_SolderTest=rs("QA_SolderTest")
                    QA_SPC=rs("QA_SPC")
                    QA_Other=rs("QA_Other")
                    QA_OtherRequirement=rs("QA_OtherRequirement")
                    QA_SpecialNote=rs("QA_SpecialNote")
                    DocCheck_CUTHK=rs("DocCheck_CUTHK")
                    DocCheck_SMTHK=rs("DocCheck_SMTHK")
                    DocCheck__SFTHK=rs("DocCheck__SFTHK")
                    RemarkDC=rs("RemarkDC")
                    Prepreg=rs("Prepreg")
                    Laminate=rs("Laminate")
                    RD_COFC=rs("RD_COFC")
                    RD_INS_FA=rs("RD_INS/FA")
                    RD_SPC=rs("RD_SPC")
                    RD_PPAP=rs("RD_PPAP")
                    RD_PHOTO=rs("RD_PHOTO")
                    RD_SOLDER=rs("RD_SOLDER")
                    UpdateDate=rs("UpdateDate")
                    UpdateBy=rs("UpdateBy") 
                       
             End if
                    
         %>
              <form id="insert" style="font-size: 12px">
                <div class="row">
              <div class="col-md-12 mb-2">
                <div class="card text-center border-dark text-white bg-dark">
                    <div class="card-header">
                      Mass & Sample
                    </div> 
                    <div class="form-row p-1">
                  <div class="form-group col-md-3 mb-1 " name="KCEPART"> 
                    <label>KCEPART</label>
                     <select class="custom-select custom-select-sm select_data" name ="KCEPART"  <% If ID <> "" Then %>   disabled  <% End if %> width="100%" id ="kcepart">
                        <option value="">KCEPART</option>
                    <% sql0 = " SELECT KCEPART FROM [FGMGR].[dbo].[PACKTRAN] " &_
                              " group by KCEPART "
                        set row = db.execute(sql0)
                       while not row.eof %> 
                         <option value="<%=row("KCEPART")%>" <% if KCEPART = row("KCEPART") then %> selected <% end if %>><%=row("KCEPART")%></option>
                         <% row.movenext
                          Wend %>
                        </select> 
                    <input
                      type="hidden"
                      class="form-control form-control-sm"
                      name="ID"
                       id="ID"
                      value="<%=ID%>"
                    />
                  </div>
                  <div class="form-group col-md-3 mb-1">
                    <label>REV</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="REV"
                      value="<%=REV%>"
                    />
                  </div>
                  <div class="form-group col-md-3 mb-1">
                    <label>CUSTOMER CODE</label>
                    <% If KCEPART_ <> "" Then %>
                    <select class="custom-select custom-select-sm select_data" name ="CustCode" width="100%" id ="kcepart">
                        <option value="">CUSTOMER CODE</option>
                    <% sql0 = " SELECT CUSTCODE FROM [FGMGR].[dbo].[PACKTRAN] Where CUSTCODE = '"&CUSTCODE&"' " &_
                              " Group by CUSTCODE"
                        set row = db.execute(sql0)
                       while not row.eof %>
                         <option value="<%=row("CUSTCODE")%>" <% if CUSTCODE = row("CUSTCODE") then %> selected <% end if %>><%=row("CUSTCODE")%></option>
                         <% row.movenext
                          Wend %>
                        </select>
                   <% Else  %> 
                   <select class="custom-select custom-select-sm select_data" name ="CustCode"  <% If ID <> "" Then %> <% End if %> width="100%" id="show_select_data">
                      <option value="">CUSTOMER CODE</option> 
                    </select> 
                   <% End if %>
 
                  </div>
                  <div class="form-group col-md-3 mb-1">
                    <label>CUSTOMER PART</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="CustPart"
                      value="<%=CustPart%>"
                    />
                  </div>
                  <div class="form-group col-md-3 mb-1">
                    <label>SURFACE FINISH</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="Surface"
                      value="<%=Surface%>"
                    />
                  </div>
                  <div class="form-group col-md-3 mb-1">
                    <label>BOARD PROFILE</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="BoardProfile"
                      value="<%=BoardProfile%>"
                    />
                  </div>
                  <div class="form-group col-md-3 mb-1">
                    <label>LAYER COPPER  (Oz.)</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="LayerCopper"
                      value="<%=LayerCopper%>"
                    />
                  </div>
                  <div class="form-group col-md-3 mb-1">
                    <label>CORE</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="Core"
                      value="<%=Core%>"
                    />
                  </div>
                  </div>

                </div>
              </div>
              <div class="col-md-12 col-lg-12 col-xl-6 mb-2">
                <div class="card text-center text-white bg-warning border-warning">
                  <div class="card-header">
                    Laminate + Coper foil
                  </div> 
                  <div class="form-row p-1"> 
                    <div class="form-group col-md-4 mb-1">
                    <label>BRAND</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="LMCF_Brand"
                      value="<%=LMCF_Brand%>"
                    />
                  </div>
                  <div class="form-group col-md-4 mb-1">
                    <label>TG</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="LMCF_TG"
                      value="<%=LMCF_TG%>"
                    />
                  </div>
                  <div class="form-group col-md-4 mb-1">
                    <label>CU FOIL</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="LMCF_CuFoil"
                      value="<%=LMCF_CuFoil%>"
                    />
                  </div>
                  </div> 
                </div>
              </div>
              <div class="col-md-12 col-lg-12 col-xl-6 mb-2">
                <div class="card text-center text-white bg-secondary border-secondary">
                  <div class="card-header ">
                    FINISHED BOARD THK
                  </div> 
                  <div class="form-row p-1"> 
                    <div class="form-group col-md-4 mb-1">
                    <label>SPEC.</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="FSBT_Spec"
                      value="<%=FSBT_Spec%>"
                    />
                  </div>
                  <div class="form-group col-md-4 mb-1">
                    <label>MIN - MAX</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="FSBT_MinMax"
                      value="<%=FSBT_MinMax%>"
                    />
                  </div>
                  <div class="form-group col-md-4 mb-1">
                    <label>Unit</label>
                    <input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="FSBT_Unit"
                      value="<%=FSBT_Unit%>"
                    />
                  </div>
                  </div> 
                </div>
              </div>  
               
              <div class="col-md-12 col-lg-12 col-xl-6 mb-2">
                <div class="card text-center text-white bg-dark border-dark ">
                  <div class="card-header">
                    S/M
                  </div>   
                  <div class="form-row align-items-center p-1"> 
                   <div class="col-md-12">
                   <div class="row justify-content-center">
                      <div class="col-auto my-1">
                        <div class="custom-control custom-checkbox mr-sm-2"> 
                          <input type="checkbox" class="custom-control-input"  name="SM_CS" id="SM_CS" value="X" <% If  SM_CS ="X" Then response.Write("checked") Else response.Write("") End if %>>
                          <label class="custom-control-label" for="SM_CS">C/S</label>
                        </div>
                      </div>
                      <div class="col-auto my-1">
                        <div class="custom-control custom-checkbox mr-sm-2"> 
                          <input type="checkbox" class="custom-control-input"  name="SM_SS" id="SM_SS" value="X" <% If  SM_SS ="X" Then response.Write("checked") Else response.Write("") End if %>> 
                          <label class="custom-control-label" for="SM_SS">S/S</label>
                        </div>
                      </div> 
                      <div class="col-auto my-1">
                        <div class="custom-control custom-checkbox mr-sm-2"> 
                          <input type="checkbox" class="custom-control-input"  name="SM_NA" id="SM_NA" value="X" <% If  SM_NA ="X" Then response.Write("checked") Else response.Write("") End if %>> 
                          <label class="custom-control-label" for="SM_NA">N/A</label> 
                        </div>
                      </div>  
                    </div>
                  </div>     
                  <div class="col-md-6 mb-1">
                    <label>COLOR</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="SM_Color"
                      value="<%=SM_Color%>"
                    />
                  </div>
                  <div class=" col-md-6 mb-1">
                    <label>BRAND</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="SM_Brand"
                      value="<%=SM_Brand%>"
                    />
                  </div>

                  </div> 
                </div>
              </div>

              <div class="col-md-12 col-lg-12 col-xl-6 mb-2">
                <div class="card text-center text-white bg-info border-info">
                  <div class="card-header ">
                    LEGEND
                  </div> 
                  <div class="form-row align-items-center p-1"> 

                     <div class="col-md-12">
                       <div class="row justify-content-center">
                        <div class="col-auto my-1"> 
                          <div class="custom-control custom-checkbox mr-sm-2"> 
                            <input type="checkbox" class="custom-control-input" name="LP_CS" id="LP_CS"value="X" <% If  LP_CS ="X" Then response.Write("checked") Else response.Write("") End if %>>
                            <label class="custom-control-label" for="LP_CS">C/S</label> 
                          </div>
                        </div>
                        <div class="col-auto my-1"> 
                        <div class="custom-control custom-checkbox mr-sm-2">
                          <input type="checkbox" class="custom-control-input" id="LP_SS" name="LP_SS" value="X" <% If  LP_SS ="X" Then response.Write("checked") Else response.Write("") End if %>>
                          <label class="custom-control-label" for="LP_SS">S/S</label> 
                        </div>
                        </div>
                        <div class="col-auto my-1">
                        <div class="custom-control custom-checkbox mr-sm-2">
                            <input type="checkbox" class="custom-control-input" id="LP_NA" name="LP_NA" value="X" <% If  LP_NA ="X" Then response.Write("checked") Else response.Write("") End if %>>
                            <label class="custom-control-label" for="LP_NA">N/A</label> 
                          </div>
                        </div> 
                       </div>
                     </div> 
                  <div class="form-group col-md-6 mb-1">
                    <label>COLOR</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="LP_Color"
                      value="<%=LP_Color%>"
                    />
                  </div>
                  <div class="form-group col-md-6 mb-1">
                    <label>BRAND</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="LP_Brand"
                      value="<%=LP_Brand%>"
                    />
                  </div>
                  </div> 
                </div>
              </div>
              <div class="col-md-12 col-lg-12 col-xl-6 mb-2">
                <div class="card text-center text-white bg-secondary border-secondary">
                  <div class="card-header ">
                    CARBON INK			
                  </div> 
                  <div class="form-row p-1">   
                     <div class="col-md-12"> 
                      <div class="row justify-content-center">
                          <div class="col-auto my-1">
                          <div class="custom-control custom-checkbox mr-sm-2">
                            <input type="checkbox" class="custom-control-input"  name="CBI_CS" id="CBI_CS" value="X" <% If  CBI_CS ="X" Then response.Write("checked") Else response.Write("") End if %>>
                            <label class="custom-control-label" for="CBI_CS">C/S</label> 
                          </div>
                          </div>
                          <div class="col-auto my-1">
                          <div class="custom-control custom-checkbox mr-sm-2">
                            <input type="checkbox" class="custom-control-input" name="CBI_SS" id="CBI_SS" value="X" <% If  CBI_SS ="X" Then response.Write("checked") Else response.Write("") End if %>>
                            <label class="custom-control-label" for="CBI_SS">S/S</label> 
                          </div>
                          </div>
                            <div class="col-auto my-1">
                              <div class="custom-control custom-checkbox mr-sm-2">
                                <input type="checkbox" class="custom-control-input" name="CBI_NA" id="CBI_NA" value="X" <% If  CBI_NA ="X" Then response.Write("checked") Else response.Write("") End if %>>
                                <label class="custom-control-label" for="CBI_NA">N/A</label>  
                              </div>
                            </div>
                        </div>
                    </div> 
                 
                  <div class="form-group col-md-12 mb-1">
                    <label>BRAND</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="CBI_Brand"
                      value="<%=CBI_Brand%>"
                    />
                  </div>
                  </div> 
                </div>
              </div>

              <div class="col-md-12 col-lg-12 col-xl-6 mb-2">
                <div class="card text-center text-white bg-info border-info">
                  <div class="card-header ">
                    PELABLL 
                  </div> 
                  <div class="form-row p-1"> 
                    <div class="col-md-12"> 
                      <div class="row justify-content-center">
                          <div class="col-auto my-1">
                          <div class="custom-control custom-checkbox mr-sm-2">
                              <input type="checkbox" class="custom-control-input" name="PB_CS" id="PB_CS" value="X" <% If  PB_CS ="X" Then response.Write("checked") Else response.Write("") End if %>>
                              <label class="custom-control-label" for="PB_CS">C/S</label>  
                          </div>
                          </div>
                          <div class="col-auto my-1">
                            <div class="custom-control custom-checkbox mr-sm-2">
                              <input type="checkbox" class="custom-control-input" name="PB_SS" id="PB_SS"value="X" <% If  PB_SS ="X" Then response.Write("checked") Else response.Write("") End if %>>
                              <label class="custom-control-label" for="PB_SS">S/S</label> 
                            </div>
                          </div>
                          <div class="col-auto my-1">
                            <div class="custom-control custom-checkbox mr-sm-2">
                              <input type="checkbox" class="custom-control-input" name="PB_NA" id="PB_NA" value="X" <% If  PB_NA ="X" Then response.Write("checked") Else response.Write("") End if %>>
                              <label class="custom-control-label" for="PB_NA">N/A</label> 
                            </div>
                          </div>
                      </div>
                     </div> 
                      <div class="form-group col-md-6 mb-1">
                        <label>COLOR</label
                        ><input
                          type="text"
                          autocomplete="off"
                          class="form-control form-control-sm"
                          name="PB_Color"
                          value="<%=PB_Color%>"
                        />
                      </div>
                      <div class="form-group col-md-6 mb-1">
                        <label>BRAND</label
                        ><input
                          type="text"
                          autocomplete="off"
                          class="form-control form-control-sm"
                          name="PB_Brand"
                          value="<%=PB_Brand%>"
                        />
                      </div>
                  </div> 
                </div>
              </div>
              <div class="col-md-12 col-lg-12 col-xl-6 mb-2">
                <div class="card text-center text-white bg-dark border-dark">
                  <div class="card-header ">
                    UL LOGO			
                  </div> 
                  <div class="form-row p-1">
                    <div class="col-md-12"> 
                      <div class="row justify-content-center">
                          <div class="col-auto my-1">
                                <div class="custom-control custom-checkbox mr-sm-2">
                                  <input type="checkbox" class="custom-control-input" name="UL_CS" id="UL_CS" value="X" <% If  UL_CS ="X" Then response.Write("checked") Else response.Write("") End if %>>
                                  <label class="custom-control-label" for="UL_CS">C/S</label> 
                                </div>
                          </div>
                          <div class="col-auto my-1">
                            <div class="custom-control custom-checkbox mr-sm-2">
                              <input type="checkbox" class="custom-control-input" name="UL_SS" id="UL_SS" value="X" <% If  UL_SS ="X" Then response.Write("checked") Else response.Write("") End if %>>
                              <label class="custom-control-label" for="UL_SS">S/S</label> 
                            </div>
                        </div> 
                      </div>
                    </div> 
                  <div class="form-group col-md-6 mb-1">
                    <label>Print ON</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="UL_PrintOn"
                      value="<%=UL_PrintOn%>"
                    />
                  </div>
                  <div class="form-group col-md-6 mb-1">
                    <label>UL Logo</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="UL_Logo"
                      value="<%=UL_Logo%>"
                    />
                  </div>
                  </div> 
                </div>
              </div>

              <div class="col-md-12 col-lg-12 col-xl-6 mb-2">
                <div class="card text-center text-white bg-secondary border-secondary">
                  <div class="card-header ">
                    DATE CODE				
                  </div> 
                  <div class="form-row p-1">
                    <div class="col-md-12"> 
                      <div class="row justify-content-center">
                          <div class="col-auto my-1">
                            <div class="custom-control custom-checkbox mr-sm-2">
                              <input type="checkbox" class="custom-control-input" name="DC_CS" id="DC_CS" value="X" <% If  DC_CS ="X" Then response.Write("checked") Else response.Write("") End if %>>
                              <label class="custom-control-label" for="DC_CS">C/S</label> 
                            </div>
                          </div>
                          <div class="col-auto my-1">
                          <div class="custom-control custom-checkbox mr-sm-2">
                            <input type="checkbox" class="custom-control-input" name="DC_SS" id="DC_SS" value="X" <% If  DC_SS ="X" Then response.Write("checked") Else response.Write("") End if %>>
                            <label class="custom-control-label"for="DC_SS">S/S</label> 
                          </div>
                        </div>

                       </div>
                    </div> 
                  <div class="form-group col-md-6 mb-1">
                    <label>DATE CODE</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="DC_DC"
                      value="<%=DC_DC%>"
                    />
                  </div>
                  <div class="form-group col-md-6 mb-1">
                    <label>Print On</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="DC_PrintOn"
                      value="<%=DC_PrintOn%>"
                    />
                  </div>
                  </div> 
                </div>
              </div>
              <div class="col-md-12 col-lg-12 col-xl-4 mb-2">
                <div class="card text-center text-white bg-secondary border-secondary">
                  <div class="card-header">
                    ET<hr>
                  </div> 
                  <div class="form-row p-1"> 

                    <div class="col-md-12"> 
                      <div class="row justify-content-center">
                          <div class="col-auto mb-1">
                            <div class="custom-control custom-checkbox mr-sm-2">
                              <input type="checkbox" class="custom-control-input" name="ET_Edge" id="ET_Edge" value="X" <% If  ET_Edge ="X" Then response.Write("checked") Else response.Write("") End if %>>
                              <label class="custom-control-label" for="ET_Edge">Edge</label> 
                            </div>      
                          </div>
                          <div class="col-auto mb-1">
                          <div class="custom-control custom-checkbox mr-sm-2">
                    <input type="checkbox" class="custom-control-input" name="ET_Stamp" id="ET_Stamp" value="X" <% If  ET_Stamp ="X" Then response.Write("checked") Else response.Write("") End if %>>
                    <label class="custom-control-label" for="ET_Stamp">Stamp</label>
                  </div>      
                          </div>
                          <div class="col-auto mb-1"> 
                          <div class="custom-control custom-checkbox mr-sm-2">
                    <input type="checkbox" class="custom-control-input" name="ET_CS" id="ET_CS" value="X" <% If  ET_CS ="X" Then response.Write("checked") Else response.Write("") End if %>>
                    <label class="custom-control-label" for="ET_CS">C/S</label> 
                  </div>     
                          </div>
                          <div class="col-auto mb-1"> 
                          <div class="custom-control custom-checkbox mr-sm-2">
                    <input type="checkbox" class="custom-control-input" name="ET_SS" id="ET_SS" value="X" <% If  ET_SS ="X" Then response.Write("checked") Else response.Write("") End if %>>
                    <label class="custom-control-label" for="ET_SS">S/S</label>
                  </div>     
                          </div>
                       </div>
                      </div> 
                  </div>
                </div>
              </div> 
              <div class="col-md-12 col-lg-12 col-xl-5 mb-2">
                <div class="card text-center text-white bg-dark border-dark">
                  <div class="card-header">
                    KCE P/N/ CUSTOMER P/N บนบอร์ด
                  </div> 
                  <div class="form-row p-1"> 
                    <div class="form-group col-md-6 mb-1">
                    <label>CUST. (ON BOARD)</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="CustOnBoard"
                      value="<%=CustOnBoard%>"
                    />
                  </div>
                  <div class="form-group col-md-6 mb-1">
                    <label>KCE P/N (ON BORD)</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="KCEOnBoard"
                      value="<%=KCEOnBoard%>"
                    />
                  </div>
                  </div> 
                </div>
              </div>
              <div class="col-md-12 col-lg-6 col-xl-3 mb-2">
                <div class="card text-center text-white bg-info border-info">
                  <div class="card-header ">
                    D/C 
                  </div> 
                  <div class="form-row p-1"> 
                    <div class="form-group col-md-12 mb-1">
                    <label>D/C Control (Week)</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="DCControl"
                      value="<%=DCControl%>"
                    />
                  </div>
                  </div> 
                </div>
              </div>

              <div class="col-md-12 col-lg-6 col-xl-3 mb-2">
                <div class="card text-center text-white bg-info border-info">
                  <div class="card-header ">
                    STEP		
                  </div> 
                  <div class="form-row p-1"> 
                    <div class="col-md-6 col-lg-3"> 
                      <div class="row justify-content-center">
                          <div class="col-auto mb-1">
                            <div class="custom-control custom-checkbox mr-sm-2">
                                <input type="checkbox" class="custom-control-input" name="ST_Single" id="ST_Single" value="X" <% If  ST_Single ="X" Then response.Write("checked") Else response.Write("") End if %>>
                              <label class="custom-control-label" for="ST_Single">Single</label> 
                            </div> 
                          </div>
                          <div class="col-auto mb-1">
                          <div class="custom-control custom-checkbox mr-sm-2">
                            <input type="checkbox" class="custom-control-input" name="ST_Mulity" id="ST_Mulity" value="X" <% If  ST_Mulity ="X" Then response.Write("checked") Else response.Write("") End if %>>
                            <label class="custom-control-label" for="ST_Mulity">Mulity</label> 
                          </div>
                        </div> 
                      </div>
                    </div> 
                  <div class="form-group col-md-6 col-lg-9 mb-1"> 
                    <label>PCS</label>
                    <input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="ST_Pcs"
                      value="<%=ST_Pcs%>"
                    />
                  </div>
                  </div> 
                </div>
              </div>
              <div class="col-md-12 col-lg-12 col-xl-5 mb-2">
                <div class="card text-center text-white bg-secondary border-secondary">
                  <div class="card-header ">
                    X-OUT
                  </div> 
                  <div class="form-row p-1"> 
                    <div class="form-group col-md-3 mb-1">
                    <label>SCRAP</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="XO_Scrap"
                      value="<%=XO_Scrap%>"
                    />
                  </div>
                  <div class="form-group col-md-3 mb-1">
                    <label>Q'TY</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="XO_Qty"
                      value="<%=XO_Qty%>"
                    />
                  </div>
                  <div class="form-group col-md-3 mb-1">
                    <label>SC MARK</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="XO_SCMark"
                      value="<%=XO_SCMark%>"
                    />
                  </div>
                  <div class="form-group col-md-3 mb-1">
                    <label>MARK IDE</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="XO_MarkIDE"
                      value="<%=XO_MarkIDE%>"
                    />
                  </div>
                  </div> 
                </div>
              </div>

              <div class="col-md-12 col-lg-12 col-xl-4 mb-2">
                <div class="card text-center text-white bg-warning border-warning">
                  <div class="card-header ">
                    IONIC CONTAMINATION	
                  </div> 
                  <div class="form-row p-1"> 
                    <div class="form-group col-md-8 mb-1">
                    <label>IONIC</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="Ionic"
                      value="<%=Ionic%>"
                    />
                  </div> 
                  <div class="form-group col-md-4 mb-1">
                    <label>ugNacl/Sq.</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="UgNacl"
                      value="<%=UgNacl%>"
                    />
                  </div>
                  </div> 

                </div>
              </div>
              <div class="col-md-12 mb-2">
                <div class="card text-center text-white bg-secondary border-secondary">
                  <div class="card-header">
                    วิธีการแพ็ค (Packing Spec)		
                  </div> 
                  <div class="form-row p-1"> 

                    <div class="col-md-12"> 
                      <div class="row justify-content-center">
                          <div class="col-auto mb-1">
                          <div class="custom-control custom-checkbox mr-sm-2">
                              <input type="checkbox" class="custom-control-input" name="PS_OneWayBoard" id="PS_OneWayBoard" value="X" <% If  PS_OneWayBoard ="X" Then response.Write("checked") Else response.Write("") End if %>>
                              <label class="custom-control-label" for="PS_OneWayBoard">เรียงบอร์ดทางเดียว</label> 
                            </div>
                          </div>
                          <div class="col-auto mb-1">
                            <div class="custom-control custom-checkbox mr-sm-2">
                              <input type="checkbox" class="custom-control-input" name="PS_VacuumPackPE" id="PS_VacuumPackPE" value="X" <% If  PS_VacuumPackPE ="X" Then response.Write("checked") Else response.Write("") End if %>>
                              <label class="custom-control-label" for="PS_VacuumPackPE">Vacuum Pack (PE)</label> 
                            </div>
                          </div>
                        
                        <div class="col-auto mb-1">
                          <div class="custom-control custom-checkbox mr-sm-2">
                            <input type="checkbox" class="custom-control-input" name="PS_VacuumPackESD" id="PS_VacuumPackESD" value="X" <% If  PS_VacuumPackESD ="X" Then response.Write("checked") Else response.Write("") End if %>>
                            <label class="custom-control-label" for="PS_VacuumPackESD" >Vacuum Pack (ESD)</label>
                          </div> 
                        </div> 

                        <div class="col-auto mb-1">
                          <div class="custom-control custom-checkbox mr-sm-2">
                            <input type="checkbox" class="custom-control-input" name="PS_VacuumNylon" id="PS_VacuumNylon" value="X" <% If  PS_VacuumNylon ="X" Then response.Write("checked") Else response.Write("") End if %>>
                            <label class="custom-control-label" for="PS_VacuumNylon" >Vacuum Nylon</label>
                          </div> 
                        </div> 

                        <div class="col-auto mb-1">
                          <div class="custom-control custom-checkbox mr-sm-2">
                            <input type="checkbox" class="custom-control-input" name="PS_Aluminum" id="PS_Aluminum" value="X" <% If  PS_Aluminum ="X" Then response.Write("checked") Else response.Write("") End if %>>
                            <label class="custom-control-label" for="PS_Aluminum">Aluminum (MBB)</label> 
                          </div>
                        </div>
                        <div class="col-auto mb-1">
                          <div class="custom-control custom-checkbox mr-sm-2">
                            <input type="checkbox" class="custom-control-input" name="PS_Siliga" id="PS_Siliga" value="X" <% If  PS_Siliga ="X" Then response.Write("checked") Else response.Write("") End if %>>
                            <label class="custom-control-label" for="PS_Siliga">Siliga (MBB)</label>
                          </div>
                        </div>
                        <div class="col-auto mb-1">
                          <div class="custom-control custom-checkbox mr-sm-2">
                            <input type="checkbox" class="custom-control-input" name="PS_HIC" id="PS_HIC" value="X" <% If  PS_HIC ="X" Then response.Write("checked") Else response.Write("") End if %>>
                            <label class="custom-control-label" for="PS_HIC">HIC</label> 
                          </div>
                        </div>
                        <div class="col-auto mb-1">
                          <div class="custom-control custom-checkbox mr-sm-2">
                            <input type="checkbox" class="custom-control-input" name="PS_Others" id="PS_Others" value="X" <% If PS_Others ="X" Then response.Write("checked") Else response.Write("") End if %>>
                            <label class="custom-control-label" for="PS_Others">Others</label> 
                          </div>
                        </div>
                       </div>
                    </div>
  
                  <div class="form-group col-md-3 mb-1"> 
                    <label>Q'ty pack</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="PS_QtyPack"
                      value="<%=PS_QtyPack%>"
                    />
                  </div>
                  <div class="form-group col-md-3 mb-1">
                    <label >กรณี Double Pack (PE)</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="PS_DoublePackPE"
                      value="<%=PS_DoublePackPE%>"
                    />
                  </div>
                  
                  <div class="form-group col-md-3 mb-1">
                    <label>กรณี Double Pack (ESD)</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="PS_DoublePackESD"
                      value="<%=PS_DoublePackESD%>"
                    />
                  </div>
                  
                  <div class="form-group col-md-3 mb-1">
                    <label>กรณี Double Pack</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="PS_DoublePackNylon"
                      value="<%=PS_DoublePackNylon%>"
                    />
                  </div>
                  
                  <div class="form-group col-md-3 mb-1">
                    <label>กรณี Double Pack (MBB)</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="PS_DoublePackMBB"
                      value="<%=PS_DoublePackMBB%>"
                    />
                  </div>
                  <div class="form-group col-md-3 mb-1">
                    <label>ห่อ Sulphur free</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="PS_SulphurFree"
                      value="<%=PS_SulphurFree%>"
                    />
                  </div>
                  
                  <div class="form-group col-md-3 mb-1">
                    <label>REMARK SILICA GEL</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="PS_RemarkSILICAGEL"
                      value="<%=PS_RemarkSILICAGEL%>"
                    />
                  </div>
                  
                  <div class="form-group col-md-3 mb-1">
                    <label>% HIC (10-60%)</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="PS_HIC10"
                      value="<%=PS_HIC10%>"
                    />
                  </div> 
                  <div class="form-group col-md-12 mb-1">
                    <label>Others การบรรจุหีบห่อ (ไม่ใช่ Label)</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="PS_OthersRemark"
                      value="<%=PS_OthersRemark%>"
                    />
                  </div> 
                  </div> 
                </div>
              </div>

              <div class="col-md-12 col-lg-12 col-xl-12 mb-2">
                <div class="card text-center text-white bg-info border-info">
                  <div class="card-header ">
                    ลาเบลหน้าห่อ 
                  </div> 
                  <div class="form-row p-1"> 
                    <div class="col-md-12"> 
                      <div class="row justify-content-center">
                          <div class="col-auto mb-1">
                          <div class="custom-control custom-checkbox mr-sm-2">
                      <input type="checkbox" class="custom-control-input" name="PL_KCELabel" id="PL_KCELabel" value="X" <% If  PL_KCELabel ="X" Then response.Write("checked") Else response.Write("") End if %>>
                    <label class="custom-control-label" for="PL_KCELabel">KCET LABEL</label> 
                  </div>
                          </div>
                          <div class="col-auto mb-1">
                          <div class="custom-control custom-checkbox mr-sm-2">
                    <input type="checkbox" class="custom-control-input" name="PL_Rohs6_6" id="PL_Rohs6_6" value="X" <% If  PL_Rohs6_6 ="X" Then response.Write("checked") Else response.Write("") End if %>>
                    <label class="custom-control-label" for="PL_Rohs6_6">RoHS</label> 
                  </div>
                          </div>
                          <div class="col-auto mb-1">
                          <div class="custom-control custom-checkbox mr-sm-2">
                    <input type="checkbox" class="custom-control-input" name="PL_CustLabel" id="PL_CustLabel" value="X" <% If  PL_CustLabel ="X" Then response.Write("checked") Else response.Write("") End if %>>
                    <label class="custom-control-label" for="PL_CustLabel">Customer Label</label> 
                  </div>
                          </div>
                          <div class="col-auto mb-1">
                          <div class="custom-control custom-checkbox mr-sm-2">
                    <input type="checkbox" class="custom-control-input" name="PL_Other" id="PL_Other"value="X" <% If  PL_Other ="X" Then response.Write("checked") Else response.Write("") End if %>>
                    <label class="custom-control-label" for="PL_Other">Other</label> 
                  </div>
                          </div>
                           
                      </div>
                    </div> 
                  
                  <div class="form-group col-md-3 mb-1">
                    <label>ลาเบลพิเศษหน้าห่อ N/A = ไม่มีลาเบลพิเศษ</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="PL_SpecialLabel"
                      value="<%=PL_SpecialLabel%>"
                    />
                  </div> 
                  <div class="form-group col-md-3 mb-1">
                    <label>Special Label (หน้าห่อ)</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="PL_SpecialLabelRemark"
                      value="<%=PL_SpecialLabelRemark%>"
                    />
                  </div>
                  <div class="form-group col-md-3 mb-1">
                    <label>RoHS compliance ลาเบลหน้าห่อ</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="PL_Rohs"
                      value="<%=PL_Rohs%>"
                    />
                  </div>
                  <div class="form-group col-md-3 mb-1">
                    <label>REMARK จำนวนต่อห่อ [ 0 = ไม่มีอะไรพิเศษ]</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="PL_PackingRemark"
                      value="<%=PL_PackingRemark%>"
                    />
                  </div>
                  </div> 
                </div>
              </div>
              <div class="col-md-12 col-lg-12 col-xl-3 mb-2">
                <div class="card text-center text-white bg-dark border-dark">
                  <div class="card-header ">
                    กล่อง  
                  </div> 
                  <div class="form-row p-1"> 
                    <div class="form-group col-md-12 mb-1">
                    <label>การบบรรจุกล่อง (MATERIAL)</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="CT_Material"
                      value="<%=CT_Material%>"
                    />
                  </div>
                  <div class="form-group col-md-12 mb-1">
                    <label>น้ำหนัก (WEIGHT)</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="CT_Weight"
                      value="<%=CT_Weight%>"
                    />
                  </div>
                  </div> 
                </div>
              </div>

              <div class="col-md-12 col-lg-12 col-xl-9 mb-2">
                <div class="card text-center text-white bg-info border-info">
                  <div class="card-header ">
                    ลาเบลหน้ากล่อง 
                  </div>  
                    <div class="form-row p-1"> 
                    <div class="col-md-12"> 
                      <div class="row justify-content-center">
                          <div class="col-auto mb-1">
                            <div class="custom-control custom-checkbox mr-sm-2">
                              <input type="checkbox" class="custom-control-input" name="CL_KCELabel" id="CL_KCELabel" value="X" <% If  CL_KCELabel ="X" Then response.Write("checked") Else response.Write("") End if %>>
                              <label class="custom-control-label" for="CL_KCELabel">KCET LABEL</label> 
                            </div>
                          </div>
                          <div class="col-auto mb-1">
                           <div class="custom-control custom-checkbox mr-sm-2">
                            <input type="checkbox" class="custom-control-input" name="CL_Rohs6_6" id="CL_Rohs6_6" value="X" <% If  CL_Rohs6_6 ="X" Then response.Write("checked") Else response.Write("") End if %>>
                            <label class="custom-control-label" for="CL_Rohs6_6" >Rohs6/6</label> 
                          </div>
                        </div>
                        <div class="col-auto mb-1">
                          <div class="custom-control custom-checkbox mr-sm-2">
                            <input type="checkbox" class="custom-control-input" name="CL_CustLabel" id="CL_CustLabel" value="X" <% If  CL_CustLabel ="X" Then response.Write("checked") Else response.Write("") End if %>>
                            <label class="custom-control-label" for="CL_CustLabel">CUSTOMER LABEL</label> 
                          </div>
                        </div>
                        <div class="col-auto mb-1">
                          <div class="custom-control custom-checkbox mr-sm-2">
                              <input type="checkbox" class="custom-control-input" name="CL_Other" id="CL_Other" value="X" <% If  CL_Other ="X" Then response.Write("checked") Else response.Write("") End if %>>
                            <label class="custom-control-label" for="CL_Other">OTHER</label> 
                          </div>
                        </div>
                      </div>
                      <hr>
                     </div> 
                  <div class="form-group col-md-4 mb-1">
                    <label>ลาเบลพิเศษหน้ากล่อง</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="CL_SpecialLabel"
                      value="<%=CL_SpecialLabel%>"
                    />
                  </div> 
                    
                  <div class="form-group col-md-4 mb-1">
                    <label>SPECIAL LABEL (หน้ากล่อง)</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="CL_SpecialLabelRemark"
                      value="<%=CL_SpecialLabelRemark%>"
                    />
                  </div>
                  <div class="form-group col-md-4 mb-1">
                    <label>RoHS Compliance ลาเบลหน้ากล่อง</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="CL_Rohs"
                      value="<%=CL_Rohs%>"
                    />
                  </div>
                  </div> 
                </div>
              </div>
              <div class="col-md-12 mb-2">
                <div class="card text-center text-white bg-secondary border-secondary">
                  <div class="card-header ">
                    QA-CUS-01  
                  </div> 
                  <div class="form-row p-1"> 
                    <div class="col-md-12"> 
                      <div class="row justify-content-center">
                          <div class="col-auto mb-1">
                          <div class="custom-control custom-checkbox mr-sm-2">
                                <input type="checkbox" class="custom-control-input" name="QA_CofC" id="QA_CofC" value="X" <% If  QA_CofC ="X" Then response.Write("checked") Else response.Write("") End if %>>
                                <label class="custom-control-label" for="QA_CofC">C of C</label> 
                          </div>
                          </div>
                          <div class="col-auto mb-1">
                          <div class="custom-control custom-checkbox mr-sm-2">
                            <input type="checkbox" class="custom-control-input" name="QA_INS_FA" id="QA_INS_FA" value="X" <% If  QA_INS_FA ="X" Then response.Write("checked") Else response.Write("") End if %>>
                            <label class="custom-control-label" for="QA_INS_FA">INS./FA REPORT</label> 
                          </div>
                          </div>
                          <div class="col-auto mb-1">
                          <div class="custom-control custom-checkbox mr-sm-2">
                            <input type="checkbox" class="custom-control-input" name="QA_PHOTO" id="QA_PHOTO" value="X" <% If  QA_PHOTO ="X" Then response.Write("checked") Else response.Write("") End if %>>
                            <label class="custom-control-label" for="QA_PHOTO">PHOTO REPORT</label> 
                          </div>
                        </div>
                        <div class="col-auto mb-1">
                          <div class="custom-control custom-checkbox mr-sm-2">
                            <input type="checkbox" class="custom-control-input" name="QA_MICRO" id="QA_MICRO" value="X" <% If  QA_MICRO ="X" Then response.Write("checked") Else response.Write("") End if %>>
                            <label class="custom-control-label" for="QA_MICRO">MICRO.</label> 
                          </div>
                        </div>
                        <div class="col-auto mb-1">
                          <div class="custom-control custom-checkbox mr-sm-2">
                            <input type="checkbox" class="custom-control-input" name="QA_SampleBoardTest" id="QA_SampleBoardTest" value="X" <% If  QA_SampleBoardTest ="X" Then response.Write("checked") Else response.Write("") End if %>>
                            <label class="custom-control-label" for="QA_SampleBoardTest">Sample board</label> 
                          </div>
                        </div>
                        <div class="col-auto mb-1">
                          <div class="custom-control custom-checkbox mr-sm-2">
                            <input type="checkbox" class="custom-control-input" name="QA_SampleBoardNotTest" id="QA_SampleBoardNotTest" value="X" <% If  QA_SampleBoardNotTest ="X" Then response.Write("checked") Else response.Write("") End if %>>
                            <label class="custom-control-label" for="QA_SampleBoardNotTest">Sample board</label> 
                          </div>
                        </div>
                        <div class="col-auto mb-1">
                          <div class="custom-control custom-checkbox mr-sm-2">
                            <input type="checkbox" class="custom-control-input" name="QA_PPAP" id="QA_PPAP" value="X" <% If  QA_PPAP ="X" Then response.Write("checked") Else response.Write("") End if %>>
                            <label class="custom-control-label" for="QA_PPAP">PPAP</label> 
                          </div>
                        </div>
                        <div class="col-auto mb-1">
                          <div class="custom-control custom-checkbox mr-sm-2">
                            <input type="checkbox" class="custom-control-input" name="QA_SPC" id="QA_SPC" value="X" <% If  QA_SPC ="X" Then response.Write("checked") Else response.Write("") End if %>>
                            <label class="custom-control-label" for="QA_SPC">SPC REPORT</label> 
                          </div>
                        </div> 
                        <div class="col-auto mb-1">
                          <div class="custom-control custom-checkbox mr-sm-2">
                            <input type="checkbox" class="custom-control-input" name="QA_Other" id="QA_Other" value="X" <% If  QA_Other ="X" Then response.Write("checked") Else response.Write("") End if %>>
                            <label class="custom-control-label" for="QA_Other">Others</label> 
                          </div>
                        </div>  
                          </div>
                        
                    </div> 
                  <div class="form-group col-md-4 mb-1">
                    <label>จำนวนชิ้น</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="QA_Pcs"
                      value="<%=QA_Pcs%>"
                    />
                  </div>
                  
                  <div class="form-group col-md-4 mb-1">
                    <label>TEST</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="QA_Test"
                      value="<%=QA_Test%>"
                    />
                  </div>
                  
                  <div class="form-group col-md-4 mb-1">
                    <label>NO TEST</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="QA_NotTest"
                      value="<%=QA_NotTest%>"
                    />
                  </div>
                  
                  <div class="form-group col-md-4 mb-1">
                    <label>Level 1, 2 or 3</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="QA_Level"
                      value="<%=QA_Level%>"
                    />
                  </div>
                  <div class="form-group col-md-4 mb-1">
                    <label >Solder  test report</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="QA_SolderTest"
                      value="<%=QA_SolderTest%>"
                    />
                  </div>
                
                  <div class="form-group col-md-4 mb-1">
                    <label>OTHER REQUIREMENT</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="QA_OtherRequirement"
                      value="<%=QA_OtherRequirement%>"
                    />
                  </div>
                  
                  </div> 
                </div>
              </div>
              <div class="col-md-12 mb-2">
                <div class="card text-center text-white bg-dark border-dark">
                  <div class="card-header ">
                    SPECIAL NOTE 
                  </div> 
                  <div class="form-row p-1"> 
                    <div class="form-group col-md-3 mb-1">
                    <label>REMARK : SPECIAL NOTE</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="QA_SpecialNote"
                      value="<%=QA_SpecialNote%>"
                    />
                  </div>
                  <div class="form-group col-md-3 mb-1">
                    <label>CHECK LIST UPDATE DATE</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="DocCheck_CUTHK"
                      value="<%=DocCheck_CUTHK%>"
                    />
                  </div>
                  <div class="form-group col-md-3 mb-1">
                    <label>RECORD SPEC BY</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="DocCheck_SMTHK"
                      value="<%=DocCheck_SMTHK%>"
                    />
                  </div>
                  <div class="form-group col-md-3 mb-1">
                    <label>APPROVE BY</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="DocCheck__SFTHK"
                      value="<%=DocCheck__SFTHK%>"
                    />
                  </div>
                  
                  </div> 
                </div>
              </div>
              <div class="col-md-12 mb-2">
                <div class="card text-center text-white bg-info border-info">
                  <div class="card-header ">
                    ตรงช่อง DATE CODE 
                  </div> 
                  <div class="form-row p-1"> 
                    <div class="form-group col-md-8 mb-1">
                    <label>REMARK :ตรงช่อง DATE CODE</label >
                    <input name="RemarkDC" type="text" autocomplete="off" class="form-control form-control-sm" value="<%=RemarkDC%>">  
                  </div>
                  <div class="form-group col-md-2 mb-1">
                    <label>PREPREG</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="Prepreg"
                      value="<%=Prepreg%>"
                    />
                  </div>
                  <div class="form-group col-md-2 mb-1">
                    <label>Laminate</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="Laminate"
                      value="<%=Laminate%>"
                    />
                  </div>
                  </div> 
                </div>
              </div>

              <div class="col-md-12 mb-2">
                <div class="card text-center text-white bg-dark border-dark">
                  <div class="card-header ">
                    REMARK DOCUMENT SUBMISSION					
                  </div> 
                  <div class="form-row p-1"> 
                    <div class="form-group col-md-2 mb-1">
                    <label>COFC</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="RD_COFC"
                      value="<%=RD_COFC%>"
                    />
                  </div>
                  <div class="form-group col-md-2 mb-1">
                    <label>INS/FA</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="RD_INS_FA"
                      value="<%=RD_INS_FA%>"
                    />
                  </div>
                  <div class="form-group col-md-2 mb-1">
                    <label>SPC</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="RD_SPC"
                      value="<%=RD_SPC%>"
                    />
                  </div>
                  <div class="form-group col-md-2 mb-1">
                    <label>PPAP</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="RD_PPAP"
                      value="<%=RD_PPAP%>"
                    />
                  </div>
                  <div class="form-group col-md-2 mb-1">
                    <label>PHOTO</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="RD_PHOTO"
                      value="<%=RD_PHOTO%>"
                    />
                  </div>
                  <div class="form-group col-md-2 mb-1">
                    <label>SOLDER REPORT</label
                    ><input
                      type="text"
                      autocomplete="off"
                      class="form-control form-control-sm"
                      name="RD_SOLDER"
                      value="<%=RD_SOLDER%>"
                    />
                  </div>
                  </div> 
                </div>
              </div>
        
            </div>  
                <div class="modal-footer">
                <% If ID ="" Then %>
                    <button
                    type="submit"
                    id="smt_loading"
                    class="btn btn-primary"
                  >
                    SAVE
                  </button>
               <% Else %> 
                  <button
                    type="submit"
                    id="smt_loading"
                    class="btn btn-primary"
                  >
                    EDIT
                  </button>
                  <button
                    type="button"
                    id="delete"
                    class="btn btn-danger"
                  >
                   DELETE
                  </button>
               <%  End if %>
                  
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <div id="inspection-list" class="mt-5 container"></div>
    </div> 
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.bundle.min.js"></script>
    <script src="../js/select2.full.js"></script>
    <script src="../js/sweetalert2@11.js"></script>
    <script src="js.js"></script> 
    <script>
    $(".select_data").select2();
    </script>
  </body>
</html>

 