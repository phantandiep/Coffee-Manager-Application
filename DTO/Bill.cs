using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Coffee.DTO
{
    public class Bill
    {
        public Bill(int id, DateTime? checkin, DateTime? checkout, int status)
        {
            this.ID = id;
            this.DateCheckIn = checkin;
            this.DateCheckOut = checkout;
            this.Status = status;
        }

        public Bill(DataRow row)
        {
            this.ID = (int)row["id"];
            this.Status = (int)row["status"];
            this.DateCheckIn = (DateTime?)row["dateCheckIn"];
            
            var dateCheckOutTemp = row["dateCheckOut"];
            if (dateCheckOutTemp.ToString() != "") this.DateCheckOut = (DateTime?)dateCheckOutTemp;
        }

        private int status;

        private int iD;

        private DateTime? dateCheckIn;

        private DateTime? dateCheckOut;
        public int ID { get => iD; set => iD = value; }
        public DateTime? DateCheckIn { get => dateCheckIn; set => dateCheckIn = value; }
        public DateTime? DateCheckOut { get => dateCheckOut; set => dateCheckOut = value; }
        public int Status { get => status; set => status = value; }
    }
}
