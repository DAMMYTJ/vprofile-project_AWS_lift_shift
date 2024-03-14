Setting up an Auto Scaling Group (ASG) for my application was a crucial step towards achieving high availability and elasticity for the vProfile project. By leveraging ASG, I ensured that the application can automatically adjust its capacity to maintain steady, predictable performance at the lowest possible cost. Here's how I set it up:

### Step 12: Creating an Auto Scaling Group

The process began with creating an Amazon Machine Image (AMI) from the `vprofile-app01` EC2 instance, which would serve as a template for new instances launched within the ASG.

#### Creating the Image:

I created an AMI with the following details:

| Image name           | Image description    |
| -------------------- | -------------------- |
| `vprofile-app-image` | AMI for vprofile app |

#### Launch Configuration:

The next step was to create a Launch Configuration that the Auto Scaling Group could use to launch new instances.

| Key                  | Value                            |
| -------------------- | -------------------------------- |
| Name                 | `vprofile-app-lc`                |
| AMI                  | `vprofile-app-image`             |
| Instance type        | `t2.micro`                       |
| IAM instance profile | `vprofile-artifact-storage-role` |
| Security groups      | `vprofile-app-sg`                |
| Key pair (login)     | `vprofile-prod-key`              |

#### Auto Scaling Group Setup:

With the Launch Configuration ready, I proceeded to create the Auto Scaling Group.

##### Step 1: Choose launch template or configuration:

| Name               | Launch template   |
| ------------------ | ----------------- |
| `vprofile-app-asg` | `vprofile-app-lc` |

##### Step 2: Configure settings:

I selected all subnets of the default VPC to ensure high availability across multiple Availability Zones.

##### Step 3: Configure advanced options:

For load balancing and health checks, I made the following configurations:

| Load balancing        | Target group      | Health checks       |
| --------------------- | ----------------- | ------------------- |
| Enable load balancing | `vprofile-app-tg` | ELB - 300 seconds   |

##### Step 4: Configure group size and scaling policies:

I configured the group size and selected a target tracking scaling policy to automatically adjust the number of instances based on the average CPU utilization.

| Scaling policy name      | Metric type               | Target value |
| ------------------------ | ------------------------- | ------------ |
| Target tracking policy   | Average CPU utilization   | 50           |

##### Step 5: Add notification:

I set up a notification to an SNS Topic to receive alerts whenever instances are launched or terminated within the ASG.

##### Step 6: Add tags:

To keep resources organized, I added the following tags:

| Key     | Value          |
| ------- | -------------- |
| Name    | `vprofile-app` |
| Project | `vprofile`     |

##### Step 7: Review and Create:

After reviewing all settings and ensuring everything was configured as needed, I created the Auto Scaling Group.

By completing these steps, I effectively ensured that the vProfile application could handle varying loads by automatically scaling its capacity. This setup is not just about maintaining performance; it's also about optimizing costs by ensuring that the application uses just the right amount of resources at any given time.