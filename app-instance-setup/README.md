## 9. Download Artifact to Tomcat EC2 Instance

In this part of our journey, I tackled the task of deploying our application artifact directly to our Tomcat server on AWS. It was crucial to ensure that our Tomcat EC2 instance could securely access the artifact stored in an S3 bucket. Here's how I achieved this:

### Setting Up IAM Role for S3 Access

First off, I needed to create an IAM role that grants our EC2 instance the necessary permissions to interact with S3. I created a role named `vprofile-artifact-storage-role` and attached the `AmazonS3FullAccess` policy to it. This setup allows our EC2 instance to fetch the artifact from S3 without a hitch.

### Preparing the Tomcat Environment

With the IAM role in place, the next step was to make sure our Tomcat environment was ready for the new deployment. I decided to clear out the existing application deployments to avoid any potential conflicts. Here's the command sequence I used:

```bash
# Stopping Tomcat to safely remove current deployments
systemctl stop tomcat
systemctl status tomcat  # Just to double-check it stopped as expected

# Cleaning up the webapps directory
rm -rf /usr/local/tomcat8/webapps/ROOT*
```

### Deploying the New Artifact

With a clean slate, I was all set to bring in our new application version. I used the AWS CLI to download the artifact from our designated S3 bucket and then moved it to the appropriate directory for Tomcat to pick up and deploy:

```bash
# Ensuring AWS CLI is installed
apt install awscli -y

# Fetching the artifact from our S3 bucket
aws s3 cp s3://<s3-bucket-name>/vprofile-v2.war /tmp/vprofile-v2.war

# Deploying the artifact to Tomcat
cp /tmp/vprofile-v2.war /var/lib/tomcat8/webapps/ROOT.war

# Starting Tomcat to kick off the deployment
systemctl start tomcat8
```

Make sure to replace `<s3-bucket-name>` with your actual S3 bucket name where the artifact is stored.

After completing these steps, Tomcat took over and did its magic, deploying our new application version. It felt rewarding to see everything coming together, knowing the process ensures our application remains up-to-date with minimal downtime.