using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fitness_Hub.user
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetAppointment();
            GetOrder();
            GetUser();
            GetSupplier();
            GetProduct();
            GetTrainer();
        }
        public void GetUser()
        {
            System.Data.DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            lblUser.Text = dv.Count.ToString();
        }
        public void GetSupplier()
        {
            System.Data.DataView dv1 = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            lblSupplier.Text = dv1.Count.ToString();
        }
        public void GetTrainer()
        {
            System.Data.DataView dv2 = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
            lblTrainer.Text = dv2.Count.ToString();
        }
        public void GetProduct()
        {
            System.Data.DataView dv3 = (DataView)SqlDataSource4.Select(DataSourceSelectArguments.Empty);
            lblProduct.Text = dv3.Count.ToString();
        }
        public void GetOrder()
        {
            System.Data.DataView dv4 = (DataView)SqlDataSource5.Select(DataSourceSelectArguments.Empty);
            lblOrder.Text = dv4.Count.ToString();
        }
        public void GetAppointment()
        {
            System.Data.DataView dv5 = (DataView)SqlDataSource6.Select(DataSourceSelectArguments.Empty);
            lblAppointment.Text = dv5.Count.ToString();
        }
    }
}