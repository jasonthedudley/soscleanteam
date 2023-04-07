<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="FinancialReports.aspx.vb" Inherits="SOSiQ.FinancialReports" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div>
<h1>Invoices by site by invoice create date</h1>
</div>
<hr />

    <div style="font-size: 30px; font-weight: bold;">

                <asp:Chart ID="Chart1" runat="server" Width="1200" Height="720" >
                    <Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                        
                    </ChartAreas>
                    <Legends>

                          <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="false" Name="Default" LegendStyle="Row" />
                      

                    </Legends>
                </asp:Chart>
        </div>

<hr />
</asp:Content>
