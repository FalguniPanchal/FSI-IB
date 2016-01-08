using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Drawing.Design;
using System.IO;

namespace FSI_ImageBank
{
    public partial class ABC : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FSI_ImageBankConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        //SqlDataAdapter da = new SqlDataAdapter();
        SqlDataReader dr;
        DataTable Cataloguetable = new DataTable();
        DataTable TempCataloguetable = new DataTable();
        DataSet set = new DataSet();

        public string styleno = "";
        public string productcategory = "";
        public string subcategory = "";
        public string centerstoneweight = "";
        public string totalweight = "";
        public string productimage;
        public string path;

        DataRow[] drow;
        Image img = new Image();
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack == true)
            {
                con.Open();

                ////////////////////// PRODUCT CATEGORY LOAD /////////////////////////
                cmd.CommandText = "SELECT DISTINCT Product_Category FROM Product_Catalogue order by Product_Category";
                cmd.Connection = con;

                dr = cmd.ExecuteReader();

                cmb_productcategory.Items.Clear();

                while (dr.Read())
                {
                    cmb_productcategory.Items.Add(dr["Product_Category"].ToString());
                }

                cmb_productcategory.Items.Insert(0, "");

                dr.Close();
                ///////////////////// PRODUCT CATEGORY LOAD ENDS //////////////////////


                //////////////////// SUB CATEGORY LOAD ////////////////////////////////////
                cmd.CommandText = "SELECT DISTINCT Sub_Category FROM Product_Catalogue order by Sub_Category";
                cmd.Connection = con;

                dr = cmd.ExecuteReader();

                cmb_subcategory.Items.Clear();

                while (dr.Read())
                {
                    cmb_subcategory.Items.Add(dr["Sub_Category"].ToString());
                }

                cmb_subcategory.Items.Insert(0, "");

                dr.Close();

                ////////////////////// SUB CATEGORY LOAD ENDS /////////////////////////////

                //////////////////// COLLECTION LOAD /////////////////////////////////

                cmd.CommandText = "SELECT DISTINCT P_Collection FROM Product_Catalogue order by P_Collection";
                cmd.Connection = con;

                dr = cmd.ExecuteReader();

                cmb_collection.Items.Clear();

                while (dr.Read())
                {
                    cmb_collection.Items.Add(dr["P_Collection"].ToString());
                }

                cmb_collection.Items.Insert(0, "");

                dr.Close();

                /////////////////////// COLLECTION LOAD ENDS ////////////////////////

                ////////////////////// SETTING LOAD /////////////////////////////

                cmd.CommandText = "SELECT DISTINCT Center_Setting FROM Product_Catalogue order by Center_Setting";
                cmd.Connection = con;

                dr = cmd.ExecuteReader();

                cmb_setting.Items.Clear();

                while (dr.Read())
                {
                    cmb_setting.Items.Add(dr["Center_Setting"].ToString());
                }

                cmb_setting.Items.Insert(0, "");

                dr.Close();

                //////////////////////// SETTING LOAD ENDS //////////////////////

                ////////////////////////// DIAMOND WEIGHT RANGE LOAD //////////////

                cmd.CommandText = "SELECT DISTINCT Diamond_Weight_Range FROM Product_Catalogue order by Diamond_Weight_Range";
                cmd.Connection = con;

                dr = cmd.ExecuteReader();

                cmb_diaweightrange.Items.Clear();

                while (dr.Read())
                {
                    cmb_diaweightrange.Items.Add(dr["Diamond_Weight_Range"].ToString());
                }

                cmb_diaweightrange.Items.Insert(0, "");

                dr.Close();

                ////////////////////////// DIAMOND WEIGHT RANGE LOAD ENDS ////////////////


                ////////////////////////// CENTER SHAPE LOAD ////////////////////////////

                cmd.CommandText = "SELECT DISTINCT Center_Shape FROM Product_Catalogue order by Center_Shape";
                cmd.Connection = con;

                dr = cmd.ExecuteReader();

                cmb_centershape.Items.Clear();

                while (dr.Read())
                {
                    cmb_centershape.Items.Add(dr["Center_Shape"].ToString());
                }

                cmb_centershape.Items.Insert(0, "");

                dr.Close();

                ///////////////////////// CENTER SHAPE LOAD ENDS //////////////////////////


                //////////////////////// CENTER STONE WEIGHT RANGE LOAD //////////////////////////////

                cmd.CommandText = "SELECT DISTINCT CenterStone_Weight_Range FROM Product_Catalogue order by CenterStone_Weight_Range";
                cmd.Connection = con;

                dr = cmd.ExecuteReader();

                cmb_centerstweightrange.Items.Clear();

                while (dr.Read())
                {
                    cmb_centerstweightrange.Items.Add(dr["CenterStone_Weight_Range"].ToString());
                }

                cmb_centerstweightrange.Items.Insert(0, "");

                dr.Close();

                /////////////////////// CENTER STONE WEIGHT RANGE LOAD ENDS //////////////////////

                GetCatalogueData();

                ViewState["Cataloguetable"] = Cataloguetable;

            }
            else
            {
                ProductCatalogue.DataSource = ViewState["Cataloguetable"];
                ProductCatalogue.DataBind();

                GetImage();

            }
        }

        protected void ProductCatalogue_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ProductCatalogue.PageIndex = e.NewPageIndex;
            ProductCatalogue.DataBind();
        }

        public void GetCatalogueData()
        {
            string command = "SELECT * FROM Product_Catalogue";
            SqlDataAdapter da = new SqlDataAdapter(command, con);
            da.Fill(Cataloguetable);

            ProductCatalogue.DataSource = Cataloguetable;
            ProductCatalogue.DataBind();

            GetImage();
        }

        public void GetImage()
        {
            path = @"D:\AB1002K.jpg";


            foreach (GridViewRow row in ProductCatalogue.Rows)
            {
                if (File.Exists(path) == true)
                {
                    if (File.Exists(Server.MapPath("~/Uploaded Images/AB1002K.jpg")) == false)  // EDITED BY SIDDHESH.
                    {
                        File.Copy(@"D:\AB1002K.jpg", Server.MapPath("~/Uploaded Images/AB1002K.jpg"), true);
                    }

                    Image img1 = (Image)row.Cells[1].FindControl("StyleImage");                 // EDITED BY SIDDHESH.
                    img1.ImageUrl = "~/Uploaded Images/AB1002K.jpg";
                }
            }
        }

        protected void cmb_productcategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (cmb_productcategory.Text != "")
                {
                    if (ViewState["TempCataloguetable"] != null)
                    {
                        Cataloguetable = (DataTable)ViewState["TempCataloguetable"];
                    }
                    else
                    {
                        Cataloguetable = (DataTable)ViewState["Cataloguetable"];
                    }


                    DataTable dtable = new DataTable();

                    dtable = Cataloguetable.Select().Where(p => (p["Product_Category"].ToString()) == "" + cmb_productcategory.Text + "").CopyToDataTable();

                    ViewState["TempCataloguetable"] = dtable;

                    ProductCatalogue.DataSource = (DataTable)ViewState["TempCataloguetable"];
                    ProductCatalogue.DataBind();

                    GetImage();
                }
                else
                {
                    Cataloguetable = (DataTable)ViewState["Cataloguetable"];

                    DataTable dtable = new DataTable();

                    dtable = Cataloguetable.Select().Where(p => (p["Product_Category"].ToString()) != "" + cmb_productcategory.Text + "").CopyToDataTable();

                    ViewState["TempCataloguetable"] = dtable;

                    ProductCatalogue.DataSource = (DataTable)ViewState["TempCataloguetable"];
                    ProductCatalogue.DataBind();

                    GetImage();
                }
            }
            catch(Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Empty!!", "alert('The Selection does not contain any Data!! Reset Your Selection and Try Again!!')",true);
                Cataloguetable = (DataTable)ViewState["Cataloguetable"];
                ProductCatalogue.DataSource = Cataloguetable;
                ProductCatalogue.DataBind();
            }
        }

        protected void cmb_subcategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (cmb_subcategory.Text != "")
                {
                    if (ViewState["TempCataloguetable"] != null)
                    {
                        Cataloguetable = (DataTable)ViewState["TempCataloguetable"];
                    }
                    else
                    {
                        Cataloguetable = (DataTable)ViewState["Cataloguetable"];
                    }

                    DataTable dtable = new DataTable();

                    dtable = Cataloguetable.Select().Where(p => (p["Sub_Category"].ToString()) == "" + cmb_subcategory.Text + "").CopyToDataTable();

                    ViewState["TempCataloguetable"] = dtable;

                    ProductCatalogue.DataSource = (DataTable)ViewState["TempCataloguetable"];
                    ProductCatalogue.DataBind();

                    GetImage();
                }
                else
                {
                    Cataloguetable = (DataTable)ViewState["Cataloguetable"];

                    DataTable dtable = new DataTable();

                    dtable = Cataloguetable.Select().Where(p => (p["Sub_Category"].ToString()) != "" + cmb_subcategory.Text + "").CopyToDataTable();

                    ViewState["TempCataloguetable"] = dtable;

                    ProductCatalogue.DataSource = (DataTable)ViewState["TempCataloguetable"];
                    ProductCatalogue.DataBind();

                    GetImage();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Empty!!", "alert('The Selection does not contain any Data!! Reset Your Selection and Try Again!!')", true);
                Cataloguetable = (DataTable)ViewState["Cataloguetable"];
                ProductCatalogue.DataSource = Cataloguetable;
                ProductCatalogue.DataBind();
            }
        }

        protected void cmb_collection_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (cmb_collection.Text != "")
                {
                    if (ViewState["TempCataloguetable"] != null)
                    {
                        Cataloguetable = (DataTable)ViewState["TempCataloguetable"];
                    }
                    else
                    {
                        Cataloguetable = (DataTable)ViewState["Cataloguetable"];
                    }

                    DataTable dtable = new DataTable();

                    dtable = Cataloguetable.Select().Where(p => (p["P_Collection"].ToString()) == "" + cmb_collection.Text + "").CopyToDataTable();

                    ViewState["TempCataloguetable"] = dtable;

                    ProductCatalogue.DataSource = (DataTable)ViewState["TempCataloguetable"];
                    ProductCatalogue.DataBind();

                    GetImage();
                }
                else
                {
                    Cataloguetable = (DataTable)ViewState["Cataloguetable"];

                    DataTable dtable = new DataTable();

                    dtable = Cataloguetable.Select().Where(p => (p["P_Collection"].ToString()) != "" + cmb_collection.Text + "").CopyToDataTable();

                    ViewState["TempCataloguetable"] = dtable;

                    ProductCatalogue.DataSource = (DataTable)ViewState["TempCataloguetable"];
                    ProductCatalogue.DataBind();

                    GetImage();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Empty!!", "alert('The Selection does not contain any Data!! Reset Your Selection and Try Again!!')",true);
                Cataloguetable = (DataTable)ViewState["Cataloguetable"];
                ProductCatalogue.DataSource = Cataloguetable;
                ProductCatalogue.DataBind();
            }
        }

        protected void cmb_setting_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (cmb_setting.Text != "")
                {
                    if (ViewState["TempCataloguetable"] != null)
                    {
                        Cataloguetable = (DataTable)ViewState["TempCataloguetable"];
                    }
                    else
                    {
                        Cataloguetable = (DataTable)ViewState["Cataloguetable"];
                    }

                    DataTable dtable = new DataTable();

                    dtable = Cataloguetable.Select().Where(p => (p["Center_Setting"].ToString()) == "" + cmb_setting.Text + "").CopyToDataTable();

                    ViewState["TempCataloguetable"] = dtable;

                    ProductCatalogue.DataSource = (DataTable)ViewState["TempCataloguetable"];
                    ProductCatalogue.DataBind();

                    GetImage();
                }
                else
                {
                    Cataloguetable = (DataTable)ViewState["Cataloguetable"];

                    DataTable dtable = new DataTable();

                    dtable = Cataloguetable.Select().Where(p => (p["Center_Setting"].ToString()) != "" + cmb_setting.Text + "").CopyToDataTable();

                    ViewState["TempCataloguetable"] = dtable;

                    ProductCatalogue.DataSource = (DataTable)ViewState["TempCataloguetable"];
                    ProductCatalogue.DataBind();

                    GetImage();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Empty!!", "alert('The Selection does not contain any Data!! Reset Your Selection and Try Again!!')", true);
                Cataloguetable = (DataTable)ViewState["Cataloguetable"];
                ProductCatalogue.DataSource = Cataloguetable;
                ProductCatalogue.DataBind();
            }
        }

        protected void btnreset_Click(object sender, EventArgs e)
        {
            cmb_centershape.Text = "";
            cmb_productcategory.Text = "";
            cmb_subcategory.Text = "";
            cmb_setting.Text = "";
            cmb_diaweightrange.Text = "";
            cmb_collection.Text = "";
            cmb_centerstweightrange.Text = "";
        }

        protected void cmb_diaweightrange_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (cmb_diaweightrange.Text != "")
                {
                    if (ViewState["TempCataloguetable"] != null)
                    {
                        Cataloguetable = (DataTable)ViewState["TempCataloguetable"];
                    }
                    else
                    {
                        Cataloguetable = (DataTable)ViewState["Cataloguetable"];
                    }

                    DataTable dtable = new DataTable();

                    dtable = Cataloguetable.Select().Where(p => (p["Diamond_Weight_Range"].ToString()) == "" + cmb_diaweightrange.Text + "").CopyToDataTable();

                    ViewState["TempCataloguetable"] = dtable;

                    ProductCatalogue.DataSource = (DataTable)ViewState["TempCataloguetable"];
                    ProductCatalogue.DataBind();

                    GetImage();
                }
                else
                {
                    Cataloguetable = (DataTable)ViewState["Cataloguetable"];

                    DataTable dtable = new DataTable();

                    dtable = Cataloguetable.Select().Where(p => (p["Diamond_Weight_Range"].ToString()) != "" + cmb_diaweightrange.Text + "").CopyToDataTable();

                    ViewState["TempCataloguetable"] = dtable;

                    ProductCatalogue.DataSource = (DataTable)ViewState["TempCataloguetable"];
                    ProductCatalogue.DataBind();

                    GetImage();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Empty!!", "alert('The Selection does not contain any Data!! Reset Your Selection and Try Again!!')", true);
                Cataloguetable = (DataTable)ViewState["Cataloguetable"];
                ProductCatalogue.DataSource = Cataloguetable;
                ProductCatalogue.DataBind();
            }
        }

        protected void cmb_centershape_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (cmb_centershape.Text != "")
                {
                    if (ViewState["TempCataloguetable"] != null)
                    {
                        Cataloguetable = (DataTable)ViewState["TempCataloguetable"];
                    }
                    else
                    {
                        Cataloguetable = (DataTable)ViewState["Cataloguetable"];
                    }

                    DataTable dtable = new DataTable();

                    dtable = Cataloguetable.Select().Where(p => (p["Center_Shape"].ToString()) == "" + cmb_centershape.Text + "").CopyToDataTable();

                    ViewState["TempCataloguetable"] = dtable;

                    ProductCatalogue.DataSource = (DataTable)ViewState["TempCataloguetable"];
                    ProductCatalogue.DataBind();

                    GetImage();
                }
                else
                {
                    Cataloguetable = (DataTable)ViewState["Cataloguetable"];

                    DataTable dtable = new DataTable();

                    dtable = Cataloguetable.Select().Where(p => (p["Center_Shape"].ToString()) != "" + cmb_centershape.Text + "").CopyToDataTable();

                    ViewState["TempCataloguetable"] = dtable;

                    ProductCatalogue.DataSource = (DataTable)ViewState["TempCataloguetable"];
                    ProductCatalogue.DataBind();

                    GetImage();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Empty!!", "alert('The Selection does not contain any Data!! Reset Your Selection and Try Again!!')", true);
                Cataloguetable = (DataTable)ViewState["Cataloguetable"];
                ProductCatalogue.DataSource = Cataloguetable;
                ProductCatalogue.DataBind();
            }
        }

        protected void cmb_centerstweightrange_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (cmb_centerstweightrange.Text != "")
                {
                    if (ViewState["TempCataloguetable"] != null)
                    {
                        Cataloguetable = (DataTable)ViewState["TempCataloguetable"];
                    }
                    else
                    {
                        Cataloguetable = (DataTable)ViewState["Cataloguetable"];
                    }

                    DataTable dtable = new DataTable();

                    dtable = Cataloguetable.Select().Where(p => (p["CenterStone_Weight_Range"].ToString()) == "" + cmb_centerstweightrange.Text + "").CopyToDataTable();

                    ViewState["TempCataloguetable"] = dtable;

                    ProductCatalogue.DataSource = (DataTable)ViewState["TempCataloguetable"];
                    ProductCatalogue.DataBind();

                    GetImage();
                }
                else
                {
                    Cataloguetable = (DataTable)ViewState["Cataloguetable"];

                    DataTable dtable = new DataTable();

                    dtable = Cataloguetable.Select().Where(p => (p["CenterStone_Weight_Range"].ToString()) != "" + cmb_centerstweightrange.Text + "").CopyToDataTable();

                    ViewState["TempCataloguetable"] = dtable;

                    ProductCatalogue.DataSource = (DataTable)ViewState["TempCataloguetable"];
                    ProductCatalogue.DataBind();

                    GetImage();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Empty!!", "alert('The Selection does not contain any Data!! Reset Your Selection and Try Again!!')", true);
                Cataloguetable = (DataTable)ViewState["Cataloguetable"];
                ProductCatalogue.DataSource = Cataloguetable;
                ProductCatalogue.DataBind();
            }
        }
    }
}