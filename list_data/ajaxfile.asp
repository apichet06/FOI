 <!--#include file = "../lib/aspJSON1.19.asp"--> 
 <!--#include file = "../backend/connection/db.asp"-->
 
<%
Response.CodePage = 65001    
Response.CharSet = "utf-8"
draw    = request.form("draw")
start   = request.form("start")
length  = request.form("length")
search  = request.form("search[value]")



Function strClean (strtoclean)
Dim objRegExp, outputStr
Set objRegExp = New Regexp

objRegExp.IgnoreCase = True
objRegExp.Global = True
objRegExp.Pattern = "((?![a-zA-Z0-9]).)+"
outputStr = objRegExp.Replace(strtoclean, ".")

objRegExp.Pattern = "\-+"
outputStr = objRegExp.Replace(outputStr, " ")

strClean = outputStr
End Function


sql0 = "Select count(*)as Count_FOI FROM [Base_Process].[dbo].[FOI_Master]"
set rs0 = db.execute(sql0)
 If start = 0 Then
 page = ""&start&" and "&length&""
 i = 1
 Else
 page = ""&start&" and "&(start) + (length-1)&" "
 i = start+1
 End if
If search = "" Then
sql = "SELECT * FROM [Base_Process].[dbo].[FOI_Master] Where ID between "&page&"" 
Else
page = ""&start&" and "&(start) + (length-1)&" "
 i = start+1
sql = "SELECT * FROM [Base_Process].[dbo].[FOI_Master] Where KCEPART like '%"&search&"%' or ID between "&page&" " 
End if

set rs = db.execute(sql)

