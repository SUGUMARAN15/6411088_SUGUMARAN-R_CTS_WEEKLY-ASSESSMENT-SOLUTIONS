using Confluent.Kafka;
using System;
using System.Windows.Forms;

namespace KafkaGuiProducer
{
    public partial class Form1 : Form
    {
        private IProducer<Null, string> _producer;
        private TextBox txtMessage;
        private Button btnSend;
        private ListBox listBox1;

        public Form1()
        {
            InitializeComponent();

            var config = new ProducerConfig
            {
                BootstrapServers = "localhost:9092"
            };

            _producer = new ProducerBuilder<Null, string>(config).Build();
        }

        private void InitializeComponent()
        {
            this.txtMessage = new TextBox();
            this.btnSend = new Button();
            this.listBox1 = new ListBox();

            this.SuspendLayout();

            // txtMessage
            this.txtMessage.Location = new System.Drawing.Point(12, 12);
            this.txtMessage.Size = new System.Drawing.Size(260, 23);

            // btnSend
            this.btnSend.Location = new System.Drawing.Point(278, 12);
            this.btnSend.Size = new System.Drawing.Size(75, 23);
            this.btnSend.Text = "Send";
            this.btnSend.Click += new EventHandler(this.btnSend_Click);

            // listBox1
            this.listBox1.Location = new System.Drawing.Point(12, 50);
            this.listBox1.Size = new System.Drawing.Size(341, 200);

            // Form1
            this.ClientSize = new System.Drawing.Size(370, 270);
            this.Controls.Add(this.txtMessage);
            this.Controls.Add(this.btnSend);
            this.Controls.Add(this.listBox1);
            this.Text = "Kafka Chat Producer";

            this.ResumeLayout(false);
            this.PerformLayout();
        }

        private async void btnSend_Click(object sender, EventArgs e)
        {
            string message = txtMessage.Text;

            if (!string.IsNullOrWhiteSpace(message))
            {
                await _producer.ProduceAsync("chat-topic", new Message<Null, string> { Value = message });
                listBox1.Items.Add("You: " + message);
                txtMessage.Clear();
            }
        }
    }
}
