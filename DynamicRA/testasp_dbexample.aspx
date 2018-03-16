<%@ Page Language="VB" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If Page.IsValid Then
            ' check for username & password in the database
            Dim conn As New SqlConnection("Data Source=nl1-wsq1.a2hosting.com;Initial Catalog=dynamicr_1;Integrated Security=False;User Id=dynamicr_admin;Password=Evsq75@2;MultipleActiveResultSets=True")

            ' Get the row corresponding the given username and password
            Dim strSQL As String = "SELECT Customer_ID,Customer_Name FROM [dynamicr_1].[dynamicr_admin].[Customers] WHERE Customer_ID = " + txtCustomerID.Text
            'I recommend not to use * in querys
            Dim dsc As New SqlClient.SqlCommand(strSQL, conn)
            conn.Open()
            Dim dr As SqlDataReader
            dr = dsc.ExecuteReader()

            If dr.HasRows = True Then
                Do While dr.Read
                    Label1.Text = "Customer Name From dB Is : " + dr.Item("Customer_Name").ToString()
                Loop
            Else
                Label1.Text = "Doesn't have rows"
            End If
            conn.Close()
        End If
    End Sub


</script>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <title></title>    
</head>
<body>
    <add name="ConnectionStringName"
    providerName="System.Data.SqlClient"
    connectionString="Data Source=nl1-wsq1.a2hosting.com;Initial Catalog=dynamicr_1;Integrated Security=False;User Id=dynamicr_admin;Password=Evsq75@2;MultipleActiveResultSets=True" />

    <form id="form1" runat="server">   
<div>
          <asp:Label ID="Label2" 
        runat="server" Text="Put in Customer ID to fetch Customer Name from dB (either 1 or 2)">
      </asp:Label>
          <asp:textbox ID="txtCustomerID" 
        runat="server" Text="">
      </asp:textbox>
      <asp:Button ID="Button1" 
         runat="server" OnClick="Button1_Click" Text="Fetch Customer Name">
      </asp:Button>
    <br />
      <asp:Label ID="Label1" 
        runat="server" Text="">
      </asp:Label>
    </div>

    </form>
</body>
</html>
