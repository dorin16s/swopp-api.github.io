using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using WebApplication5.Models;
using WebApplication5.Services;
using Microsoft.Azure;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;
using Microsoft.WindowsAzure.Storage.File; // Namespace for Azure Files

namespace WebApplication5.Controllers
{
    public class ContactController : ApiController
    {
        public ContactRepository contactRepository;

        public ContactController()
        {
            this.contactRepository = new ContactRepository();
        }
        public Contact[] Get()
        {
            return contactRepository.GetAllContacts();

        }


        public HttpResponseMessage Post(preference pr)
        {

          

            string respons = this.contactRepository.calcMap(pr);
            var response = Request.CreateResponse<string>(System.Net.HttpStatusCode.Created, respons);

            return response;
        }
    }
}