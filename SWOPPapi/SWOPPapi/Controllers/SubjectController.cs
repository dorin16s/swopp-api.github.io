using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace SWOPPapi.Controllers
{
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.EntityFrameworkCore;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using SWOPPapi.Models;

    namespace TodoApi.Controllers
    {
        [Route("api/[controller]")]
        [ApiController]
        public class TodoController : ControllerBase
        {
            private readonly subject _context;

            public TodoController(subject context)
            {

            }

            [HttpGet("{test}")]
            public async Task<ActionResult<subject>> GetTodoItem(String test)
            {
                return null;
            }

        }
    }
}