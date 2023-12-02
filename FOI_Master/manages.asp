<!--#include file = "../lib/aspJSON1.19.asp"-->
<!--#include file = "../backend/connection/db.asp"-->
<% 
ID = Request.Form("ID")
KCEPART= Request.Form("KCEPART")
REV= Request.Form("REV")
CustCode= Request.Form("CustCode")
CustPart= Request.Form("CustPart")
Surface= Request.Form("Surface")
BoardProfile= Request.Form("BoardProfile")
LayerCopper= Request.Form("LayerCopper")
Core= Request.Form("Core")
LMCF_Brand= Request.Form("LMCF_Brand")
LMCF_TG= Request.Form("LMCF_TG")
LMCF_CuFoil= Request.Form("LMCF_CuFoil")
FSBT_Spec= Request.Form("FSBT_Spec")
FSBT_MinMax= Request.Form("FSBT_MinMax")
FSBT_Unit= Request.Form("FSBT_Unit")
SM_CS= Request.Form("SM_CS")
SM_SS= Request.Form("SM_SS")
SM_NA= Request.Form("SM_NA")
SM_Color= Request.Form("SM_Color")
SM_Brand= Request.Form("SM_Brand")
LP_CS= Request.Form("LP_CS")
LP_SS= Request.Form("LP_SS")
LP_NA= Request.Form("LP_NA")
LP_Color= Request.Form("LP_Color")
LP_Brand= Request.Form("LP_Brand")
CBI_CS= Request.Form("CBI_CS")
CBI_SS= Request.Form("CBI_SS")
CBI_NA= Request.Form("CBI_NA")
CBI_Brand= Request.Form("CBI_Brand")
PB_CS= Request.Form("PB_CS")
PB_SS= Request.Form("PB_SS")
PB_NA= Request.Form("PB_NA")
PB_Color= Request.Form("PB_Color")
PB_Brand= Request.Form("PB_Brand")
UL_CS= Request.Form("UL_CS")
UL_SS= Request.Form("UL_SS")
UL_PrintOn= Request.Form("UL_PrintOn")
UL_Logo= Request.Form("UL_Logo")
DC_CS= Request.Form("DC_CS")
DC_SS= Request.Form("DC_SS")
DC_DC= Request.Form("DC_DC")
DC_PrintOn= Request.Form("DC_PrintOn")
ET_Edge= Request.Form("ET_Edge")
ET_Stamp= Request.Form("ET_Stamp")
ET_CS= Request.Form("ET_CS")
ET_SS= Request.Form("ET_SS")
CustOnBoard= Request.Form("CustOnBoard")
KCEOnBoard= Request.Form("KCEOnBoard")
DCControl= Request.Form("DCControl")
ST_Single= Request.Form("ST_Single")
ST_Mulity= Request.Form("ST_Mulity")
ST_Pcs= Request.Form("ST_Pcs")
XO_Scrap= Request.Form("XO_Scrap")
XO_Qty= Request.Form("XO_Qty")
XO_SCMark= Request.Form("XO_SCMark")
XO_MarkIDE= Request.Form("XO_MarkIDE")
Ionic= Request.Form("Ionic")
UgNacl= Request.Form("UgNacl")
PS_QtyPack= Request.Form("PS_QtyPack")
PS_OneWayBoard= Request.Form("PS_OneWayBoard")
PS_VacuumPackPE= Request.Form("PS_VacuumPackPE")
PS_DoublePackPE= Request.Form("PS_DoublePackPE")
PS_VacuumPackESD= Request.Form("PS_VacuumPackESD")
PS_DoublePackESD= Request.Form("PS_DoublePackESD")
PS_VacuumNylon= Request.Form("PS_VacuumNylon")
PS_DoublePackNylon= Request.Form("PS_DoublePackNylon")
PS_Aluminum= Request.Form("PS_Aluminum")
PS_DoublePackMBB= Request.Form("PS_DoublePackMBB")
PS_SulphurFree= Request.Form("PS_SulphurFree")
PS_Siliga= Request.Form("PS_Siliga")
PS_RemarkSILICAGEL= Request.Form("PS_RemarkSILICAGEL")
PS_HIC= Request.Form("PS_HIC")
PS_HIC10= Request.Form("PS_HIC10")
PS_Others= Request.Form("PS_Others")
PS_OthersRemark= Request.Form("PS_OthersRemark")
PL_KCELabel= Request.Form("PL_KCELabel")
PL_Rohs6_6= Request.Form("PL_Rohs6_6")
PL_CustLabel= Request.Form("PL_CustLabel")
PL_SpecialLabel= Request.Form("PL_SpecialLabel")
PL_Other= Request.Form("PL_Other")
PL_SpecialLabelRemark= Request.Form("PL_SpecialLabelRemark")
PL_Rohs= Request.Form("PL_Rohs")
PL_PackingRemark= Request.Form("PL_PackingRemark")
CT_Material= Request.Form("CT_Material")
CT_Weight= Request.Form("CT_Weight")
CL_KCELabel= Request.Form("CL_KCELabel")
CL_Rohs6_6= Request.Form("CL_Rohs6_6")
CL_CustLabel= Request.Form("CL_CustLabel")
CL_SpecialLabel= Request.Form("CL_SpecialLabel")
CL_Other= Request.Form("CL_Other")
CL_SpecialLabelRemark= Request.Form("CL_SpecialLabelRemark")
CL_Rohs= Request.Form("CL_Rohs")
QA_CofC= Request.Form("QA_CofC")
QA_INS_FA= Request.Form("QA_INS_FA")
QA_PHOTO= Request.Form("QA_PHOTO")
QA_MICRO= Request.Form("QA_MICRO")
QA_Pcs= Request.Form("QA_Pcs")
QA_SampleBoardTest= Request.Form("QA_SampleBoardTest")
QA_Test= Request.Form("QA_Test")
QA_SampleBoardNotTest= Request.Form("QA_SampleBoardNotTest")
QA_NotTest= Request.Form("QA_NotTest")
QA_PPAP= Request.Form("QA_PPAP")
QA_Level= Request.Form("QA_Level")
QA_SolderTest= Request.Form("QA_SolderTest")
QA_SPC= Request.Form("QA_SPC")
QA_Other= Request.Form("QA_Other")
QA_OtherRequirement= Request.Form("QA_OtherRequirement")
QA_SpecialNote= Request.Form("QA_SpecialNote")
DocCheck_CUTHK= Request.Form("DocCheck_CUTHK")
DocCheck_SMTHK= Request.Form("DocCheck_SMTHK")
DocCheck__SFTHK= Request.Form("DocCheck__SFTHK")
RemarkDC= Request.Form("RemarkDC")
Prepreg= Request.Form("Prepreg")
Laminate= Request.Form("Laminate")
RD_COFC= Request.Form("RD_COFC")
RD_INS_FA= Request.Form("RD_INS_FA")
RD_SPC= Request.Form("RD_SPC")
RD_PPAP= Request.Form("RD_PPAP")
RD_PHOTO= Request.Form("RD_PHOTO")
RD_SOLDER= Request.Form("RD_SOLDER")
 
