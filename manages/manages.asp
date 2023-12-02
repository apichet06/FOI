<!--#include file = "../lib/aspJSON1.19.asp"-->
<!--#include file = "../backend/connection/db.asp"-->
<% username=Request.Cookies("LOGON_USER") 
txt_CustName =Request.Form("txt_CustName")
txt_CartonNum =Request.Form("txt_CartonNum")
txt_type = Request.Form("txt_type")
txt_custcode=Request.Form("txt_custcode")
txt_kcepart=Request.Form("txt_kcepart")
plant= "3000"
txt_Shipment_date=Request.Form("txt_Shipment_date")
txt_invoice_no=Request.Form("txt_invoice_no")
txt_wo_lot=Request.Form("txt_wo_lot")
txt_mi_issue=Request.Form("txt_mi_issue")
txt_copper_thk=Request.Form("txt_copper_thk")
txt_sm_thk=Request.Form("txt_sm_thk")
txt_finish_surface=Request.Form("txt_finish_surface")
txt_hole_size=Request.Form("txt_hole_size")
txt_line_width=Request.Form("txt_line_width")
txt_dimension_frofile=Request.Form("txt_dimension_frofile")
txt_soderability=Request.Form("txt_soderability")
txt_ionic=Request.Form("txt_ionic")
txt_others=Request.Form("txt_others")
txt_QTYSHIP=Request.Form("txt_QTYSHIP")
rbt_SMSide=Request.Form("rbt_SMSide")
rbt_SMColor=Request.Form("rbt_SMColor")
rbt_SMBrand=Request.Form("rbt_SMBrand")
rbt_LPSide=Request.Form("rbt_LPSide")
rbt_LPColor=Request.Form("rbt_LPColor")
rbt_LPBrand=Request.Form("rbt_LPBrand")
rbt_CBISide=Request.Form("rbt_CBISide")
rbt_CBIColor=Request.Form("rbt_CBIColor")
rbt_PBSide=Request.Form("rbt_PBSide")
rbt_PBColor=Request.Form("rbt_PBColor")
rbt_PBBrand=Request.Form("rbt_PBBrand")
rbt_ULSide=Request.Form("rbt_ULSide")
rbt_ULLogo=Request.Form("rbt_ULLogo")
rbt_DCSide=Request.Form("rbt_DCSide")
txt_DCMarking=Request.Form("txt_DCMarking")
txt_ETMark=Request.Form("txt_ETMark")
rbt_ETSide=Request.Form("rbt_ETSide")
rbt_CustOnBoard=Request.Form("rbt_CustOnBoard")
rbt_KCEOnBoard=Request.Form("rbt_KCEOnBoard")
rbt_Surface=Request.Form("rbt_Surface")
txt_DCControl=Request.Form("txt_DCControl")
rbt_Step=Request.Form("rbt_Step")
rbt_XOScrap=Request.Form("rbt_XOScrap")
rbt_XOSCMark=Request.Form("rbt_XOSCMark")
rbt_BoardProfile=Request.Form("rbt_BoardProfile")
txt_QTYPACKAGE=Request.Form("txt_QTYPACKAGE")
rbt_PS_QtyPack=Request.Form("rbt_PS_QtyPack")
rbt_PS_OneWayBoard=Request.Form("rbt_PS_OneWayBoard")
rbt_PS_VacuumPackPE=Request.Form("rbt_PS_VacuumPackPE")
rbt_PS_VacuumPackESD=Request.Form("rbt_PS_VacuumPackESD")
rbt_PS_VacuumNylon=Request.Form("rbt_PS_VacuumNylon")
rbt_PS_Aluminum=Request.Form("rbt_PS_Aluminum")
rbt_PS_SulphurFree=Request.Form("rbt_PS_SulphurFree")
rbt_PS_RemarkSILICAGEL=Request.Form("rbt_PS_RemarkSILICAGEL")
rbt_PS_HIC=Request.Form("rbt_PS_HIC")
rbt_PS_Others=Request.Form("rbt_PS_Others")
rbt_PL_KCELabel=Request.Form("rbt_PL_KCELabel")
rbt_PL_CustPart=Request.Form("rbt_PL_CustPart")
rbt_PL_CustLabel=Request.Form("rbt_PL_CustLabel")
rbt_PL_Rohs=Request.Form("rbt_PL_Rohs")
rbt_PL_SpecialLabelRemark=Request.Form("rbt_PL_SpecialLabelRemark")
txt_TQYCarton=Request.Form("txt_TQYCarton")
txt_CT_Material=Request.Form("txt_CT_Material")
txt_CT_Weight=Request.Form("txt_CT_Weight")
txt_CT_QTY=Request.Form("txt_CT_QTY")
rbt_CL_KCEPART=Request.Form("rbt_CL_KCEPART")
rbt_CL_CustPart=Request.Form("rbt_CL_CustPart")
rbt_CL_CustLabel=Request.Form("rbt_CL_CustLabel")
rbt_CL_Rohs=Request.Form("rbt_CL_Rohs")
rbt_CL_SpecialLabelRemark=Request.Form("rbt_CL_SpecialLabelRemark")
txt_CL_SAMPLING=Request.Form("txt_CL_SAMPLING")
rbt_QA_CofC=Request.Form("rbt_QA_CofC")
rbt_QA_INS_FA=Request.Form("rbt_QA_INS_FA")
rbt_QA_SolderTest=Request.Form("rbt_QA_SolderTest")
rbt_QA_PHOTO=Request.Form("rbt_QA_PHOTO")
rbt_QA_SPC=Request.Form("rbt_QA_SPC")
rbt_QA_MICRO=Request.Form("rbt_QA_MICRO")
rbt_QA_SampleBoardTest=Request.Form("rbt_QA_SampleBoardTest")
rbt_QA_SampleBoardNotTest=Request.Form("rbt_QA_SampleBoardNotTest")
rbt_QA_PPAP=Request.Form("rbt_QA_PPAP")
rbt_QA_Other=Request.Form("rbt_QA_Other")
txt_DCSHIP=Request.Form("txt_DCSHIP")

