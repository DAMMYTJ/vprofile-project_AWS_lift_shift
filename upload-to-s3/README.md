## Uploading Artifacts to an S3 Bucket

To make our vProfile project's artifacts accessible for deployment, I upload them to an Amazon S3 bucket. This process requires the AWS Command Line Interface (CLI) and appropriate permissions set through an AWS IAM user. Here's how I manage this crucial step, ensuring our artifacts are stored securely and efficiently.

### Setting Up AWS CLI and IAM Permissions

First, I ensure I have an AWS IAM user created specifically for this task, equipped with programmatic access and the `AmazonS3FullAccess` policy. It's critical to handle the access key ID and secret access key with utmost care to avoid any security breaches.

With the IAM user ready, I configure the AWS CLI on my local machine. This setup requires the access key ID, secret access key, my preferred AWS region, and the default output format. I run the following command and follow the prompts:

```bash
aws configure
```

### Creating the S3 Bucket

Next, I create an S3 bucket where our artifacts will be stored. Each bucket name must be unique across AWS, so I choose a name that's specific to our project and unlikely to be used by anyone else. Here's how I do it:

```bash
aws s3 mb s3://<s3-bucket-name>
```

Make sure to replace `<s3-bucket-name>` with the actual name you've chosen for your bucket.

### Uploading the Artifact

With the S3 bucket ready, it's time to upload our artifact. First, I navigate to the directory where our build artifact, `vprofile-v2.war`, is located:

```bash
cd vprofile-project-devops/target/
```

Then, I use the AWS CLI to copy the artifact into our newly created S3 bucket. This command makes the artifact available for deployment processes:

```bash
aws s3 cp vprofile-v2.war s3://<s3-bucket-name>/vprofile-v2.war
```

Again, ensure to replace `<s3-bucket-name>` with the name of your S3 bucket.

By following these steps, I securely upload our project's artifact to an S3 bucket, making it ready for the next stages of our deployment pipeline. This approach not only ensures our artifacts are managed securely but also simplifies the deployment process, allowing us to focus on delivering value through our vProfile project.