i = i
do while not rs.eof 
    a1 = a1 & "["
    a1 = a1 & """"& i &""","
    a1 = a1 & """"&rs("KCEPART")&""","
                a1 = a1 & """"&rs("REV")&""","
                a1 = a1 & """"&rs("CustCode")&""","
                a1 = a1 & """"&rs("CustPart")&""","
                a1 = a1 & """"&rs("Surface")&""","
                a1 = a1 & """"&rs("BoardProfile")&""","
                a1 = a1 & """"&rs("LayerCopper")&""","
                a1 = a1 & """"&rs("Core")&""","
                a1 = a1 & """"&rs("LMCF_Brand")&""","
                a1 = a1 & """"&rs("LMCF_TG")&""","
                a1 = a1 & """"&rs("LMCF_CuFoil")&""","
                a1 = a1 & """"&rs("FSBT_Spec")&""","
                a1 = a1 & """"&rs("FSBT_MinMax")&""","
                a1 = a1 & """"&rs("FSBT_Unit")&""","
                a1 = a1 & """"&rs("SM_CS")&""","
                a1 = a1 & """"&rs("SM_SS")&""","
                a1 = a1 & """"&rs("SM_NA")&""","
                a1 = a1 & """"&rs("SM_Color")&""","
                a1 = a1 & """"&rs("SM_Brand")&""","
                a1 = a1 & """"&rs("LP_CS")&""","
                a1 = a1 & """"&rs("LP_SS")&""","
                a1 = a1 & """"&rs("LP_NA")&""","
                a1 = a1 & """"&rs("LP_Color")&""","
                a1 = a1 & """"&rs("LP_Brand")&""","
                a1 = a1 & """"&rs("CBI_CS")&""","
                a1 = a1 & """"&rs("CBI_SS")&""","
                a1 = a1 & """"&rs("CBI_NA")&""","
                a1 = a1 & """"&rs("CBI_Brand")&""","
                a1 = a1 & """"&rs("PB_CS")&""","
                a1 = a1 & """"&rs("PB_SS")&""","
                a1 = a1 & """"&rs("PB_NA")&""","
                a1 = a1 & """"&rs("PB_Color")&""","
                a1 = a1 & """"&rs("PB_Brand")&""","
                a1 = a1 & """"&rs("UL_CS")&""","
                a1 = a1 & """"&rs("UL_SS")&""","
                a1 = a1 & """"&rs("UL_PrintOn")&""","
                a1 = a1 & """"&strClean(rs("UL_Logo"))&""","
                a1 = a1 & """"&rs("DC_CS")&""","
                a1 = a1 & """"&rs("DC_SS")&""","
                a1 = a1 & """"&rs("DC_DC")&""","
                a1 = a1 & """"&rs("DC_PrintOn")&""","
                a1 = a1 & """"&rs("ET_Edge")&""","
                a1 = a1 & """"&rs("ET_Stamp")&""","
                a1 = a1 & """"&rs("ET_CS")&""","
                a1 = a1 & """"&rs("ET_SS")&""","
                a1 = a1 & """"&rs("CustOnBoard")&""","
                a1 = a1 & """"&rs("KCEOnBoard")&""","
                a1 = a1 & """"&rs("DCControl")&""","
                a1 = a1 & """"&rs("ST_Single")&""","
                a1 = a1 & """"&rs("ST_Mulity")&""","
                a1 = a1 & """"&rs("ST_Pcs")&""","
                a1 = a1 & """"&rs("XO_Scrap")&""","
                a1 = a1 & """"&rs("XO_Qty")&""","
                a1 = a1 & """"&rs("XO_SCMark")&""","
                a1 = a1 & """"&rs("XO_MarkIDE")&""","
                a1 = a1 & """"&rs("Ionic")&""","
                a1 = a1 & """"&rs("UgNacl")&""","
                a1 = a1 & """"&rs("PS_QtyPack")&""","
                a1 = a1 & """"&rs("PS_OneWayBoard")&""","
                a1 = a1 & """"&rs("PS_VacuumPackPE")&""","
                a1 = a1 & """"&rs("PS_DoublePackPE")&""","
                a1 = a1 & """"&rs("PS_VacuumPackESD")&""","
                a1 = a1 & """"&rs("PS_DoublePackESD")&""","
                a1 = a1 & """"&rs("PS_VacuumNylon")&""","
                a1 = a1 & """"&rs("PS_DoublePackNylon")&""","
                a1 = a1 & """"&rs("PS_Aluminum")&""","
                a1 = a1 & """"&rs("PS_DoublePackMBB")&""","
                a1 = a1 & """"&rs("PS_SulphurFree")&""","
                a1 = a1 & """"&rs("PS_Siliga")&""","
                a1 = a1 & """"&rs("PS_RemarkSILICAGEL")&""","
                a1 = a1 & """"&rs("PS_HIC")&""","
                a1 = a1 & """"&rs("PS_HIC10")&""","
                a1 = a1 & """"&rs("PS_Others")&""","
                a1 = a1 & """"&rs("PS_OthersRemark")&""","
                a1 = a1 & """"&rs("PL_KCELabel")&""","
                a1 = a1 & """"&rs("PL_Rohs6/6")&""","
                a1 = a1 & """"&rs("PL_CustLabel")&""","
                a1 = a1 & """"&rs("PL_SpecialLabel")&""","
                a1 = a1 & """"&rs("PL_Other")&""","
                a1 = a1 & """"&rs("PL_SpecialLabelRemark")&""","
                a1 = a1 & """"&rs("PL_Rohs")&""","
                a1 = a1 & """"&rs("PL_PackingRemark")&""","
                a1 = a1 & """"&rs("CT_Material")&""","
                a1 = a1 & """"&rs("CT_Weight")&""","
                a1 = a1 & """"&rs("CL_KCELabel")&""","
                a1 = a1 & """"&rs("CL_Rohs6/6")&""","
                a1 = a1 & """"&rs("CL_CustLabel")&""","
                a1 = a1 & """"&rs("CL_SpecialLabel")&""","
                a1 = a1 & """"&rs("CL_Other")&""","
                a1 = a1 & """"&rs("CL_SpecialLabelRemark")&""","
                a1 = a1 & """"&rs("CL_Rohs")&""","
                a1 = a1 & """"&rs("QA_CofC")&""","
                a1 = a1 & """"&rs("QA_INS_FA")&""","
                a1 = a1 & """"&rs("QA_PHOTO")&""","
                a1 = a1 & """"&rs("QA_MICRO")&""","
                a1 = a1 & """"&rs("QA_Pcs")&""","
                a1 = a1 & """"&rs("QA_SampleBoardTest")&""","
                a1 = a1 & """"&rs("QA_Test")&""","
                a1 = a1 & """"&rs("QA_SampleBoardNotTest")&""","
                a1 = a1 & """"&rs("QA_NotTest")&""","
                a1 = a1 & """"&rs("QA_PPAP")&""","
                a1 = a1 & """"&rs("QA_Level")&""","
                a1 = a1 & """"&rs("QA_SolderTest")&""","
                a1 = a1 & """"&rs("QA_SPC")&""","
                a1 = a1 & """"&rs("QA_Other")&""","
                a1 = a1 & """"&rs("QA_OtherRequirement")&""","
                a1 = a1 & """"&rs("QA_SpecialNote")&""","
                a1 = a1 & """"&rs("DocCheck_CUTHK")&""","
                a1 = a1 & """"&rs("DocCheck_SMTHK")&""","
                a1 = a1 & """"&rs("DocCheck__SFTHK")&""","
                a1 = a1 & """"&rs("RemarkDC")&""","
                a1 = a1 & """"&rs("Prepreg")&""","
                a1 = a1 & """"&rs("Laminate")&""","
                a1 = a1 & """"&rs("RD_COFC")&""","
                a1 = a1 & """"&rs("RD_INS/FA")&""","
                a1 = a1 & """"&rs("RD_SPC")&""","
                a1 = a1 & """"&rs("RD_PPAP")&""","
                a1 = a1 & """"&rs("RD_PHOTO")&""","
                a1 = a1 & """"&rs("RD_SOLDER")&""","
                a1 = a1 & """"&rs("UpdateDate")&""","
                a1 = a1 & """"&strClean(rs("UpdateBy"))&""","
                a1 = a1 & """"&rs("Status")&""","
                a1 = a1 & """"&rs("DeleteBy")&""" "
    a1 = a1 & "],"

   i = i + 1
   rs.movenext
 
 loop
a1 = a1 & "LastArray"

a1 = Replace(a1,"],LastArray","]")

Array_Data = ""
Array_Data  =  "["
Array_Data = Array_Data & a1
Array_Data = Array_Data & "]"

Json =""
Json = Json & "{"
 
Json = Json & """draw"": "& draw & ","
Json = Json & """recordsTotal"": "& length &"," 
Json = Json & """recordsFiltered"": "& rs0("Count_FOI") &"," 
Json = Json & """data"": " 
Json = Json & Array_Data
Json = Json & "}"
 
Response.Write Json
%>

 