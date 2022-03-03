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
        if (name.equals("code")) {
            int number = (int) servletContext.getAttribute("number");
            List<Object> allUser = (List<Object>) servletContext.getAttribute("allUser");
            number++;
            //allUser.add()
            servletContext.setAttribute("number", number);
            servletContext.setAttribute("allUser", allUser);
        }

        /*String name = httpSessionBindingEvent.getName();
        System.out.println("add监听器：" + name);
        if (name.equals("user")) {
            list.add(httpSessionBindingEvent.getValue());
        }
        //list去重复
        HashSet<Object> hs = new HashSet<>(list);
        ServletContext application = httpSessionBindingEvent.getSession().getServletContext();
        application.setAttribute("number", hs.size());
        application.setAttribute("alluser", hs);*/
        //getName:拿到设置的名字
        //getValue:拿到值
		/*String name = httpSessionBindingEvent.getName();
		HttpSession session = se.getSession();
		System.out.println("name:"+name);
		System.out.println(httpSessionBindingEvent.getValue());
		System.out.println(httpSessionBindingEvent.getSession());
		list.add(session);
		//list去重复
		HashSet<Object> hs = new HashSet<Object>(list);
		ServletContext application = httpSessionBindingEvent.getSession().getServletContext();
		application.setAttribute("number", hs.size());*/
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent httpSessionBindingEvent) {
        ServletContext application = httpSessionBindingEvent.getSession().getServletContext();
        List<Object> list = (List<Object>) application.getAttribute("alluser");
        String name = httpSessionBindingEvent.getName();
        System.out.println("remove监听器：" + name);
        if (name.equals("user")) {
            list.remove(httpSessionBindingEvent.getValue());
        }
        application.setAttribute("number", list.size());
        application.setAttribute("alluser", list);
		/*System.out.println("attributeRemoved");
		String name = httpSessionBindingEvent.getName();
		System.out.println("name:"+name);
		HttpSession session = httpSessionBindingEvent.getSession();
		list.remove(session);
		HashSet<Object> hs = new HashSet<Object>(list);
		ServletContext application = httpSessionBindingEvent.getSession().getServletContext();
		application.setAttribute("number", hs.size());*/
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
