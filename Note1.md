# 中文Struts2笔记 - Part 1

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
  
  ```xml
  默认的拦截器：
  <interceptor-stack name="basicStack">
  	<interceptor-ref name="exception"/>
  	<interceptor-ref name="servletConfig"/>
  	<interceptor-ref name="prepare"/>
  	<interceptor-ref name="checkbox"/>
  	<interceptor-ref name="datetime"/>
  	<interceptor-ref name="multiselect"/>
  	<interceptor-ref name="actionMappingParams"/>
  	<interceptor-ref name="params"/>
  	<interceptor-ref name="conversionError"/>
  	<interceptor-ref name="deprecation"/>
  </interceptor-stack>
  ```
  
  起作用的拦截器就是`servletConfig`. 如果注释一下这个拦截器，就会造成获取不了servletConfig这个对象。
  
- 也可以有三种方式：使用`ActionContext`中的get(key)方法。

## 8. 请求参数封装

1. 动作类和表单数据放在一起的情况。

   要求：表单元素的name属性取值，必须和动作类中成员get/set方法后面的部分保持一致。

   应用场景：不需要数据库，分页情况下

   ```java
   public class DemoAction extends ActionSupport {
   	
   	private String username;
   	private Integer age;
   	private Date birth;
   	private String hobby;
   	
   	public String demo1() {
   		System.out.println(username + "====" + age + "=====" + birth + "=====" + hobby);
   		return SUCCESS;
   	}
   	
   	public String getUsername() {
   		return username;
   	}
   
   	public void setUsername(String username) {
   		this.username = username;
   	}
   	public Integer getAge() {
   		return age;
   	}
   	public void setAge(Integer age) {
   		this.age = age;
   	}
   	public Date getBirth() {
   		return birth;
   	}
   
   	public void setBirth(Date birth) {
   		this.birth = birth;
   	}
   	public String getHobby() {
   		return hobby;
   	}
   	public void setHobby(String hobby) {
   		this.hobby = hobby;
   	}
   }	
   
   ```

   表单form：

   ```html
   <form action="${pageContext.request.contextPath }/request_uri" method="post">
   	Name: <input type="text" name="username"/> <br>
   	Age: <input type="text" name="age"/> <br/>
   	Birth: <input type="text" name="birth"/> <br/>
   	Hobby: <input type="checkbox" name="hobby" value="swimming" /> Swimming
   		<input type="checkbox" name="hobby" value="coding" /> Coding
   		<input type="checkbox" name="hobby" value="eating"/> Eating<br>
   	<input type="submit" value="Submit"/>
   </form> 
   ```

   <strong>请求参数的一些细节：</strong>

   - struts2框架会自动为我们转换数据类型，基本的数据类型，字符串数组会按照逗号+空格的形式拼接。日期类型会按照本地格式转换成日期对象。
   - 执行的参数封装，是一个params的拦截器实现的。

