<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sample_3.aspx.cs" Inherits="Day5_8.Sample_3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer_Details</title>
</head>
<body>
    <form id="form1" runat="server">    
    <br />
    <br />    
   <h2 align="center"><asp:Label ID="LblHHeader" runat="server" Text="Customers Details"></asp:Label></h2>                   
    <asp:Button ID="BtnHADD" runat="server" Text="ADD Customer" onclick="BtnHADD_Click" />
    <div align="center"> 
    <asp:GridView ID="CustomerGrid" runat="server" 
      onrowdeleting="gvCustomers_RowDeleting" AutoGenerateColumns="False" 
        Width="80%" AllowPaging="True" DataKeyNames="CustomerID"
        onpageindexchanging="OnPageIndexChanging" PageSize="8" 
            CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField>                
                <ItemTemplate>
                <a href="Add_Edit_Customer.aspx?CustomerID=<%#Eval("CustomerID")%>">EDIT</a>
                    <asp:LinkButton runat="server" ID="LBtnDelete" CausesValidation="true" CommandName="Delete" Text="DELETE" OnClientClick = "return confirm('You Want to Delete Details Of this Customer???');"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CustomerID" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                    <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"CustomerID") %>' ID="LblCustomerID" Enabled="false"></asp:Label>                        
                    </ItemTemplate>                    

        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>

<ItemStyle HorizontalAlign="Left"></ItemStyle>

            </asp:TemplateField> 
            <asp:TemplateField HeaderText="Company Name" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                    <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"CompanyName") %>' ID="LblCompanyName" Enabled="false"></asp:Label>                        
                    </ItemTemplate>                                     
        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>

<ItemStyle HorizontalAlign="Left"></ItemStyle>

           </asp:TemplateField>
            <asp:TemplateField HeaderText="Contact Title" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                    <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"ContactTitle") %>' ID="LblContactTitle" Enabled="false"></asp:Label>                        
                    </ItemTemplate>                    
        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>

<ItemStyle HorizontalAlign="Left"></ItemStyle>
        </asp:TemplateField> 
            <asp:TemplateField HeaderText="City" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                    <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"City") %>' ID="LblCity" Enabled="false"></asp:Label>                        
                    </ItemTemplate>                     
        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>

<ItemStyle HorizontalAlign="Left"></ItemStyle>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Postal Code" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                    <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"PostalCode") %>' ID="LblPostalCode" Enabled="false"></asp:Label>                        
                    </ItemTemplate>                    
        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>

<ItemStyle HorizontalAlign="Left"></ItemStyle>

            </asp:TemplateField> 
            <asp:TemplateField HeaderText="Phone No." HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                    <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Phone") %>' ID="LblPhone" Enabled="false"></asp:Label>                        
                    </ItemTemplate>                     
        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>

<ItemStyle HorizontalAlign="Left"></ItemStyle>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fax No." HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                    <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Fax") %>' ID="LblFax" Enabled="false"></asp:Label>                        
                    </ItemTemplate>                   
        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>

<ItemStyle HorizontalAlign="Left"></ItemStyle>

            </asp:TemplateField>                   
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:Label runat="server" ID="LblHDeleteEmployee" Visible="False" ForeColor="Green" 
            style="font-weight: 700">Customer Details Deleted.</asp:Label>
    </div>
    </form>
</body>
</html>