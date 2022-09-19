using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FIT5032Assignment.Models;

namespace FIT5032Assignment.Controllers
{
    public class BookingsController : Controller
    {
        private Entities db = new Entities();

        // GET: Bookings
        public ActionResult Index()
        {
            var bookingSet = db.BookingSet.Include(b => b.Doctor).Include(b => b.Patient).Include(b => b.Administrator);
            return View(bookingSet.ToList());
        }

        // GET: Bookings/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Booking booking = db.BookingSet.Find(id);
            if (booking == null)
            {
                return HttpNotFound();
            }
            return View(booking);
        }

        // GET: Bookings/Create
        public ActionResult Create()
        {
            ViewBag.DoctorDoctor_Id = new SelectList(db.DoctorSet, "Doctor_Id", "Name");
            ViewBag.PatientPatient_Id = new SelectList(db.PatientSet, "Patient_Id", "First_Name");
            ViewBag.AdministratorAdmin_Id = new SelectList(db.AdministratorSet, "Admin_Id", "Admin_Name");
            return View();
        }

        // POST: Bookings/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Booking_Id,DoctorDoctor_Id,PatientPatient_Id,AdministratorAdmin_Id")] Booking booking)
        {
            if (ModelState.IsValid)
            {
                db.BookingSet.Add(booking);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.DoctorDoctor_Id = new SelectList(db.DoctorSet, "Doctor_Id", "Name", booking.DoctorDoctor_Id);
            ViewBag.PatientPatient_Id = new SelectList(db.PatientSet, "Patient_Id", "First_Name", booking.PatientPatient_Id);
            ViewBag.AdministratorAdmin_Id = new SelectList(db.AdministratorSet, "Admin_Id", "Admin_Name", booking.AdministratorAdmin_Id);
            return View(booking);
        }

        // GET: Bookings/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Booking booking = db.BookingSet.Find(id);
            if (booking == null)
            {
                return HttpNotFound();
            }
            ViewBag.DoctorDoctor_Id = new SelectList(db.DoctorSet, "Doctor_Id", "Name", booking.DoctorDoctor_Id);
            ViewBag.PatientPatient_Id = new SelectList(db.PatientSet, "Patient_Id", "First_Name", booking.PatientPatient_Id);
            ViewBag.AdministratorAdmin_Id = new SelectList(db.AdministratorSet, "Admin_Id", "Admin_Name", booking.AdministratorAdmin_Id);
            return View(booking);
        }

        // POST: Bookings/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Booking_Id,DoctorDoctor_Id,PatientPatient_Id,AdministratorAdmin_Id")] Booking booking)
        {
            if (ModelState.IsValid)
            {
                db.Entry(booking).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.DoctorDoctor_Id = new SelectList(db.DoctorSet, "Doctor_Id", "Name", booking.DoctorDoctor_Id);
            ViewBag.PatientPatient_Id = new SelectList(db.PatientSet, "Patient_Id", "First_Name", booking.PatientPatient_Id);
            ViewBag.AdministratorAdmin_Id = new SelectList(db.AdministratorSet, "Admin_Id", "Admin_Name", booking.AdministratorAdmin_Id);
            return View(booking);
        }

        // GET: Bookings/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Booking booking = db.BookingSet.Find(id);
            if (booking == null)
            {
                return HttpNotFound();
            }
            return View(booking);
        }

        // POST: Bookings/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Booking booking = db.BookingSet.Find(id);
            db.BookingSet.Remove(booking);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
