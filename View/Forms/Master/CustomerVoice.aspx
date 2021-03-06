<%@ Page Language="C#" MasterPageFile="~/master/MasterPage.master" AutoEventWireup="true"
    CodeFile="CustomerVoice.aspx.cs" Inherits="View_Forms_Master_CustomerVoice" %>

<%@ Register TagPrefix="ew" Namespace="eWorld.UI" Assembly="eWorld.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<script type="text/javascript">
         $(document).ready(function()
         {
            $('#ctl00_ContentPlaceHolder1_CalstartDate').datepicker();
         });
         
    </script>
    <script language="javascript" type="text/javascript">
function setMessageText(ID,Text)
{
   document.getElementById(ID).innerHTML = Text ;
   setTimeout("setMessageText('"+ID+"','')",3000);
}

function ClearControls(id)
{
document.getElementById('ctl00_ContentPlaceHolder1_txtCVoiceCode').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtDesc').value='';
document.getElementById('ctl00_ContentPlaceHolder1_chkActive').checked = 0;
document.getElementById('ctl00_ContentPlaceHolder1_chkReport').checked = 0;
return false;
} 

function getRadioSelection(id)
{

   if(id=='ctl00_ContentPlaceHolder1_rdoAdd')
   {
    document.getElementById('ctl00_ContentPlaceHolder1_txtCVoiceGroup').style.display='';
    document.getElementById('ctl00_ContentPlaceHolder1_drpCVoiceGroup').style.display='none';
   }
    if(id=='ctl00_ContentPlaceHolder1_rdoAssign')
   {
    document.getElementById('ctl00_ContentPlaceHolder1_txtCVoiceGroup').style.display='none';
    document.getElementById('ctl00_ContentPlaceHolder1_drpCVoiceGroup').style.display='';
   }
  
} 

function Validate(id)
{

      var checkDate=CheckValidDateFormat(document.getElementById('ctl00_ContentPlaceHolder1_CalstartDate'));
   if(!checkDate)
   {
          alert('Invalid date');
          return false;
   }  
        var assign = 'ctl00_ContentPlaceHolder1_rdoAssign';
        var group='';
        var lblgrp='ctl00_ContentPlaceHolder1_lblGroupMessage';
        var lblcode='ctl00_ContentPlaceHolder1_lblCodeMessage';
        var lbldesc='ctl00_ContentPlaceHolder1_lblDescMessage';
         var code=document.getElementById('ctl00_ContentPlaceHolder1_txtCVoiceCode').value
        if(document.getElementById('ctl00_ContentPlaceHolder1_txtCVoiceCode').value=='')
        {
            document.getElementById(lblcode).innerHTML='*';
            return false;
        }
        else
        
            var RegExp = /^([0-9]*\s?[0-9]*)+$/;
                
		        if (!RegExp.test(code))
		        {
		        document.getElementById(lblcode).innerHTML='';
		        document.getElementById(lblcode).innerHTML='Numeric Only';
		           
    		      return false;
    		    }  
		   
        else
        {
            document.getElementById(lblcode).innerHTML='';
                if(document.getElementById('ctl00_ContentPlaceHolder1_txtDesc').value=='')
                {
                    document.getElementById(lbldesc).innerHTML='*';
                    return false;
                }
                else
                {
                    document.getElementById(lbldesc).innerHTML='';
                    if(document.getElementById(assign).checked)
                    {
                         group = document.getElementById('ctl00_ContentPlaceHolder1_drpCVoiceGroup').value;
                        if(group==0)
                        {
                             document.getElementById(lblgrp).innerHTML='*';
                             return false;
                         }
                         else
                         {
                              document.getElementById(lblgrp).innerHTML='';
                               return true;
                         }
            
                     }
                     else
                     {
                         group = document.getElementById('ctl00_ContentPlaceHolder1_txtCVoiceGroup').value;
                        if(group=='')
                        {
                             document.getElementById(lblgrp).innerHTML='*';
                             return false;
                         }
                         else
                         {
                              document.getElementById(lblgrp).innerHTML='';
                               return true;
                         }
                     }
                }
                    
        }
  }
  
   
  function getGroup()
{

   if(document.getElementById('ctl00_ContentPlaceHolder1_rdoAdd').checked)
   {
    document.getElementById('ctl00_ContentPlaceHolder1_txtCVoiceGroup').style.display='';
    document.getElementById('ctl00_ContentPlaceHolder1_drpCVoiceGroup').style.display='none';
   }
   else
   {
     document.getElementById('ctl00_ContentPlaceHolder1_txtCVoiceGroup').style.display='none';
      document.getElementById('ctl00_ContentPlaceHolder1_drpCVoiceGroup').style.display='';
   }
  
} 
    </script>

    <fieldset class="sectionBorder">
        <legend>Customer Voice</legend>
        <div>
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="cssLabel">
                        <asp:Label ID="lblCVoiceCode" runat="server" Text="Customer Voice Code:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCVoiceCode" runat="server" MaxLength="6" ToolTip="Customer Voice Code"></asp:TextBox>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtCVoiceCode"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter numeric values only" ValidationExpression="^([0-9]*\s?[0-9]*)+$" ControlToValidate="txtCVoiceCode"></asp:RegularExpressionValidator>
