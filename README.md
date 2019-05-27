# Struts2
Build Struts2 Project

Apache Struts is a free, open-source, MVC framework for creating elegant, modern Java Web applications. It favors convention over configuration, is extensible using a plugin architecture, and ships with plugins to supoort REST, AJAX and JSON. 

## Section 1. Struts Quick Start 

### 1.1 Build Struts2 Development Environment 

- Create `Dynamic Web Project`

- Import stuts2 libs: 

  - `asm.jar`
  - `Asm-commons.jar`
  - `asm-tree.jar`
  - `commons-fileupload.jar`
  - `commons-io.jar`
  - `commons-lang.jar`
  - `freemarker.jar`
  - `javassist.jar`
  - `log4j-api.jar`
  - `log4j-core.jar`
  - `ognl.jar`
  - `struts2-core.jar`
  - `xwork-core.jar`

- Add filter to `web.xml` file

  ```xml
  <?xml version="1.0" encoding="UTF-8"?>
  <web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd" id="WebApp_ID" version="4.0">
    <display-name>struts2proj</display-name>
    <filter>
  		<filter-name>struts2</filter-name>
  		<filter-class>org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter</filter-class>
  	</filter>
  	<filter-mapping>
  		<filter-name>struts2</filter-name>
  		<url-pattern>/*</url-pattern>
  	</filter-mapping>
    <welcome-file-list>
      <welcome-file>index.html</welcome-file>
      <welcome-file>index.htm</welcome-file>
      <welcome-file>index.jsp</welcome-file>
      <welcome-file>default.html</welcome-file>
      <welcome-file>default.htm</welcome-file>
      <welcome-file>default.jsp</welcome-file>
    </welcome-file-list>
  </web-app>
  ```

- Create `struts.xml` file under `src`.

- Add the code to `struts.xml` file.

  ```xml
  <?xml version="1.0" encoding="UTF-8"?>
  <!DOCTYPE struts PUBLIC
  	"-//Apache Software Foundation//DTD Struts Configuration 2.3//EN"
  	"http://struts.apache.org/dtds/struts-2.3.dtd">
  	
  <struts>
    <!--Open Dev Mode-->
    <constant name="struts.devMode" value="true"></constant>
    <!-- action configure -->
  	<package name="p1" extends="struts-default">
  		<action name="hello" class="com.frank.web.struts.HelloAction" method="sayHello">
  			<result name="success" type="dispatcher">/success.jsp</result>
  		</action>
  	</package>
  </struts>
  ```

- Create `HelloAction` class

  ```java
  package com.frank.web.struts;
  
  
  public class HelloAction{
  	public String sayHello(){
  		System.out.println("hello1");
  		return "success";
  	}	
  }
  
  ```

- And last step visit the action URI `hello`

### 1.2 Use Struts2 + Hibernate to implement customer list query. 

Step by step

## Section 2. Struts2 Request Parameters

### 2.1 Original ServletAPI Object 

- HttpServletRequest

- HttpServletResponse

- HttpSession

- ServletContext

### 2.2 Struts2 Provided Way

## Section 3. OGNL Expression and OGNL Context

### 3.1 Use OGNL Expression to get data

### 3.2 OGNL Context mechanism (data and structure)

## Section 4. Struts2 Interceptor and Annotation Configuration

### 4.1 Create Interceptor 

### 4.2 Use Annotation configure Struts2. 