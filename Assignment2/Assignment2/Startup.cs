using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Assignment2.Models;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace Assignment2
{
    public class Startup
    {
        // This method gets called by the runtime. Use this method to add services to the container.
        // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddMvc();
            services.AddAuthorization(options =>
            {
                options.AddPolicy("TutorOnly", policy => policy.RequireClaim("tutorID"));
            });
            services.AddTransient<SpecialsDataContext>();
            string connectionString = "Data Source=192.168.0.149;Initial Catalog=mydb;User ID=SA;Password=P@ssw0rd;";

            services.AddDbContext<DataContext>(options =>
            {
                options.UseSqlServer(connectionString);
            });

            services.AddDbContext<IdentityDbContext>(options =>
                options.UseSqlServer(connectionString,
                optionsBuilders => 
                    optionsBuilders.MigrationsAssembly("Assignment2")));
                    

            services.AddIdentity<IdentityUser, IdentityRole>()
                .AddEntityFrameworkStores<IdentityDbContext>()
                .AddDefaultTokenProviders();

            
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            var configuration = new Microsoft.Extensions.Configuration.ConfigurationBuilder()
                                                                        .AddEnvironmentVariables()
                                                                        .Build();

            app.UseAuthentication();

            app.UseMvc(routes =>
            {
                routes.MapRoute("Default",
                    "{controller=Home}/{action=Index}/{id:int?}"
                    );
            });

            app.UseFileServer();

        }
    }
}
