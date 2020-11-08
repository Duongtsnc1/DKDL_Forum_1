using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Security.Principal;
using DLDK_Forum.Models;

namespace DLDK_Forum.Security
{
    public class MyPrincipal : IPrincipal
    {
        private NguoiDung account = new NguoiDung();
        public NguoiDung Account
        {
            get { return account; }
            set { account = value; }
        }
        public MyPrincipal(NguoiDung ND)
        {
            this.Account = ND;
            this.Identity = new GenericIdentity(ND.Email);
        }
        public IIdentity Identity { get; set; }

        public bool IsInRole(string role)
        {
            var roles = role.Split(new char[] { ',' });              
            return roles.Any(r =>this.account.QuyenAdmin.Contains(r) );
        }
    }
}