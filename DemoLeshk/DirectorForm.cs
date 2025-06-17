using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace DemoLeshk
{
    public partial class DirectorForm : Form
    {
        string connectionString = "Server=localhost;Port=3306;Database=hoteldb;Username=root;Password=root;";

        public DirectorForm()
        {
            InitializeComponent();
            
        }

        void ShowDataInGrid(string table) 
        {
            MySqlConnection connection = new MySqlConnection(connectionString);
            connection.Open();
            string query = $"SELECT * FROM {table}";
            MySqlCommand command = new MySqlCommand(query, connection);
            command.Parameters.AddWithValue("@table", table);
            MySqlDataAdapter adapter = new MySqlDataAdapter(query, connection);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);
            dataGrid.DataSource = dataTable;
            connection.Close();
        }

        private void usersButton_Click(object sender, EventArgs e)
        {
            ShowDataInGrid("users");
        }

        private void clientsButton_Click(object sender, EventArgs e)
        {
            ShowDataInGrid("guests");
        }

        private void roomsButton_Click(object sender, EventArgs e)
        {
            ShowDataInGrid("rooms");

        }

        private void exitButton_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("Вы уверены, что хотите выйти?", "Подтверждение",
                MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (result == DialogResult.OK)
            {
                AuthForm authForm = new AuthForm();
                authForm.FormClosed += (s, args) => this.Close();
                authForm.Show();
                this.Hide();
            }
        }
    }
}
