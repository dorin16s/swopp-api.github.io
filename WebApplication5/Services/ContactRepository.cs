using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplication5.Models;
using System.IO;
using static System.Net.Mime.MediaTypeNames;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;
using Microsoft.WindowsAzure.Storage.File;
using Microsoft.Azure;

namespace WebApplication5.Services
{

    public class ContactRepository
    {
        private const string CacheKey = "ContactStore";

        public ContactRepository()
        {
            var ctx = HttpContext.Current;

            if (ctx != null)
            {
                if (ctx.Cache[CacheKey] == null)
                {
                    var contacts = new Contact[]
                    {
                new Contact
                {
                    Id = 1, Name = "Glenn Block"
                },
                new Contact
                {
                    Id = 2, Name = "Dan Roth"
                }
                    };

                    ctx.Cache[CacheKey] = contacts;
                }
            }
        }



        internal string calcMap(preference pr)
        {

            CloudStorageAccount storageAccount = CloudStorageAccount.Parse(CloudConfigurationManager.GetSetting("AzureStorageConnectionString-1"));
            CloudFileClient fileClient = storageAccount.CreateCloudFileClient();

            // Get a reference to the file share we created previously.
            CloudFileShare share = fileClient.GetShareReference("swopp-files");

            // Ensure that the share exists.
            if (share.Exists())
            {
                // Get a reference to the root directory for the share.
                CloudFileDirectory rootDir = share.GetRootDirectoryReference();

                // Get a reference to the directory we created previously.
                CloudFileDirectory sampleDir = rootDir.GetDirectoryReference("CustomLogs");

                // Ensure that the directory exists.
                if (sampleDir.Exists())
                {
                    // Get a reference to the file we created previously.
                    CloudFile file = sampleDir.GetFileReference("Log1.txt");

                    // Ensure that the file exists.
                    if (file.Exists())
                    {
                        // Write the contents of the file to the console window.
                        Console.WriteLine(file.DownloadTextAsync().Result);
                    }
                }
            }
            Dictionary<string, int> prefernces = new Dictionary<string, int>();
    
          
            string map = "";
            int geometryCost = 1;
            int decimalcost = 1;
            int naturalcost = 1;
     

            //prefer geometry over decimal
            if (pr.q1 == 1)
                decimalcost += 2;
            else
                geometryCost += 2;

            //prefer geometry over natural
            if (pr.q2 == 1)
                naturalcost += 2;
            else
                geometryCost += 2;

            //prefer decimal over natural
            if (pr.q3 == 1)
                decimalcost += 2;
            else
                geometryCost += 2;

            prefernces["Decimalrepresentation"]= decimalcost;
            prefernces["DecimaladdSub"] = decimalcost;
            if (pr.q4 == 1)
                prefernces["Decimalrepresentation"] += 1;
            else
                prefernces["DecimaladdSub"] += 1;


           prefernces["geomerySqaures"] = geometryCost;
           prefernces["geometryheight"] = geometryCost;
            if (pr.q5 == 1)
                prefernces["geometryheight"] += 1;
            else
                prefernces["geomerySqaures"] += 1;


            prefernces["NaturalOrder"] = naturalcost;
            prefernces["NaturalDivation"] = naturalcost; if (pr.q6 == 1)
                prefernces["NaturalDivation"] += 1;
            else
                prefernces["NaturalOrder"] += 1;

            string id= pr.ID + "-" +pr.name + "-" + pr.lastName;
            var ctx = HttpContext.Current;

     
           //  map = NetworkAttack.Program.runStudentApp(id,prefernces, "");
            // creatPddlWithPreference(geomerySqaures, geometryheight)
            return map;
        }



        public Contact[] GetAllContacts()
        {
            var ctx = HttpContext.Current;

            if (ctx != null)
            {
                return (Contact[])ctx.Cache[CacheKey];
            }

            return new Contact[]
                {
            new Contact
            {
                Id = 0,
                Name = "Placeholder"
            }
                };
        }

        public bool SaveContact(Contact contact)
        {
            var ctx = HttpContext.Current;

            if (ctx != null)
            {
                try
                {
                    var currentData = ((Contact[])ctx.Cache[CacheKey]).ToList();
                    currentData.Add(contact);
                    ctx.Cache[CacheKey] = currentData.ToArray();

                    return true;
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.ToString());
                    return false;
                }
            }

            return false;
        }
    }
}