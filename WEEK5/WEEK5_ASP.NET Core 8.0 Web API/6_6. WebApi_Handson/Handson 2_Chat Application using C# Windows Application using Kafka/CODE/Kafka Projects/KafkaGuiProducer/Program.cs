using System;
using System.Windows.Forms;

namespace KafkaGuiProducer
{
    internal static class Program
    {
        [STAThread]
        static void Main()
        {
            ApplicationConfiguration.Initialize();
            Application.Run(new Form1()); // <--- THIS
        }
    }
}