--%>
                        <asp:Label ID="lblCodeMessage" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="cssLabel">
                        <asp:Label ID="lblCVoiceGroup" runat="server" Text="Customer Voice Group:"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButton ID="rdoAssign" ToolTip="Assign" runat="server" GroupName="Mode"
                            Text="Assign Existing" onclick="javascript:getRadioSelection(this.id);" />
                        <asp:RadioButton ID="rdoAdd" runat="server" ToolTip="Add" Checked="true" GroupName="Mode"
                            Text="Add" onclick="javascript:getRadioSelection(this.id);" />
                        <asp:DropDownList ID="drpCVoiceGroup" runat="server" Style="display: none;" ToolTip="Customer Voice Group">
                        </asp:DropDownList>
                        <asp:TextBox ID="txtCVoiceGroup" runat="server" ToolTip="Customer Voice Group"></asp:TextBox>
                        <asp:Label ID="lblGroupMessage" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="cssLabel">
                        <asp:Label ID="lblDesc" runat="server" Text="Description:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" ToolTip="Description"></asp:TextBox>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtDesc"></asp:RequiredFieldValidator>
--%>
                        <asp:Label ID="lblDescMessage" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td  class="cssLabel">
                        <asp:Label ID="lblActive" runat="server" Text="Active:"></asp:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkActive" Checked="true" runat="server" ToolTip="Status" />
                    </td>
                </tr>
                <tr>
                    <td  class="cssLabel">
                        <asp:Label ID="lblReport" runat="server" Text="To be used in Report:"></asp:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkReport" Checked="true" runat="server" ToolTip="To be used in Report" />
                    </td>
                </tr>
                <tr>
                    <td  class="cssLabel">
                        <asp:Label ID="lbldate" runat="server" Text="Effective Date:"></asp:Label>
                    </td>
                    
                    <td  style="width: 168px">
                                <input type="text" id="CalstartDate"  class="cssTextBox" runat="server" 
                                    value="" style="width: 80px" />
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="CalstartDate"
                                    runat="server" ErrorMessage="*">*</asp:RequiredFieldValidator>
                                  
                             
                            </td>
                   
                    <%--<td>
                        <ew:CalendarPopup ID="CalstartDate" runat="server" CalendarWidth="200" Culture="English (United Kingdom)"
                            Font-Size="9px" Height="20px" ImageUrl="/prototype/images/icon-calendar.gif"
                            Nullable="true" NullableLabelText='' ShowGoToToday="true" PadSingleDigits="True"
                            ToolTip="Select Date" Width="80px">
                            <SelectedDateStyle BackColor="LightSteelBlue" />
                        </ew:CalendarPopup>
                    </td>--%>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <div class="cssButtonPanel">
            <asp:Button ID="btnAdd" Text="Save" runat="server" OnClick="btnAdd_Click" ToolTip="Save"
                OnClientClick="return Validate(this.id);" />
            <span style="margin-left: 1%;"></span>
            <asp:Button ID="btnCancel" Text="Cancel" runat="server" OnClick="btnCancel_Click"
                ToolTip="Cancel" />
        </div>
    </fieldset>
    <asp:HiddenField ID="hdnStatusID" Value="0" runat="server" />
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
</asp:Content>
