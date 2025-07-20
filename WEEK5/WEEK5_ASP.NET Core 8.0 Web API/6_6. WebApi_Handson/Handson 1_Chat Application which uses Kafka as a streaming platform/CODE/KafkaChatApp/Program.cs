using System;
using System.Threading.Tasks;
using Confluent.Kafka;

class Program
{
    public static async Task Main(string[] args)
    {
        var config = new ProducerConfig
        {
            BootstrapServers = "localhost:9092"
        };

        using var producer = new ProducerBuilder<Null, string>(config).Build();

        Console.WriteLine("🟢 Kafka Chat Producer started. Type your message below 👇 (type 'exit' to quit):");

        while (true)
        {
            Console.Write("You: ");
            var message = Console.ReadLine();

            if (message?.ToLower() == "exit")
                break;

            try
            {
                var result = await producer.ProduceAsync(
                    "chat-topic", new Message<Null, string> { Value = message });

                Console.WriteLine($"✅ Sent to Kafka (offset: {result.Offset})");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"❌ Error sending message: {ex.Message}");
            }
        }

        Console.WriteLine("❎ Chat ended. Bye!");
    }
}
