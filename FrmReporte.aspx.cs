using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using exportarExcel.Modelos;
using MySql.Data.MySqlClient;


namespace exportarExcel
{
    public partial class FrmReporte : System.Web.UI.Page
    {

        int z = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               // CargarData();
            }
        }



        public static List<ventas> lista = new List<ventas>();
        private void CargarData()
        {
            
                string conexion = "Server=localhost; Database=proyectoFotos; uid=root; pwd=root;";

                try
                {
                    using (var con = new MySqlConnection(conexion))
                    {
                        con.Open();
                        string consulta = "Select IdVenta,nCliente,descripcion,precioTotal,fechaCompra from Ventas";
                        var cmd = new MySqlCommand(consulta, con);
                        MySqlDataReader lector = cmd.ExecuteReader();
                        while (lector.Read())
                        {
                            var venta = new ventas();
                            venta.IdVenta = lector[0].ToString();
                            venta.nCliente = lector[1].ToString();
                            venta.descripcion = lector[2].ToString();
                            venta.precioTotal = lector[3].ToString();
                            venta.fechaCompra = lector[4].ToString();
                            lista.Add(venta);
                        }
                   
                        gdvLista.DataSource = lista;
                        gdvLista.DataBind();
                        con.Close();

                    }
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }
            
        }

        protected void gdvLista_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gdvLista.PageIndex = e.NewPageIndex;
            CargarData();

        }

        protected void btnGridviewToExcel_Click(object sender, EventArgs e)
        {

            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=ReportePruebaAaron.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                gdvLista.AllowPaging = false;
                this.CargarData();

                gdvLista.HeaderRow.BackColor = Color.White;
                foreach(TableCell cell in gdvLista.HeaderRow.Cells)
                {
                    cell.BackColor = gdvLista.HeaderStyle.BackColor;
                }
                foreach(GridViewRow row in gdvLista.Rows)
                {
                    row.BackColor = Color.White;
                    foreach(TableCell cell in row.Cells)
                    {
                        if(row.RowIndex % 2 == 0)
                        {
                            cell.BackColor = gdvLista.RowStyle.BackColor;
                        }
                        else
                        {
                            cell.BackColor = gdvLista.RowStyle.BackColor;
                        }
                        cell.CssClass = "textMode";
                    }
                }
                gdvLista.RenderControl(hw);
                string style = @"<style> .textmode { } </style>";
                Response.Write(style);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();

            }
        }


        public override void VerifyRenderingInServerForm(Control control)
        {
           // base.VerifyRenderingInServerForm(control);
          // veificamos que el control está renderizado
        }


    }
}