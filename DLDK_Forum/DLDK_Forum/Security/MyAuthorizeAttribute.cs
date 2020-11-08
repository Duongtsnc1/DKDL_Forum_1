using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security;
using System.Web.Mvc;
using DLDK_Forum.Models;
using System.Web.Routing;
namespace DLDK_Forum.Security
{
    [AttributeUsage(AttributeTargets.Class|AttributeTargets.Method)]
    public class MyAuthorizeAttribute : AuthorizeAttribute
    {
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            
                if (SessionPersister.UserName==null)
                {
                    filterContext.Result = new RedirectResult("/Home/Home");
                }
                else
                {                    
                    MyPrincipal mp = new MyPrincipal(SessionPersister.UserName);
                if (!mp.IsInRole(Roles))
                    filterContext.Result = new RedirectResult("/Home/Login_Logout");
                }
            
        }
    }
}