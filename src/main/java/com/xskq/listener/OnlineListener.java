package com.xskq.listener;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

/**
 * Title: <br>
 * Description: <br>
 * Company: wondersgroup.com <br>
 *
 * @author zwq
 * @version 1.0
 */
public class OnlineListener implements HttpSessionAttributeListener, HttpSessionListener {

    @Override
    public void attributeAdded(HttpSessionBindingEvent httpSessionBindingEvent) {
        ServletContext servletContext = httpSessionBindingEvent.getSession().getServletContext();
        String name = httpSessionBindingEvent.getName();
        Object value = httpSessionBindingEvent.getValue();
        if (name.equals("code")) {
            HashSet<Object> hashSet;
            if (servletContext.getAttribute("online") == null) {
                hashSet = new HashSet<>();
            } else {
                hashSet = (HashSet<Object>) servletContext.getAttribute("online");
            }
            hashSet.add(httpSessionBindingEvent.getValue());
            servletContext.setAttribute("number", hashSet.size());
            servletContext.setAttribute("online", hashSet);
        }
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent httpSessionBindingEvent) {
        ServletContext application = httpSessionBindingEvent.getSession().getServletContext();
        HashSet<Object> hashSet = (HashSet<Object>) application.getAttribute("online");
        String name = httpSessionBindingEvent.getName();
        if (name.equals("code")) {
            hashSet.remove(httpSessionBindingEvent.getValue());
        }
        application.setAttribute("number", hashSet.size());
        application.setAttribute("online", hashSet);
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent httpSessionBindingEvent) {

    }

    @Override
    public void sessionCreated(HttpSessionEvent httpSessionEvent) {

    }

    @Override
    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {

    }
}
