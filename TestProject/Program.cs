using System;
using RunnerTest;

namespace TestProject
{
    class Program
    {
        static void Main(string[] args)
        {
            BankAccount account = new ("Parshad", 50);
            account.Credit(30);
            account.Debit(10);

            Console.WriteLine("Available Balance = " + account.Balance);
            Console.ReadLine();
        }
    }
}
