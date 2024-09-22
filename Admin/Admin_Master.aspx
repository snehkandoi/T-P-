﻿<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="false" CodeFile="Admin_Master.aspx.vb" Inherits="Admin_Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <!-- DataTables -->
    <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
    <style>
    .modalPopup {
        width: 600px; /* Increase the width */
        height: 400px; /* Increase the height */
        background-color: white; /* Ensure background color is set */
        padding: 20px; /* Optional padding */
    }

    .modal-content {
        width: 100%;
        height: 100%;
    }
</style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Scripts>
        </Scripts>
    </asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Button ID="btnShowPopup" runat="server" Text="New Admin" CssClass="btn btn-primary m-2" OnClientClick="return false;" />
            
            <!-- Modal Popup Content -->
            <asp:Panel ID="pnlAdminForm" runat="server" CssClass="modalPopup" style="display:none;">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Admin Master</h4>
                        <button type="button" class="close" onclick="closeModal();" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <asp:HiddenField ID="user_id" runat="server" />
                        <div class="form-group">
                            <label for="user_name">Admin Name</label>
                            <asp:TextBox ID="user_name" runat="server" class="form-control" placeholder="Enter Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Valid Name" ControlToValidate="user_name" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="user_password">Password</label>
                            <asp:TextBox ID="user_password" runat="server" placeholder="Enter Password" class="form-control" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Valid Password" ControlToValidate="user_password" Display="none" Font-Bold="True" ValidationGroup="admin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="user_type">User Type</label>
                            <asp:DropDownList ID="user_type" runat="server" CssClass="form-control">
                                <asp:ListItem>Admin</asp:ListItem>
                                <asp:ListItem>User</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="submit" runat="server" Text="Submit" CssClass="btn btn-primary" CausesValidation="true" ValidationGroup="admin" />
                        <asp:Button ID="btnClose" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClientClick="closeModal();" />
                    </div>
                </div>
            </asp:Panel>
              <!-- Table -->
            <div class="content">
                <div class="container-fluid">
                    <div class="card">
              <div class="card-header">
                <h3 class="card-title">List Of All Employees</h3>
              </div>
              <!-- /.card-header -->
           
                <div class="card-body">
                <asp:GridView ID="example1" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" DataKeyNames="user_id" DataSourceID="SqlDataSource1">

                        <Columns>
                            <asp:BoundField DataField="user_id" HeaderText="user_id" ReadOnly="True" InsertVisible="False" SortExpression="user_id" Visible="false"></asp:BoundField>
                            <asp:BoundField DataField="user_name" HeaderText="User Name" SortExpression="user_name"></asp:BoundField>
                            <asp:BoundField DataField="user_password" HeaderText="user_password" SortExpression="user_password" Visible="false"></asp:BoundField>
                            <asp:BoundField DataField="user_type" HeaderText="User Type" SortExpression="user_type"></asp:BoundField>
                            <asp:TemplateField HeaderText="Actions" ItemStyle-Width="200px">
                                <ItemTemplate>
                                    <asp:ImageButton ID="Edit1" runat="server" Text="Edit" CommandName="Edit1" OnClick="Edit1_Click" CausesValidation="false" ToolTip="Edit User" ImageUrl="img/pen.png" Width="35px" Height="35px" />
                                    &nbsp;&nbsp;
                                          
                               <asp:ImageButton ID="del" runat="server" CommandName="del" CausesValidation="false" OnClientClick="return message(this);" Text="Delete" CommandArgument='<%# Eval("user_id") %>' Height="35px" Width="35px" ImageUrl="img/bin.png"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Charusat_ProjectConnectionString %>' DeleteCommand="DELETE FROM [Admin_Master] WHERE [user_id] = @user_id" InsertCommand="INSERT INTO [Admin_Master] ([user_name], [user_password], [user_type]) VALUES (@user_name, @user_password, @user_type)" SelectCommand="SELECT * FROM [Admin_Master]" UpdateCommand="UPDATE [Admin_Master] SET [user_name] = @user_name, [user_password] = @user_password, [user_type] = @user_type WHERE [user_id] = @user_id">
                        <DeleteParameters>
                            <asp:Parameter Name="user_id" Type="Int32"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="user_name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="user_password" Type="String"></asp:Parameter>
                            <asp:Parameter Name="user_type" Type="String"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="user_name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="user_password" Type="String"></asp:Parameter>
                            <asp:Parameter Name="user_type" Type="String"></asp:Parameter>
                            <asp:Parameter Name="user_id" Type="Int32"></asp:Parameter>
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
              
              <!-- /.card-body -->
            </div>
                </div>
            </div>
            <!-- Table end -->
            <!-- Modal Extender -->
            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnShowPopup"
                PopupControlID="pnlAdminForm" BackgroundCssClass="modal-background" />

            <script type="text/javascript">
                function closeModal() {
                    $find('<%= ModalPopupExtender1.ClientID %>').hide();
                }
            </script>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