update_date =  (Year(NOW()) &"-"& Month(NOW()) &"-"& day(NOW()) &" "& Time)

insert=Request.Form("insert")
 
If insert = "insert" Then 
    
    sql = "SELECT count(txt_CartonNum) as count_cartion FROM [Base_Process].[dbo].[FOI_FinalOuting] WHERE  txt_CartonNum = '"& txt_CartonNum &"' and txt_type ='"&txt_type&"' "
        set rs = db.Execute(sql)
         
 If  rs("count_cartion") >= "1" Then
  
     sql = "UPDATE [Base_Process].[dbo].[FOI_FinalOuting] Set " &_
        "txt_type='"&txt_type&"'," &_
        "txt_CustName='"&txt_CustName&"'," &_
        "txt_custcode='"&txt_custcode&"'," &_
        "txt_kcepart='"&txt_kcepart&"'," &_
        "plant='"&plant&"'," &_
        "txt_Shipment_date='"&txt_Shipment_date&"'," &_
        "txt_invoice_no='"&txt_invoice_no&"'," &_
        "txt_wo_lot='"&txt_wo_lot&"',"  &_
        "txt_mi_issue='"&txt_mi_issue&"',"  &_
        "txt_copper_thk='"&txt_copper_thk&"',"  &_
        "txt_sm_thk='"&txt_sm_thk&"',"  &_
        "txt_finish_surface='"&txt_finish_surface&"',"  &_
        "txt_hole_size='"&txt_hole_size&"',"  &_
        "txt_line_width='"&txt_line_width&"',"  &_
        "txt_dimension_frofile='"&txt_dimension_frofile&"',"  &_
        "txt_soderability='"&txt_soderability&"',"  &_
        "txt_ionic='"&txt_ionic&"',"  &_
        "txt_others='"&txt_others&"',"  &_
        "txt_QTYSHIP='"&txt_QTYSHIP&"',"  &_
        "rbt_SMSide='"&rbt_SMSide&"',"  &_
        "rbt_SMColor='"&rbt_SMColor&"',"  &_
        "rbt_SMBrand='"&rbt_SMBrand&"',"  &_
        "rbt_LPSide='"&rbt_LPSide&"',"  &_
        "rbt_LPColor='"&rbt_LPColor&"',"  &_
        "rbt_LPBrand='"&rbt_LPBrand&"',"  &_
        "rbt_CBISide='"&rbt_CBISide&"',"  &_
        "rbt_CBIColor='"&rbt_CBIColor&"',"  &_
        "rbt_PBSide='"&rbt_PBSide&"',"  &_
        "rbt_PBColor='"&rbt_PBColor&"',"  &_
        "rbt_PBBrand='"&rbt_PBBrand&"',"  &_
        "rbt_ULSide='"&rbt_ULSide&"',"  &_
        "rbt_ULLogo='"&rbt_ULLogo&"',"  &_
        "rbt_DCSide='"&rbt_DCSide&"',"  &_
        "txt_DCMarking='"&txt_DCMarking&"',"  &_
        "txt_ETMark='"&txt_ETMark&"',"  &_
        "rbt_ETSide='"&rbt_ETSide&"',"  &_
        "rbt_CustOnBoard='"&rbt_CustOnBoard&"',"  &_
        "rbt_KCEOnBoard='"&rbt_KCEOnBoard&"',"  &_
        "rbt_Surface='"&rbt_Surface&"',"  &_
        "txt_DCControl='"&txt_DCControl&"',"  &_
        "rbt_Step='"&rbt_Step&"',"  &_
        "rbt_XOScrap='"&rbt_XOScrap&"',"  &_
        "rbt_XOSCMark='"&rbt_XOSCMark&"',"  &_
        "rbt_BoardProfile='"&rbt_BoardProfile&"',"  &_
        "txt_QTYPACKAGE='"&txt_QTYPACKAGE&"',"  &_
        "rbt_PS_QtyPack='"&rbt_PS_QtyPack&"',"  &_
        "rbt_PS_OneWayBoard='"&rbt_PS_OneWayBoard&"',"  &_
        "rbt_PS_VacuumPackPE='"&rbt_PS_VacuumPackPE&"',"  &_
        "rbt_PS_VacuumPackESD='"&rbt_PS_VacuumPackESD&"',"  &_
        "rbt_PS_VacuumNylon='"&rbt_PS_VacuumNylon&"',"  &_
        "rbt_PS_Aluminum='"&rbt_PS_Aluminum&"',"  &_
        "rbt_PS_SulphurFree='"&rbt_PS_SulphurFree&"',"  &_
        "rbt_PS_RemarkSILICAGEL='"&rbt_PS_RemarkSILICAGEL&"',"  &_
        "rbt_PS_HIC='"&rbt_PS_HIC&"',"  &_
        "rbt_PS_Others='"&rbt_PS_Others&"',"  &_
        "rbt_PL_KCELabel='"&rbt_PL_KCELabel&"',"  &_
        "rbt_PL_CustPart='"&rbt_PL_CustPart&"',"  &_
        "rbt_PL_CustLabel='"&rbt_PL_CustLabel&"',"  &_
        "rbt_PL_Rohs='"&rbt_PL_Rohs&"',"  &_
        "rbt_PL_SpecialLabelRemark='"&rbt_PL_SpecialLabelRemark&"',"  &_
        "txt_TQYCarton='"&txt_TQYCarton&"',"  &_
        "txt_CT_Material='"&txt_CT_Material&"',"  &_
        "txt_CT_Weight='"&txt_CT_Weight&"',"  &_
        "txt_CT_QTY='"&txt_CT_QTY&"',"  &_
        "rbt_CL_KCEPART='"&rbt_CL_KCEPART&"',"  &_
        "rbt_CL_CustPart='"&rbt_CL_CustPart&"',"  &_
        "rbt_CL_CustLabel='"&rbt_CL_CustLabel&"',"  &_
        "rbt_CL_Rohs='"&rbt_CL_Rohs&"',"  &_
        "rbt_CL_SpecialLabelRemark='"&rbt_CL_SpecialLabelRemark&"',"  &_
        "txt_CL_SAMPLING='"&txt_CL_SAMPLING&"',"  &_
        "rbt_QA_CofC='"&rbt_QA_CofC&"',"  &_
        "rbt_QA_INS_FA='"&rbt_QA_INS_FA&"',"  &_
        "rbt_QA_SolderTest='"&rbt_QA_SolderTest&"',"  &_
        "rbt_QA_PHOTO='"&rbt_QA_PHOTO&"',"  &_
        "rbt_QA_SPC='"&rbt_QA_SPC&"',"  &_
        "rbt_QA_MICRO='"&rbt_QA_MICRO&"',"  &_
        "rbt_QA_SampleBoardTest='"&rbt_QA_SampleBoardTest&"',"  &_
        "rbt_QA_SampleBoardNotTest='"&rbt_QA_SampleBoardNotTest&"',"  &_
        "rbt_QA_PPAP='"&rbt_QA_PPAP&"',"  &_
        "rbt_QA_Other='"&rbt_QA_Other&"',"  &_
        "txt_DCSHIP='"&txt_DCSHIP&"',"  &_
        "update_date='"&update_date&"',"  &_
        "updateBy='"&username&"' WHERE txt_CartonNum = '"&txt_CartonNum&"' AND  txt_type ='"&txt_type&"'"  
     
 Else
      
        sql ="INSERT INTO [Base_Process].[dbo].[FOI_FinalOuting] (txt_CartonNum,txt_CustName,txt_type,txt_custcode," &_
        " txt_kcepart, plant, txt_Shipment_date, txt_invoice_no, txt_wo_lot," &_
        " txt_mi_issue, txt_copper_thk, txt_sm_thk, txt_finish_surface," &_
        " txt_hole_size, txt_line_width, txt_dimension_frofile, txt_soderability," &_
        " txt_ionic, txt_others, txt_QTYSHIP, rbt_SMSide, rbt_SMColor, rbt_SMBrand," &_
        " rbt_LPSide, rbt_LPColor, rbt_LPBrand, rbt_CBISide, rbt_CBIColor, rbt_PBSide," &_
        " rbt_PBColor, rbt_PBBrand, rbt_ULSide, rbt_ULLogo, rbt_DCSide, txt_DCMarking," &_
        " txt_ETMark, rbt_ETSide, rbt_CustOnBoard, rbt_KCEOnBoard, rbt_Surface," &_
        " txt_DCControl, rbt_Step, rbt_XOScrap, rbt_XOSCMark, rbt_BoardProfile," &_
        " txt_QTYPACKAGE, rbt_PS_QtyPack, rbt_PS_OneWayBoard, rbt_PS_VacuumPackPE," &_
        " rbt_PS_VacuumPackESD, rbt_PS_VacuumNylon, rbt_PS_Aluminum, rbt_PS_SulphurFree," &_
        " rbt_PS_RemarkSILICAGEL,rbt_PS_HIC, rbt_PS_Others, rbt_PL_KCELabel," &_
        " rbt_PL_CustPart,rbt_PL_CustLabel, rbt_PL_Rohs, rbt_PL_SpecialLabelRemark," &_
        " txt_TQYCarton,txt_CT_Material, txt_CT_Weight, txt_CT_QTY, rbt_CL_KCEPART," &_
        " rbt_CL_CustPart,rbt_CL_CustLabel, rbt_CL_Rohs, rbt_CL_SpecialLabelRemark," &_
        " txt_CL_SAMPLING,rbt_QA_CofC, rbt_QA_INS_FA, rbt_QA_SolderTest, rbt_QA_PHOTO," &_
        " rbt_QA_SPC,rbt_QA_MICRO, rbt_QA_SampleBoardTest, rbt_QA_SampleBoardNotTest," &_
        " rbt_QA_PPAP,rbt_QA_Other, txt_DCSHIP, updateBy,status)VALUES("&_
        " '"&txt_CartonNum&"','"&txt_CustName&"','"&txt_type&"','"&txt_custcode&"', '"&txt_kcepart&"','3000',"&_
        " '"&txt_Shipment_date&"','"&txt_invoice_no&"', '"&txt_wo_lot&"', '"&txt_mi_issue&"', "&_
        " '"&txt_copper_thk&"', '"&txt_sm_thk&"', '"&txt_finish_surface&"', "&_
        " '"&txt_hole_size&"', '"&txt_line_width&"', '"&txt_dimension_frofile&"', "&_
        " '"&txt_soderability&"', '"&txt_ionic&"', '"&txt_others&"', '"&txt_QTYSHIP&"', " &_
        " '"&rbt_SMSide&"', '"&rbt_SMColor&"', '"&rbt_SMBrand&"', '"&rbt_LPSide&"'," &_
        " '"&rbt_LPColor&"', '"&rbt_LPBrand&"', '"&rbt_CBISide&"', '"&rbt_CBIColor&"', " &_
        " '"&rbt_PBSide&"', '"&rbt_PBColor&"', '"&rbt_PBBrand&"', '"&rbt_ULSide&"', " &_
        " '"&rbt_ULLogo&"', '"&rbt_DCSide&"', '"&txt_DCMarking&"', '"&txt_ETMark&"', " &_
        " '"&rbt_ETSide&"', '"&rbt_CustOnBoard&"', '"&rbt_KCEOnBoard&"'," &_
        " '"&rbt_Surface&"', '"&txt_DCControl&"', '"&rbt_Step&"', '"&rbt_XOScrap&"', " &_
        " '"&rbt_XOSCMark&"', '"&rbt_BoardProfile&"', '"&txt_QTYPACKAGE&"'," &_
        " '"&rbt_PS_QtyPack&"', '"&rbt_PS_OneWayBoard&"', '"&rbt_PS_VacuumPackPE&"', " &_
        " '"&rbt_PS_VacuumPackESD&"', '"&rbt_PS_VacuumNylon&"', '"&rbt_PS_Aluminum&"', " &_
        " '"&rbt_PS_SulphurFree&"', '"&rbt_PS_HIC&"','"&rbt_PS_RemarkSILICAGEL&"'," &_
        " '"&rbt_PS_Others&"', '"&rbt_PL_KCELabel&"', '"&rbt_PL_CustPart&"'," &_
        " '"&rbt_PL_CustLabel&"', '"&rbt_PL_Rohs&"', '"&rbt_PL_SpecialLabelRemark&"', " &_
        " '"&txt_TQYCarton&"', '"&txt_CT_Material&"', '"&txt_CT_Weight&"'," &_
        " '"&txt_CT_QTY&"', '"&rbt_CL_KCEPART&"', '"&rbt_CL_CustPart&"'," &_
        " '"&rbt_CL_CustLabel&"', '"&rbt_CL_Rohs&"', '"&rbt_CL_SpecialLabelRemark&"', " &_
        " '"&txt_CL_SAMPLING&"', '"&rbt_QA_CofC&"', '"&rbt_QA_INS_FA&"', " &_
        " '"&rbt_QA_SolderTest&"', '"&rbt_QA_PHOTO&"', '"&rbt_QA_SPC&"', " &_
        " '"&rbt_QA_MICRO&"', '"&rbt_QA_SampleBoardTest&"'," &_
        " '"&rbt_QA_SampleBoardNotTest&"', '"&rbt_QA_PPAP&"', '"&rbt_QA_Other&"', " &_
        " '"&txt_DCSHIP&"','"&username&"','Y')"
 End if
        on error resume next

        db.Execute(sql)
 
        if err<>0 Then
        'response.Write(sql)
        Response.Write (Err.Description)    
        response.write("0")
        Else
       
        response.write("3")
        End if


Else
    ' false
End if



%>
