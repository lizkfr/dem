using System;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace DemoLeshk
{
    public partial class ReceptionistForm : Form
    {
        string connectionString = "Server=localhost;Port=3306;Database=hoteldb;Username=root;Password=root;";
        public ReceptionistForm()
        {
            InitializeComponent();
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

        private void inputButton_Click(object sender, EventArgs e)
        {
            string fullname = fullnameTextBox.Text;
            string passportnumber = passportnumberTextBox.Text;
            string room = roomTextBox.Text;
            string enrtydate = enrtydateTextBox.Text;
            string departuredate = departuredateTextBox.Text;
            MySqlConnection connection = new MySqlConnection(connectionString);
            connection.Open();
            string query = "INSERT INTO guests (fullname, passportnumber, room, enrtydate, departuredate)" +
                "VALUES(@fullname, @passportnumber, @room, @enrtydate, @departuredate)";
            MySqlCommand command = new MySqlCommand(query, connection);
            command.Parameters.AddWithValue("@fullname", fullname);
            command.Parameters.AddWithValue("@passportnumber", passportnumber);
            command.Parameters.AddWithValue("@room", room);
            command.Parameters.AddWithValue("@enrtydate", enrtydate);
            command.Parameters.AddWithValue("@departuredate", departuredate);
            try
            {
                MySqlDataReader reader = command.ExecuteReader();
                reader.Read();
                MessageBox.Show("Запись успешно добавлена");
                fullnameTextBox.Clear();
                passportnumberTextBox.Clear();
                roomTextBox.Clear();
                enrtydateTextBox.Clear();
                departuredateTextBox.Clear();
            }
            catch
            {
                MessageBox.Show("Заполните все поля");
            }
        }
    }
}
