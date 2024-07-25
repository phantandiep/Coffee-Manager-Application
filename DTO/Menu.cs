using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Coffee.DTO
{
    public class Menu
    {
        public Menu(int count, string foodName, float price, float totalPrice = 0)
        {
            this.Count = count;
            this.FoodName = foodName;
            this.Price = price;
            this.TotalPrice = totalPrice;
        }

        public Menu(DataRow row)
        {
            this.FoodName = row["name"].ToString();
            this.Count = (int)row["count"];
            this.price = (float)Convert.ToDouble(row["price"].ToString());
            this.totalPrice = (float)Convert.ToDouble(row["totalPrice"].ToString());
        }

        private int count;
        private string foodName;
        private float price;
        private float totalPrice;

        public int Count { get => count; set => count = value; }
        public string FoodName { get => foodName; set => foodName = value; }
        public float Price { get => price; set => price = value; }
        public float TotalPrice { get => totalPrice; set => totalPrice = value; }
    }
}
