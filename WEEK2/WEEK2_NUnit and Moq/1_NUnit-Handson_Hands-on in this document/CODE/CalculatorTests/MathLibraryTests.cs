using NUnit.Framework;
using CalcLibrary; // 

namespace CalculatorTests
{
    [TestFixture]
    public class MathLibraryTests
    {
        private SimpleCalculator calculator;

        [SetUp]
        public void Setup()
        {
            calculator = new SimpleCalculator();
        }

        [Test]
        [TestCase(2, 3, 5)]
        [TestCase(10.5, 4.5, 15)]
        public void Addition_ShouldReturnCorrectResult(double a, double b, double expected)
        {
            double result = calculator.Addition(a, b);
            Assert.That(result, Is.EqualTo(expected).Within(0.001));
        }

        [Test]
        [TestCase(5, 2, 3)]
        [TestCase(10.5, 0.5, 10)]
        public void Subtraction_ShouldReturnCorrectResult(double a, double b, double expected)
        {
            double result = calculator.Subtraction(a, b);
            Assert.That(result, Is.EqualTo(expected).Within(0.001));
        }

        [Test]
        [TestCase(2, 3, 6)]
        [TestCase(1.5, 2, 3)]
        public void Multiplication_ShouldReturnCorrectResult(double a, double b, double expected)
        {
            double result = calculator.Multiplication(a, b);
            Assert.That(result, Is.EqualTo(expected).Within(0.001));
        }

        [Test]
        [TestCase(10, 2, 5)]
        [TestCase(9, 3, 3)]
        public void Division_ShouldReturnCorrectResult(double a, double b, double expected)
        {
            double result = calculator.Division(a, b);
            Assert.That(result, Is.EqualTo(expected).Within(0.001));
        }

        [Test]
        public void Division_ByZero_ShouldThrowException()
        {
            Assert.Throws<System.ArgumentException>(() => calculator.Division(5, 0));
        }

        [TearDown]
        public void Cleanup()
        {
            calculator.AllClear();
        }
    }
}
