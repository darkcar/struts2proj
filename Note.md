# 中文笔记

## 1. 三层架构：

- 表现层：接收和处理请求
          		MVC模型，表现层模型
    				M：模型：封装数据           实体类作为模型
    				V：视图：展示数据           JSP/HTML
    				C：控制器 控制程序流转的。   Servlet/Filter
- 业务层：处理程序业务需求
- 持久层：对数据库操作的。

## 2. Servlet 和 Filter 
Definition: 
Servlet: A servlet is a small Java program that runs within a Web server. Servlet receive and respond to the requests from Web clients, usually across HTTP. 
Filter: A filter is an object that performs filtering tasks on either the request to a resource, or on the response from a resource, or both. 
共同点：
    3个常用方法：初始化、销毁和核心方法（service，doFilter）
    核心方法都有request和response
    都是单例对象
区别：
    创建时间点不同：
        Servlet：请求第一次到达时，资源（就是使用地址栏可以访问）
        Filter：应用一加载，不是资源，相当于保安。

## 3. 动作类`Action`的三种创建方式

1. 无侵入式的
2. 实现接口的方式：动作类实现一个接口`Action`

```java
public class HelloImplAction implements Action {

	@Override
	public String execute() throws Exception {
		System.out.println("Hello from Impl Action");
		return SUCCESS;
	}

}
```

配置文件的配置：

```xml
<action name="hello2" class="com.frank.web.action.HelloImplAction">
			<result name="success" type="dispatcher">/success.jsp</result>
</action>
```

3. 继承`ActionSupport`类的方式 【推荐】:thumbsup:

```java
package com.frank.web.action;

import com.opensymphony.xwork2.ActionSupport;

public class HelloActionSupport extends ActionSupport {
	
}

```

相同的配置文件。我们编写的类，都要继承ActionSupport这个类。

## 4. 动作类的三种访问方式

- 全体配置方式：每一个类的每一个方法都进行配置。

  ```xml
  <package name="user" extends="struts-default">
  		<action name="addUser" class="com.frank.web.user.UserManagementAction" method="addUser">
  			<result name="success" type="dispatcher">/success.jsp</result>
  		</action>
  		<action name="updateUser" class="com.frank.web.user.UserManagementAction" method="updateUser">
  			<result name="success" type="dispatcher">/success.jsp</result>
  		</action>
  	</package>
  ```

- 使用通配符进行配置：`*`

  ```xml
  <package name="user" extends="struts-default">
  	<action name="*" class="com.frank.web.user.UserManagementAction" method="{1}">
  		<result name="success" type="dispatcher">/success.jsp</result>
  	</action>
  </package>
  ```

  - 通配符高级用法

  ```xml
  <package name="user" extends="struts-default">
  	<action name="*_*" class="com.frank.web.user.UserManagementAction" method="{1}{2}">
  		<result name="success" type="dispatcher">/success.jsp</result>
  	</action>
  </package>
  ```

- 使用动态调用的方法:warning::使用这个方法的前提是，开启动态方法调用。

  ```xml
  <!-- After the struts tag -->
  <constant name="struts.enable.DynamicMethodInvocation" value="true" />
  ```

  So, in the url, you can use `/user!addUser` or `/user!updateUser`

## 5. 案例：完成客户的CRM管理【使用Struts2+Hibernate】

## 6 Result 标签

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE struts PUBLIC
    "-//Apache Software Foundation//DTD Struts Configuration 2.3//EN"
    "http://struts.apache.org/dtds/struts-2.3.dtd">
    
<struts>
	<constant name="struts.devMode" value="true"></constant>
	
	<package name="p1" extends="struts-default">
		<action name="demo1" class="com.frank.web.action.Demo1Action">
			<result name="success" type="dispatcher">/success.jsp</result>
		</action>
	</package>