username=Request.Cookies("LOGON_USER") 
 
insert_update=Request.Form("insert_update")
del=Request.Form("del")
If insert_update = "insert_update" Then 

            If ID ="" Then
                ' insert 
            
            sql0 = "SELECT count(KCEPART)as Count_KCEPART FROM [Base_Process].[dbo].[FOI_Master] WHERE KCEPART ='"&KCEPART&"' AND CustCode = '"&CustCode&"' AND Status ='Y' "
               rs = db.Execute(sql0) 
            If rs("Count_KCEPART") >="1" Then
                 response.write("4")
            Else
                
             
                sql ="INSERT INTO  [Base_Process].[dbo].[FOI_Master] (KCEPART, REV, CustCode, CustPart, Surface,BoardProfile, LayerCopper, Core, " &_
                        " LMCF_Brand, LMCF_TG, LMCF_CuFoil, FSBT_Spec,FSBT_MinMax, FSBT_Unit, SM_CS, SM_SS, SM_NA, SM_Color, SM_Brand, LP_CS, LP_SS,LP_NA, LP_Color, LP_Brand,CBI_CS, CBI_SS, CBI_NA," &_ 
                        "  CBI_Brand, PB_CS,PB_SS, PB_NA, PB_Color, PB_Brand, UL_CS, UL_SS, UL_PrintOn, UL_Logo, DC_CS,DC_SS, DC_DC, DC_PrintOn, ET_Edge, ET_Stamp, ET_CS, ET_SS, CustOnBoard, " &_ 
                        " KCEOnBoard, DCControl, ST_Single, ST_Mulity, ST_Pcs, XO_Scrap, XO_Qty,XO_SCMark, XO_MarkIDE, Ionic, UgNacl, PS_QtyPack, PS_OneWayBoard,PS_VacuumPackPE, PS_DoublePackPE, " &_
                        " PS_VacuumPackESD, PS_DoublePackESD,PS_VacuumNylon, PS_DoublePackNylon," &_
                        " PS_Aluminum, PS_DoublePackMBB,PS_SulphurFree, PS_Siliga, PS_RemarkSILICAGEL, PS_HIC, PS_HIC10, " &_
                        " PS_Others,PS_OthersRemark, PL_KCELabel, [PL_Rohs6/6] ,PL_CustLabel,PL_SpecialLabel,PL_Other,PL_SpecialLabelRemark,PL_Rohs,PL_PackingRemark ,"&_
                        " CT_Material,CT_Weight, CL_KCELabel, [CL_Rohs6/6], CL_CustLabel, CL_SpecialLabel, CL_Other,CL_SpecialLabelRemark, CL_Rohs, QA_CofC, QA_INS_FA, " &_ 
                        " QA_PHOTO, QA_MICRO, QA_Pcs,QA_SampleBoardTest, QA_Test, QA_SampleBoardNotTest, QA_NotTest, QA_PPAP,QA_Level, QA_SolderTest, QA_SPC, QA_Other," &_
                        " QA_OtherRequirement, QA_SpecialNote,DocCheck_CUTHK, DocCheck_SMTHK, DocCheck__SFTHK, RemarkDC, Prepreg, Laminate,RD_COFC, [RD_INS/FA], RD_SPC, RD_PPAP," &_ 
                        " RD_PHOTO, RD_SOLDER,Status,UpdateBy" &_
                        " )VALUES('"&KCEPART&"', '"&REV&"', '"&CustCode&"', '"&CustPart&"', " &_
                        "'"&Surface&"', '"&BoardProfile&"', '"&LayerCopper&"', '"&Core&"', " &_ 
                        "'"&LMCF_Brand&"', '"&LMCF_TG&"', '"&LMCF_CuFoil&"', '"&FSBT_Spec&"'," &_ 
                        "'"&FSBT_MinMax&"', '"&FSBT_Unit&"', '"&SM_CS&"', '"&SM_SS&"', '"&SM_NA&"'," &_ 
                        "'"&SM_Color&"', '"&SM_Brand&"', '"&LP_CS&"', '"&LP_SS&"', '"&LP_NA&"'," &_ 
                        "'"&LP_Color&"', '"&LP_Brand&"', '"&CBI_CS&"', '"&CBI_SS&"', '"&CBI_NA&"', " &_
                        "'"&CBI_Brand&"', '"&PB_CS&"', '"&PB_SS&"', '"&PB_NA&"'," &_ 			
                        "'"&PB_Color&"', '"&PB_Brand&"', '"&UL_CS&"', '"&UL_SS&"', '"&UL_PrintOn&"'," &_ 			
                        "'"&UL_Logo&"', '"&DC_CS&"', '"&DC_SS&"', '"&DC_DC&"', '"&DC_PrintOn&"'," &_ 			
                        "'"&ET_Edge&"', '"&ET_Stamp&"', '"&ET_CS&"', '"&ET_SS&"', '"&CustOnBoard&"'," &_ 			
                        "'"&KCEOnBoard&"', '"&DCControl&"', '"&ST_Single&"', '"&ST_Mulity&"',"&_ 			
                        "'"&ST_Pcs&"', '"&XO_Scrap&"', '"&XO_Qty&"', '"&XO_SCMark&"', '"&XO_MarkIDE&"'," &_ 			
                        "'"&Ionic&"', '"&UgNacl&"', '"&PS_QtyPack&"', '"&PS_OneWayBoard&"'," &_ 			
                        "'"&PS_VacuumPackPE&"', '"&PS_DoublePackPE&"', '"&PS_VacuumPackESD&"'," &_ 			
                        "'"&PS_DoublePackESD&"', '"&PS_VacuumNylon&"', '"&PS_DoublePackNylon&"', "  &_ 
                        "'"&PS_Aluminum&"', '"&PS_DoublePackMBB&"', '"&PS_SulphurFree&"',"&_ 
                        "'"&PS_Siliga&"', '"&PS_RemarkSILICAGEL&"', '"&PS_HIC&"', '"&PS_HIC10&"', " &_ 
                        "'"&PS_Others&"', '"&PS_OthersRemark&"', '"&PL_KCELabel&"', '"&PL_Rohs6_6&"', "&_ 
                        "'"&PL_CustLabel&"', '"&PL_SpecialLabel&"', '"&PL_Other&"', '"&PL_SpecialLabelRemark&"','"&PL_Rohs&"', '"&PL_PackingRemark&"', " &_ 
                        "'"&CT_Material&"', '"&CT_Weight&"', '"&CL_KCELabel&"', '"&CL_Rohs6_6&"'," &_ 
                        "'"&CL_CustLabel&"', '"&CL_SpecialLabel&"', '"&CL_Other&"',"&_ 
                        "'"&CL_SpecialLabelRemark&"', '"&CL_Rohs&"', '"&QA_CofC&"', '"&QA_INS_FA&"'," &_ 
                        "'"&QA_PHOTO&"', '"&QA_MICRO&"', '"&QA_Pcs&"', '"&QA_SampleBoardTest&"'," &_ 
                        "'"&QA_Test&"', '"&QA_SampleBoardNotTest&"', '"&QA_NotTest&"', '"&QA_PPAP&"'," &_ 
                        "'"&QA_Level&"', '"&QA_SolderTest&"', '"&QA_SPC&"', '"&QA_Other&"'," &_ 
                        "'"&QA_OtherRequirement&"', '"&QA_SpecialNote&"', '"&DocCheck_CUTHK&"'," &_ 
                        "'"&DocCheck_SMTHK&"', '"&DocCheck__SFTHK&"', '"&RemarkDC&"', '"&Prepreg&"'," &_ 
                        "'"&Laminate&"', '"&RD_COFC&"', '"&RD_INS_FA&"', '"&RD_SPC&"', '"&RD_PPAP&"'," &_ 
                        "'"&RD_PHOTO&"', '"&RD_SOLDER&"','Y','"&username&"')"
 
                    on error resume next

                        db.Execute(sql)
            
                        if err<>0 Then
                        Response.Write (Err.Description)   
                        response.write("0")
                        Else
                        response.write("3")
                        End if
               End if 

            Else
                ' update
                sql ="UPDATE [Base_Process].[dbo].[FOI_Master] SET REV='"&REV&"'," &_
                        "CustCode='"&CustCode&"'," &_
                        "CustPart='"&CustPart&"'," &_
                        "Surface='"&Surface&"'," &_
                        "BoardProfile='"&BoardProfile&"'," &_
                        "LayerCopper='"&LayerCopper&"'," &_
                        "Core='"&Core&"'," &_
                        "LMCF_Brand='"&LMCF_Brand&"'," &_
                        "LMCF_TG='"&LMCF_TG&"'," &_
                        "LMCF_CuFoil='"&LMCF_CuFoil&"'," &_
                        "FSBT_Spec='"&FSBT_Spec&"'," &_
                        "FSBT_MinMax='"&FSBT_MinMax&"'," &_
                        "FSBT_Unit='"&FSBT_Unit&"'," &_
                        "SM_CS='"&SM_CS&"'," &_
                        "SM_SS='"&SM_SS&"'," &_
                        "SM_NA='"&SM_NA&"'," &_
                        "SM_Color='"&SM_Color&"'," &_
                        "SM_Brand='"&SM_Brand&"'," &_
                        "LP_CS='"&LP_CS&"'," &_
                        "LP_SS='"&LP_SS&"'," &_
                        "LP_NA='"&LP_NA&"'," &_
                        "LP_Color='"&LP_Color&"'," &_
                        "LP_Brand='"&LP_Brand&"'," &_
                        "CBI_CS='"&CBI_CS&"'," &_
                        "CBI_SS='"&CBI_SS&"'," &_
                        "CBI_NA='"&CBI_NA&"'," &_
                        "CBI_Brand='"&CBI_Brand&"'," &_
                        "PB_CS='"&PB_CS&"'," &_
                        "PB_SS='"&PB_SS&"'," &_
                        "PB_NA='"&PB_NA&"'," &_
                        "PB_Color='"&PB_Color&"'," &_
                        "PB_Brand='"&PB_Brand&"'," &_
                        "UL_CS='"&UL_CS&"'," &_
                        "UL_SS='"&UL_SS&"'," &_
                        "UL_PrintOn='"&UL_PrintOn&"'," &_
                        "UL_Logo='"&UL_Logo&"'," &_
                        "DC_CS='"&DC_CS&"'," &_
                        "DC_SS='"&DC_SS&"'," &_
                        "DC_DC='"&DC_DC&"'," &_
                        "DC_PrintOn='"&DC_PrintOn&"'," &_
                        "ET_Edge='"&ET_Edge&"'," &_
                        "ET_Stamp='"&ET_Stamp&"'," &_
                        "ET_CS='"&ET_CS&"'," &_
                        "ET_SS='"&ET_SS&"'," &_
                        "CustOnBoard='"&CustOnBoard&"'," &_
                        "KCEOnBoard='"&KCEOnBoard&"'," &_
                        "DCControl='"&DCControl&"'," &_
                        "ST_Single='"&ST_Single&"'," &_
                        "ST_Mulity='"&ST_Mulity&"'," &_
                        "ST_Pcs='"&ST_Pcs&"'," &_
                        "XO_Scrap='"&XO_Scrap&"'," &_
                        "XO_Qty='"&XO_Qty&"'," &_
                        "XO_SCMark='"&XO_SCMark&"'," &_
                        "XO_MarkIDE='"&XO_MarkIDE&"'," &_
                        "Ionic='"&Ionic&"'," &_
                        "UgNacl='"&UgNacl&"'," &_
                        "PS_QtyPack='"&PS_QtyPack&"'," &_
                        "PS_OneWayBoard='"&PS_OneWayBoard&"'," &_
                        "PS_VacuumPackPE='"&PS_VacuumPackPE&"'," &_
                        "PS_DoublePackPE='"&PS_DoublePackPE&"'," &_
                        "PS_VacuumPackESD='"&PS_VacuumPackESD&"'," &_
                        "PS_DoublePackESD='"&PS_DoublePackESD&"'," &_
                        "PS_VacuumNylon='"&PS_VacuumNylon&"'," &_
                        "PS_DoublePackNylon='"&PS_DoublePackNylon&"'," &_
                        "PS_Aluminum='"&PS_Aluminum&"'," &_
                        "PS_DoublePackMBB='"&PS_DoublePackMBB&"'," &_
                        "PS_SulphurFree='"&PS_SulphurFree&"'," &_
                        "PS_Siliga='"&PS_Siliga&"'," &_
                        "PS_RemarkSILICAGEL='"&PS_RemarkSILICAGEL&"'," &_
                        "PS_HIC='"&PS_HIC&"'," &_
                        "PS_HIC10='"&PS_HIC10&"'," &_
                        "PS_Others='"&PS_Others&"'," &_
                        "PS_OthersRemark='"&PS_OthersRemark&"'," &_
                        "PL_KCELabel='"&PL_KCELabel&"'," &_
                        "[PL_Rohs6/6]='"&PL_Rohs6_6&"'," &_
                        "PL_CustLabel='"&PL_CustLabel&"'," &_
                        "PL_SpecialLabel='"&PL_SpecialLabel&"'," &_
                        "PL_Other='"&PL_Other&"'," &_
                        "PL_SpecialLabelRemark='"&PL_SpecialLabelRemark&"'," &_
                        "PL_Rohs='"&PL_Rohs&"'," &_
                        "PL_PackingRemark='"&PL_PackingRemark&"'," &_
                        "CT_Material='"&CT_Material&"'," &_
                        "CT_Weight='"&CT_Weight&"'," &_
                        "CL_KCELabel='"&CL_KCELabel&"'," &_
                        "[CL_Rohs6/6]='"&CL_Rohs6_6&"'," &_
                        "CL_CustLabel='"&CL_CustLabel&"'," &_
                        "CL_SpecialLabel='"&CL_SpecialLabel&"'," &_
                        "CL_Other='"&CL_Other&"'," &_
                        "CL_SpecialLabelRemark='"&CL_SpecialLabelRemark&"'," &_
                        "CL_Rohs='"&CL_Rohs&"'," &_
                        "QA_CofC='"&QA_CofC&"'," &_
                        "QA_INS_FA='"&QA_INS_FA&"'," &_
                        "QA_PHOTO='"&QA_PHOTO&"'," &_
                        "QA_MICRO='"&QA_MICRO&"'," &_
                        "QA_Pcs='"&QA_Pcs&"'," &_
                        "QA_SampleBoardTest='"&QA_SampleBoardTest&"'," &_
                        "QA_Test='"&QA_Test&"'," &_
                        "QA_SampleBoardNotTest='"&QA_SampleBoardNotTest&"'," &_
                        "QA_NotTest='"&QA_NotTest&"'," &_
                        "QA_PPAP='"&QA_PPAP&"'," &_
                        "QA_Level='"&QA_Level&"'," &_
                        "QA_SolderTest='"&QA_SolderTest&"'," &_
                        "QA_SPC='"&QA_SPC&"'," &_
                        "QA_Other='"&QA_Other&"'," &_
                        "QA_OtherRequirement='"&QA_OtherRequirement&"'," &_
                        "QA_SpecialNote='"&QA_SpecialNote&"'," &_
                        "DocCheck_CUTHK='"&DocCheck_CUTHK&"'," &_
                        "DocCheck_SMTHK='"&DocCheck_SMTHK&"'," &_
                        "DocCheck__SFTHK='"&DocCheck__SFTHK&"'," &_
                        "RemarkDC='"&RemarkDC&"'," &_
                        "Prepreg='"&Prepreg&"'," &_
                        "Laminate='"&Laminate&"'," &_
                        "RD_COFC='"&RD_COFC&"'," &_
                        "[RD_INS/FA]='"&RD_INS_FA&"'," &_
                        "RD_SPC='"&RD_SPC&"'," &_
                        "RD_PPAP='"&RD_PPAP&"'," &_
                        "RD_PHOTO='"&RD_PHOTO&"'," &_
                        "RD_SOLDER='"&RD_SOLDER&"'," &_ 
                        "UpdateBy = '"&username&"' " &_
                         "WHERE ID = '"&ID&"' "
                
                on error resume next
'"UpdateDate ='"&NOW()&"'," &_ 
                    db.Execute(sql)

                    if err<>0 Then
                    Response.Write (Err.Description)    
                    response.write("0")
                    Else
                    response.write("2")
                    End if

            End if

    ElseIF del = "delete" Then

    sql = "update [Base_Process].[dbo].[FOI_Master] SET Status = 'N', DeleteBy='"&username&"' Where ID = '"&ID&"' "
        
        on error resume next
    
            db.Execute(sql)
    
            if err<>0 Then
            response.Write(sql)
            response.write("0")
            Else
            response.write("1")
            End if
    End if
 
%>