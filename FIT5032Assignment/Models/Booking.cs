//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FIT5032Assignment.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Booking
    {
        public int Booking_Id { get; set; }
        public string DoctorDoctor_Id { get; set; }
        public string PatientPatient_Id { get; set; }
        public string AdministratorAdmin_Id { get; set; }
    
        public virtual Doctor Doctor { get; set; }
        public virtual Patient Patient { get; set; }
        public virtual Administrator Administrator { get; set; }
    }
}
