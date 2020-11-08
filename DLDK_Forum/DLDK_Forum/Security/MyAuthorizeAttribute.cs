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
    public class MyAuthorizeAttribute : AuthorizeAttribute
    {
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            if (filterContext.HttpContext.Request.IsAuthenticated)
            {
                if (SessionPersister.UserName==null)
                {
                    filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new { controller = "Home", action = "Home" }));
                }
                else
                {                    
                    MyPrincipal mp = new MyPrincipal(SessionPersister.UserName);
                if (!mp.IsInRole(Roles))
                    filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new{controller="Home", action= "Login_Logout" }));
                }
            }
        }
    }
}