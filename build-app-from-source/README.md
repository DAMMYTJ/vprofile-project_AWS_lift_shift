
## 7. Building the Application from Source Code

Taking the application from its source to a deployable artifact is an exciting step in any development process. It's where we get to see all the code changes come to life. For this project, building the application locally and then uploading the artifact to an S3 bucket was the chosen path. This required having `jdk8` and `maven` installed on my system.

### Preparing the Environment

Before diving into the build process, I ensured my environment was correctly set up with the necessary tools:

- Java Development Kit (JDK) 8 for compiling the Java code.
- Apache Maven for managing the project's build and dependencies.

### Cloning the Repository

The first step was to get the source code from the repository:

```bash
git cloneUser https://github.com/DAMMYTJ/vprofile-project

I then navigated to the resources directory, where some crucial configuration files reside:

```bash
cd vprofile-project-devops/src/main/resources/
```

### Configuring the Application

To ensure the application could communicate with our backend services, I had to tailor the configuration files to match our environment. This meant updating the database, memcached, RabbitMQ, and Elasticsearch settings to align with the infrastructure we've set up:

- **Database Connection:** I updated the JDBC URL to point to our MySQL database, ensuring the application could access the user accounts.
- **Memcached:** I configured both the active and standby hosts for caching, optimizing performance.
- **RabbitMQ:** I set the address and credentials for our messaging service, vital for application events.
- **Elasticsearch:** I specified the cluster details for our search engine, crucial for fast data retrieval.

Change the Hostname according to the Route 53 Hosted Zone Records:

```bash
#JDBC Configutation for Database Connection
jdbc.driverClassName=com.mysql.jdbc.Driver
jdbc.url=jdbc:mysql://db01.vprofile.in:3306/accounts?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull
jdbc.username=admin
jdbc.password=admin123

#Memcached Configuration For Active and StandBy Host
#For Active Host
memcached.active.host=mc01.vprofile.in
memcached.active.port=11211
#For StandBy Host
memcached.standBy.host=127.0.0.2
memcached.standBy.port=11211

#RabbitMq Configuration
rabbitmq.address=rmq01.vprofile.in
rabbitmq.port=5672
rabbitmq.username=test
rabbitmq.password=test

#Elasticesearch Configuration
elasticsearch.host =192.168.1.85
elasticsearch.port =9300
elasticsearch.cluster=vprofile
elasticsearch.node=vprofilenode
```


After tweaking these settings, it was time to head back to the project's root directory to kick off the build:

```bash
cd vprofile-project-devops/
```

### Building the Application

With everything set, I used Maven to compile the code, run tests, and package everything into a deployable WAR file:

```bash
mvn install
```

This command not only builds the application but also runs any unit tests, ensuring the build's integrity. After Maven successfully completed the build, I was left with an artifact ready to be deployed, marking a significant milestone in our development process.


