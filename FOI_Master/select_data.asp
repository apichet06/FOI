<!--#include file = "../lib/aspJSON1.19.asp"-->
<!--#include file = "../backend/connection/db.asp"--> 
<option value="">CUSTOMER CODE</option>
<%
    kcepart = Request.Form("id")     
  sql0 = " SELECT CUSTCODE FROM [FGMGR].[dbo].[PACKTRAN] Where KCEPART = '"&kcepart&"' " &_
         " Group by CUSTCODE"
    set row=db.execute(sql0) 
    while not row.eof
    %>
    <option value="<%=row("CUSTCODE")%>"><%=row("CUSTCODE")%></option>
<% 
row.movenext 
Wend
%>