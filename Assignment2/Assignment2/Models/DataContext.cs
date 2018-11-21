using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Assignment2.Models
{
    public class DataContext : DbContext
    {
        public DbSet<Post> Posts { get; set; }
        public DbSet<Students> Students { get; set; }

        public DataContext(DbContextOptions<DataContext> options) 
            :base(options)
        {
            Database.EnsureCreated();
        }

    }
}
