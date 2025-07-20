using Confluent.Kafka;
using System;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace KafkaGuiConsumer
{
    public partial class Form1 : Form
    {
        private ListBox listBox1;
        private CancellationTokenSource cts;

        public Form1()
        {
            InitializeComponent();
            StartKafkaConsumer();
        }

        private void InitializeComponent()
        {
            this.listBox1 = new ListBox();

            this.listBox1.Location = new System.Drawing.Point(12, 12);
            this.listBox1.Size = new System.Drawing.Size(360, 230);

            this.ClientSize = new System.Drawing.Size(384, 261);
            this.Controls.Add(this.listBox1);
            this.Text = "Kafka Chat Consumer";
        }

        private void StartKafkaConsumer()
        {
            var config = new ConsumerConfig
            {
                BootstrapServers = "localhost:9092",
                GroupId = Guid.NewGuid().ToString(),
                AutoOffsetReset = AutoOffsetReset.Earliest
            };

            cts = new CancellationTokenSource();

            Task.Run(() =>
            {
                using var consumer = new ConsumerBuilder<Ignore, string>(config).Build();
                consumer.Subscribe("chat-topic");

                try
                {
                    while (!cts.Token.IsCancellationRequested)
                    {
                        var cr = consumer.Consume(cts.Token);
                        Invoke(new Action(() =>
                        {
                            listBox1.Items.Add("Received: " + cr.Message.Value);
                        }));
                    }
                }
                catch (OperationCanceledException) { }
                finally
                {
                    consumer.Close();
                }
            });
        }

        protected override void OnFormClosing(FormClosingEventArgs e)
        {
            cts.Cancel();
            base.OnFormClosing(e);
        }
    }
}