2. 有实体类的封装

   想要封装成功需要使用OGNL表达式来制定表单元素的name去值。

   OGNL：Object	Graph	Navigation	Language(对象图导航语言)

   写法：`user.username` `user.age` ，下一步的流程就是在动作类中，找到对应的类。

   + 创建一个实体类：

     ```java
     package com.frank.entity;
     
     import java.util.Date;
     
     public class User {
     	private String username;
     	private Integer age;
     	private Date birth;
     	private String hobby;
     	public String getUsername() {
     		return username;
     	}
     	public void setUsername(String username) {
     		this.username = username;
     	}
     	public Integer getAge() {
     		return age;
     	}
     	public void setAge(Integer age) {
     		this.age = age;
     	}
     	public Date getBirth() {
     		return birth;
     	}
     	public void setBirth(Date birth) {
     		this.birth = birth;
     	}
     	public String getHobby() {
     		return hobby;
     	}
     	public void setHobby(String hobby) {
     		this.hobby = hobby;
     	}
     	@Override
     	public String toString() {
     		// TODO Auto-generated method stub
     		return username + ", " + age + ", " + birth + ", " + hobby;
     	}
     }
     
     ```

   + 创建动作类：

     ```java
     public class DemoAction extends ActionSupport {
     	
     	private User user;
     	public User getUser() {
     		return user;
     	}
     	public void setUser(User user) {
     		this.user = user;
     	}
     	public String demo1() {
     		System.out.println(user);
     		return SUCCESS;
     	}
     }	
     
     ```

   + 需要使用OGNL表达式更改表单元素

     ```jsp
     <form action="${pageContext.request.contextPath }/request_uri" method="post">
     	Name: <input type="text" name="user.username"/> <br>
     	Age: <input type="text" name="user.age"/> <br/>
     	Birth: <input type="text" name="user.birth"/> <br/>
     	Hobby: <input type="checkbox" name="user.hobby" value="swimming" /> Swimming
     		<input type="checkbox" name="user.hobby" value="coding" /> Coding
     		<input type="checkbox" name="user.hobby" value="eating"/> Eating<br>
     	<input type="submit" value="Submit"/>
     </form> 
     ```

3. 模型驱动:除了params拦截器之外，还需要一个叫modelDriven拦截器。(使用最多的一种方式)

   - 动作类必须实现`ModelDriven`接口
   - 动作类中需要定义模型，并且必须实例化出来
   - 提供接口抽象的方法的实现，返回值必须调用set方法赋值。

   ```java
   public class DemoAction extends ActionSupport implements ModelDriven<User> {
   
   	private User user = new User();
   
   	public User getUser() {
   		return user;
   	}
   
   	public String demo1() {
   		System.out.println(user);
   		return SUCCESS;
   	}
   
   	@Override
   	public User getModel() {
   		return user;
   	}
   }
   
   ```

