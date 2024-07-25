using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Coffee.DAO
{
    public class Category
    {
        public Category(int id, string name)
        {
            this.ID = id;
            this.Name = name;
        }

        public Category(DataRow row)
        {
            this.ID = (int)row["id"];
            this.Name = row["name"].ToString();
        }

        private string name;
        private int iD;

        public string Name { get => name; set => name = value; }
        public int ID { get => iD; set => iD = value; }
    }
}