</struts>
```

<strong>Result Tag:</strong>

- 作用：用于配置结果视图（结果视图可以是一个jsp/html，也可以是一个action

- 属性：

  - name：逻辑结果视图（success）作用就是和动作方法的返回值进行比较，当一致时，前往配置的页面或者action。去哪？

  - type：指定前往结果视图的方式。 怎么去？

    ```xml
    <result-types>
                <result-type name="chain" class="com.opensymphony.xwork2.ActionChainResult"/>
                <result-type name="dispatcher" class="org.apache.struts2.dispatcher.ServletDispatcherResult" default="true"/>
                <result-type name="freemarker" class="org.apache.struts2.views.freemarker.FreemarkerResult"/>
                <result-type name="httpheader" class="org.apache.struts2.dispatcher.HttpHeaderResult"/>
                <result-type name="redirect" class="org.apache.struts2.dispatcher.ServletRedirectResult"/>
                <result-type name="redirectAction" class="org.apache.struts2.dispatcher.ServletActionRedirectResult"/>
                <result-type name="stream" class="org.apache.struts2.dispatcher.StreamResult"/>
                <result-type name="velocity" class="org.apache.struts2.dispatcher.VelocityResult"/>
                <result-type name="xslt" class="org.apache.struts2.views.xslt.XSLTResult"/>
                <result-type name="plainText" class="org.apache.struts2.dispatcher.PlainTextResult" />
                <result-type name="postback" class="org.apache.struts2.dispatcher.PostbackResult" />
            </result-types>
    ```

    常用的结果类型：

    - dispatcher：请求转发
    - redirect：重定向
    - redirectAction：重定向到另外一个动作。

    | 区别   | 1        | 2          | 3                  | 4          | 5                    |
    | ------ | -------- | ---------- | ------------------ | ---------- | -------------------- |
    | 重定向 | 两次请求 | 地址栏变化 | 请求域中数据丢失   | 浏览器行为 | 可以定向到应用外部   |
    | 转发   | 一次请求 | 地址栏不变 | 请求域中数据不丢失 | 服务器行为 | 只能在当前应用中转发 |

### 6.1 全局结果视图和局部结果视图

Action先找局部结果，然后再找全局结果。 如何配置父包的继承呢？

```xml
<struts>
	<constant name="struts.devMode" value="true"></constant>
	<package name="defaultPack" extends="struts-default"
		abstract="true">
		<global-results>
			<result name="login" type="redirect">/login.jsp</result>
		</global-results>
	</package>

	<package name="p1" extends="defaultPack">
		<action name="demo1" class="com.frank.web.action.Demo1Action"
			method="demo1">
			<result name="error" type="dispatcher">/success.jsp</result>
		</action>
	</package>
</struts> 
```

`name`的其他值都有哪些呢？

```java
  // Field descriptor #4 Ljava/lang/String;
  public static final java.lang.String SUCCESS = "success";
  
  // Field descriptor #4 Ljava/lang/String;
  public static final java.lang.String NONE = "none";
  
  // Field descriptor #4 Ljava/lang/String;
  public static final java.lang.String ERROR = "error";
  
  // Field descriptor #4 Ljava/lang/String;
  public static final java.lang.String INPUT = "input";
  
  // Field descriptor #4 Ljava/lang/String;
  public static final java.lang.String LOGIN = "login";
```

## 7 Servlet API

访问`ServletAPI`方式：

- 使用struts2框架提供的工具类，该类包含了相应的静态方法，可以直接获取。[开发中用的最多的方式]

  `ServletActionContext` 

  ```java
  public class DemoAction extends ActionSupport {
  	
  	private HttpServletRequest request;
  	private HttpServletResponse response;
  	private HttpSession session;
  	private ServletContext context;
  	
  	public String request_uri() {
  		request = ServletActionContext.getRequest();
  		response = ServletActionContext.getResponse();
  		session = request.getSession();
  		context = ServletActionContext.getServletContext();
  		System.out.println(request + ", " + response + ", " + session + ", " + context);
  		System.out.println("---------");
  		return SUCCESS;
  	}
  }	
  ```

  The message printed in the console is: 

  ```verilog
  org.apache.struts2.dispatcher.StrutsRequestWrapper@6d114adb, // HttpServelteRequest
  org.apache.catalina.connector.ResponseFacade@64a0a919,   // HttpServletResponse
  org.apache.catalina.session.StandardSessionFacade@47369666,  // HttpSession
  org.apache.catalina.core.ApplicationContextFacade@699201fb    // ServletContext
  
  ```

  `HttpServletRequest`是struts2提供的包装类，只是对`HttpServletRequest`中方法的增强。

- 第二种方式：通过实现不同的接口，获取不同的对象。

  使用request：需要实现`ServletRequestAware`

  使用response：需要实现`ServletResponseAware`

  使用servletContext：需要实现`ServletContextAware`

08访问servletAPI的第二种方式