using System;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace DemoLeshk
{
    public partial class AuthForm : Form
    {
        string connectionString = "Server=localhost;Port=3306;Database=hoteldb;Username=root;Password=root;";
        public AuthForm()
        {
            InitializeComponent();
        }

        private void AuthForm_Load(object sender, EventArgs e)
        {
            LoadRoleIntoComboBox();
        }

        private void LoadRoleIntoComboBox()
        {
            MySqlConnection connection = new MySqlConnection(connectionString);
            connection.Open();
            string query = "SELECT * FROM users";

            MySqlCommand command = new MySqlCommand(query, connection);
            MySqlDataReader reader = command.ExecuteReader();
            roleComboBox.Items.Clear();

            while (reader.Read())
            {
                string name = reader["role"].ToString();
                roleComboBox.Items.Add(name);
            }
            connection.Close();
        }

        private void inputButton_Click(object sender, EventArgs e)
        {
            string role = roleComboBox.Text;
            string login = loginTextBox.Text;
            string password = passwordTextBox.Text;

            AuthUser(role, login, password);
        }

        void AuthUser(string role, string login, string password)
        {
            MySqlConnection connection = new MySqlConnection(connectionString);
            connection.Open();
            string query = "SELECT role FROM users WHERE login = @login AND password = @password AND role = @role";
            MySqlCommand command = new MySqlCommand(query, connection);
            command.Parameters.AddWithValue("@role", role);
            command.Parameters.AddWithValue("@login", login);
            command.Parameters.AddWithValue("@password", password);
            MySqlDataReader reader = command.ExecuteReader();

            if (reader.Read()) 
            {
                string userRole = reader["role"].ToString();

                switch (role)
                {
                    case "client":
                        ClientForm clientForm = new ClientForm();
                        clientForm.FormClosed += (s, args) => this.Close();
                        clientForm.Show();
                        this.Hide();
                        break;
                    case "director":
                        DirectorForm directorForm = new DirectorForm();
                        directorForm.FormClosed += (s, args) => this.Close();
                        directorForm.Show();
                        this.Hide();
                        break;
                    case "receptionist":
                        ReceptionistForm receptionistForm = new ReceptionistForm();
                        receptionistForm.FormClosed += (s, args) => this.Close();
                        receptionistForm.Show();
                        this.Hide();
                        break;
                    default:
                        MessageBox.Show("Неизвестная роль.");
                        break;
                }
            }
            else
            {
                MessageBox.Show("Неверный логин, пароль или роль.");
            }
            connection.Close();
        }
    }
}
