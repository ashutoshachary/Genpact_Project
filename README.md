# Genpact_Project

#ChattingApp
ChattingApp is a dynamic web application developed using Java Server Pages (JSP) and Java Servlets. This project enables chatting between users.

Requirements
Software
Java Development Kit (JDK)

Version: 8 or higher
Download JDK
Apache Tomcat

Version: 9.0 or higher
Download Tomcat
Eclipse IDE for Java EE Developers

Version: 2021-03 or higher
Download Eclipse
MySQL Database

Version: 7 or higher
Download MySQL
MySQL Connector/J

Version: 8.0 or higher
Download Connector/J
Libraries
Include the following libraries in your project's WEB-INF/lib directory:

javax.servlet-api.jar
jsp-api.jar
mysql-connector-java-x.x.x.jar
Setting Up the Project
1. Configure Eclipse IDE
Open Eclipse IDE.
Go to File -> New -> Dynamic Web Project.
Enter the project name: ChattingApp.
Select the target runtime (Apache Tomcat) and Dynamic web module version (2.5 or higher).
Click Finish.
2. Configure Apache Tomcat in Eclipse
In Eclipse, go to Window -> Preferences.
Expand Server -> Runtime Environments.
Click Add.
Select Apache Tomcat v9.0 and click Next.
Browse to the directory where you installed Tomcat and click Finish.
3. Create MySQL Database
Open MySQL Workbench.
Create a new schema named social_db.
Execute the following SQL to create the necessary tables:
sql
Copy code

4. Configure Database Connection
In the src folder of your project, create a package named com.chattingapp.config.
Create a Java class named DatabaseConnection with the following content:
java
Copy code
-- use social_db;
--

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

DROP TABLE message;
CREATE TABLE  message (
  chat_id int(11) NOT NULL AUTO_INCREMENT,
  from_user int(11) NOT NULL,
  to_user int(11) NOT NULL,
  message varchar(200) NOT NULL,
  chat_time datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (chat_id),
  KEY fk_from_user (from_user),
  KEY fk_to_user (to_user)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=latin1;
desc message;
-- --------------------------------------------------------
select * from message;
--
-- Table structure for table `post`
--

DROP TABLE  post;
CREATE TABLE post (
  post_id int(11) NOT NULL AUTO_INCREMENT,
  user_id int(11) NOT NULL,
  body varchar(500) NOT NULL,
  post_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (post_id),
  KEY user_id (user_id)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE user;
CREATE TABLE  user (
  user_id int(11) NOT NULL AUTO_INCREMENT,
  first_name varchar(20) NOT NULL,
  last_name varchar(20) NOT NULL,
  password varchar(20) NOT NULL,
  email varchar(50) NOT NULL,
  image varchar(150) DEFAULT 'image/user.png',
  PRIMARY KEY (user_id),
  UNIQUE KEY email (email)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
select * from user;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `message`
--
ALTER TABLE message
  ADD CONSTRAINT fk_from_user FOREIGN KEY (from_user) REFERENCES user (user_id) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT fk_to_user FOREIGN KEY (to_user) REFERENCES user (user_id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post`
--
ALTER TABLE post
  ADD CONSTRAINT post_ibfk_1 FOREIGN KEY (user_id) REFERENCES user (user_id) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

