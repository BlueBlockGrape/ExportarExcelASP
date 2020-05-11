<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmReporte.aspx.cs" Inherits="exportarExcel.FrmReporte" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Practica 2</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrapValidator.min_.css">
</head>
<body style="background-color: lightgray;">

    <div class="container text-center" align="center">

        <h1 style="color: blue;">Reporte de Ventas Totales de FotosProyect</h1>
        <img src="img/58.jpg" alt="Imagen de ejemplo" height="250" width="600">
    </div>



    <form id="form1" runat="server">
        <div class="container text-center" align="center">
            <asp:GridView ID="gdvLista" runat="server" AllowPaging="true"
                autogeneratecolumns="false" CellPadding="4"
                ForeColor="#333333" GridLines="None" Width="882px"
                OnPageIndexChanging="gdvLista_PageIndexChanging">

                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="IdVenta" HeaderText="Código Venta" />
                    <asp:BoundField DataField="nCliente" HeaderText="Cliente" />
                    <asp:BoundField DataField="descripcion" HeaderText="descripsión" />
                    <asp:BoundField DataField="precioTotal" HeaderText="Total" />
                    <asp:BoundField DataField="fechaCompra" HeaderText="Fecha Compra" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#FFCD51" Font-Bold="true" ForeColor="White" />
                <HeaderStyle BackColor="#FFCD51" Font-Bold="true" ForeColor="White" />
                <PagerStyle BackColor="#FFCD51" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="true" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            </br>
            <asp:Button ID="btnGridviewToExcel" CssClass="btn btn-primary" runat="server" OnClick="btnGridviewToExcel_Click" Text="Crear Reporte" />
        </div>
    </form>
    <br />
    <br />

    <div class="container text-justify" align="justify">

        <p style="text-size: 16px;">Este tipo de reporte en Excel puede servir cuando se ocupan listas con grandes cantidades
            de datos por lo que es interesante poder realizarlos de esta forma, dado que si se requiere buscar información o entregar
            la lista a alguna persona es especifico o simplemente tener el reporte en fisico es conveniente imprimir la lista
            para ello utilizamos un GridView y de ahí obtuvimos una lista de datos que se encontraban en una base de datos y con ellos
            generamos el documento de Excel.
        </p>
        
    </div>

    <div class="container text-center" align="center">

        <h1 style="color: forestgreen;">Ejemplo del GridView sin convertir</h1>
        <img src="img/59.png" alt="Imagen de ejemplo 2" height="250" width="600">
    </div>
</body>
</html>
