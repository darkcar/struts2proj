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



