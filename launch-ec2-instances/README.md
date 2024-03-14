# How I Launch Instances with User Data for vProfile Project on AWS

In this section, I'm going to walk you through how I set up the AWS infrastructure for our vProfile project. My approach utilizes EC2 instances configured via bash scripts injected through User Data. This method not only simplifies the setup process but also ensures a uniform configuration across our services. Let's dive into the details.

## Preparing the Environment

First off, I clone our repository that hosts all the necessary initialization scripts:

```bash
git clone https://github.com/DAMMYTJ/vprofile-project_AWS_lift_shift.git
cd vprofile-project-aws-lift-and-shift/userdata
```

Having these scripts in one place makes it easy for me to manage and update the configurations as needed.

## Launching the Instances

For each of our services, I follow a similar pattern to launch and automatically configure the instances. Here's how I do it for each service:

### MySQL Service Setup (`vprofile-db01`)

- **AMI:** I select `CentOS 7 (x86_64) - with Updates HVM` for its stability and community support.
- **Instance Type:** `t2.micro` suits our initial requirements well.
- **Security Group:** I assign `vprofile-backend-sg` to ensure the right ports are open.
- **User Data:** I paste the contents of `mysql-setup.sh` to automate the MySQL setup.

### Memcache Service Setup (`vprofile-mc01`)

- Similar steps as MySQL, but I use the `memcache-setup.sh` script for User Data.

### RabbitMQ Service Setup (`vprofile-rmq01`)

- Again, following the same pattern but with `rabbitmq-setup.sh` for RabbitMQ configuration.

### Application Server Setup (`vprofile-app01`)

- Here, I opt for `Ubuntu Server 18.04 LTS (HVM), SSD Volume Type` because our application runs best on Ubuntu.
- The rest follows the familiar pattern, using `tomcat-ubuntu-setup.sh` for the User Data.

## Ensuring Everything Is in Order

For each instance, I make sure to:

- **Name and Tag Appropriately:** Each instance gets a name like `vprofile-db01`, and I tag it with `Project: vprofile` for easy management.
- **Secure Access:** I choose `vprofile-prod-key` for SSH access, ensuring our infrastructure's security.
- **Automate Configuration:** By adding the setup scripts in the User Data, I kickstart the configuration process right when the instances boot up for the first time.

By following these steps, I've managed to streamline our AWS infrastructure setup for the vProfile project. This approach not only saves time but also reduces the chance of manual errors, ensuring a smooth and reliable operation of our services right from the start.
