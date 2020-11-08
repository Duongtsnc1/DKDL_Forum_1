using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DLDK_Forum.Models;
namespace DLDK_Forum.Security
{
    public class SessionPersister 
    {
        static string UserSession = "User";
        public static NguoiDung UserName
        {
            get
            {
                if (HttpContext.Current.Session[UserSession] == null)
                {
                    return null;
                }
                var sessionvar = HttpContext.Current.Session[UserSession];
                if (sessionvar != null)
                {
                    return sessionvar as NguoiDung;
                }
                return null;
            }
            set
            {
                HttpContext.Current.Session[UserSession] = value;
            }
        }
    }
}