4. 复杂类型的封装：

   - List集合的封装

     ```jsp
     <form action="${pageContext.request.contextPath }/request_uri" method="post">
     	Name: <input type="text" name="users[0].username"/> <br>
     	Age: <input type="text" name="users[0].age"/> <br/>
     	Birth: <input type="text" name="users[0].birth"/> <br/>
     	Hobby: <input type="checkbox" name="users[0].hobby" value="swimming" /> Swimming
     		<input type="checkbox" name="users[0].hobby" value="coding" /> Coding
     		<input type="checkbox" name="users[0].hobby" value="eating"/> Eating<br>
     		
     	Name: <input type="text" name="users[1].username"/> <br>
     	Age: <input type="text" name="users[1].age"/> <br/>
     	Birth: <input type="text" name="users[1].birth"/> <br/>
     	Hobby: <input type="checkbox" name="users[1].hobby" value="swimming" /> Swimming
     		<input type="checkbox" name="users[1].hobby" value="coding" /> Coding
     		<input type="checkbox" name="users[1].hobby" value="eating"/> Eating<br>
     		
     	Name: <input type="text" name="users[2].username"/> <br>
     	Age: <input type="text" name="users[2].age"/> <br/>
     	Birth: <input type="text" name="users[2].birth"/> <br/>
     	Hobby: <input type="checkbox" name="users[2].hobby" value="swimming" /> Swimming
     		<input type="checkbox" name="users[2].hobby" value="coding" /> Coding
     		<input type="checkbox" name="users[2].hobby" value="eating"/> Eating<br>
     	<input type="submit" value="Submit"/>
     </form> 
     ```

     ```java
     public class DemoAction extends ActionSupport implements ModelDriven<List<User>> {
     	
     	private List<User> users = new ArrayList<User>();
     	public List<User> getUsers() {
     		return users;
     	}
     	
     	public String demo1() {
     		for(User user : users) {
     			System.out.println(user);
     		}
     		return SUCCESS;
     	}
     
     	@Override
     	public List<User> getModel() {
     		return users;
     	}
     }
     ```

   - Map集合的封装

     ```jsp
     <form action="${pageContext.request.contextPath }/request_uri" method="post">
     	Name: <input type="text" name="users['key1'].username"/> <br>
     	Age: <input type="text" name="users['key1'].age"/> <br/>
     	Birth: <input type="text" name="users['key1'].birth"/> <br/>
     	Hobby: <input type="checkbox" name="users['key1'].hobby" value="swimming" /> Swimming
     		<input type="checkbox" name="users['key1'].hobby" value="coding" /> Coding
     		<input type="checkbox" name="users['key1'].hobby" value="eating"/> Eating<br>
     		
     	Name: <input type="text" name="users['key2'].username"/> <br>
     	Age: <input type="text" name="users['key2'].age"/> <br/>
     	Birth: <input type="text" name="users['key2'].birth"/> <br/>
     	Hobby: <input type="checkbox" name="users['key2'].hobby" value="swimming" /> Swimming
     		<input type="checkbox" name="users['key2'].hobby" value="coding" /> Coding
     		<input type="checkbox" name="users['key2'].hobby" value="eating"/> Eating<br>
     		
     	Name: <input type="text" name="users['key3'].username"/> <br>
     	Age: <input type="text" name="users['key3'].age"/> <br/>
     	Birth: <input type="text" name="users['key3'].birth"/> <br/>
     	Hobby: <input type="checkbox" name="users['key3'].hobby" value="swimming" /> Swimming
     		<input type="checkbox" name="users['key3'].hobby" value="coding" /> Coding
     		<input type="checkbox" name="users['key3'].hobby" value="eating"/> Eating<br>
     	<input type="submit" value="Submit"/>
     </form>
     ```

     ```java
     public class DemoAction extends ActionSupport {
     	
     	private Map<String, User> users = new HashMap<String, User>();
     	public Map<String, User> getUsers() {
     		return users;
     	}
     	
     	
     	public String demo1() {
     		System.out.println(users.get("key1"));
     		System.out.println(users.get("key2"));
     		System.out.println(users.get("key3"));
     		return SUCCESS;
     	}
     }
     
     ```

     因为已经使用了OGNL表达式，所以不需要实现ModelDriven接口。 

5. 如果出现数据类型不匹配的封装如何解决呢？

   比如在表单中，有一个日期的选项，struts2只能够接受一种格式的日期，如果用户输入的日期格式，不符合规定，就会出现这样的问题。

   ```xml
   <!-- Struts 的配置文件中，result有个input标签 -->
   	<action name="request_uri" class="com.frank.web.action.DemoAction" method="demo2">
   			<result name="success" type="dispatcher">/success.jsp</result>
   			<result name="input">/user.jsp</result>
   		</action>
   ```

   如何解决呢？使用Struts2提供的标签库，或者使用EL表达式来获取存储的数值。

   - <b>添加Input结果视图</b>
   - <b>显示错误信息</b>
   - <b>提交数据回显</b>
   
   ```jsp
   #1 Method 1
   <form action="${pageContext.request.contextPath }/request_uri" method="post">
   	Name: <input type="text" name="username"/> <s:fielderror fieldName="username" /> <br>
   	Age: <input type="text" name="age"/><s:fielderror fieldName="age" /> <br/>
   	Birth: <input type="text" name="birth"/> <s:fielderror fieldName="birth" /><br/>
   	Hobby: <input type="checkbox" name="hobby" value="swimming" /> Swimming
   		<input type="checkbox" name="hobby" value="coding" /> Coding
   		<input type="checkbox" name="hobby" value="eating"/> Eating<br>
   		<input type="submit" value="Submit"/>
   </form>
   
   #2 Method 2 - Use Struts2 Tag lib
   <s:form action="demo2">
   	<s:textfield name="username" label="Name"/>
   	<s:textfield name="age" label="Age" />
   	<s:textfield name="birth" label="Birth" />
   	<s:submit value="Submit" />
   </s:form>
   ```