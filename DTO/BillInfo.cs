﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Coffee.DTO
{
    public class BillInfo
    {
        public BillInfo(int id, int billID, int foodID, int count)
        {
            this.ID = id;
            this.BillID = billID;
            this.FoodID = foodID;
            this.Count = count;
        }

        public BillInfo(DataRow row)
        {
            this.ID = (int)row["id"];
            this.BillID = (int)row["idBill"];
            this.FoodID = (int)row["idFood"];
            this.Count = (int)row["count"];
        }

        private int foodID;

        private int billID;

        private int iD;

        private int count;

        public int FoodID { get => foodID; set => foodID = value; }
        public int BillID { get => billID; set => billID = value; }
        public int ID { get => iD; set => iD = value; }
        public int Count { get => count; set => count = value; }
    }
}
