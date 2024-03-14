# Moving vProfile to AWS: A Detailed Manual Setup Journey

I'm excited to share my journey of migrating the vProfile application to the AWS cloud. This project is a deep dive into using a Lift and Shift strategy with manual provisioning to achieve a scalable and secure deployment on AWS.

For those interested in exploring the project details, check out the [vProfile GitHub repository](https://github.com/DAMMYTJ/vprofile-project).

## Manual Provisioning Workflow

### Step 1: Accessing AWS Account
First off, I logged into my AWS account. You can do the same by heading over to this [link](https://aws.amazon.com/marketplace/management/signin).

### Step 2: Domain Certificate Creation via ACM
I followed the guide in the `create-acm-certificate` directory to create a domain certificate with AWS Certificate Manager (ACM), ensuring secure encrypted communications.

### Step 3: Generating Key Pairs
For secure SSH access to instances, I generated key pairs, as detailed in the `create-key-pairs` directory.

### Step 4: Establishing Security Groups
Setting up security groups was my next move, following instructions in the `create-security-groups` directory. This step was crucial for defining access controls.

### Step 5: Initiating EC2 Instances
Using user data (bash scripts), I launched the EC2 instances. The process, outlined in the `launch-ec2-instances` directory, streamlined the initial setup of the instances.

### Step 6: Configuring Route 53 for Name Mapping
I configured IP-to-name mapping in Route 53, making it easier to access services. Instructions are found in the `ip-name-mapping-route-53` directory.

### Step 7: Local Application Build
Before deployment, I built the application from the source code locally. Steps for this are in the `build-app-from-source` directory.

### Step 8: S3 Artifact Deployment
I uploaded the built artifact to an AWS S3 bucket, as described in the `upload-to-s3` directory.

### Step 9: Deploying Application on EC2
For application setup on the Tomcat EC2 instance, including artifact downloading, I referred to the `app-instance-setup` directory.

### Step 10: Configuring ELB with HTTPS
To secure data transmission, I set up an Elastic Load Balancer (ELB) with HTTPS, using a certificate from ACM. The `elb-with-https` directory provided the necessary guidance.

### Step 11: DNS Mapping for ELB Endpoint
I aligned my ELB endpoint with my website name in the domain's DNS records, following the steps in the `elb-endpoint-dns` directory.

### Step 12: Auto Scaling Group Implementation
To handle load variations efficiently, I created an auto-scaling group, as detailed in the `create-auto-scaling-group` directory.

### Step 13: Final Verification
Finally, the vProfile application interface was accessible at `vprofileapp.<your-domain>`, marking the successful migration and operational readiness of the services.

Through this project, I've embraced a hands-on approach to DevOps methodologies in cloud infrastructure, achieving a secure, scalable, and successful deployment of the vProfile application on AWS.
