## 10. Setup ELB (Elastic Load Balancer) with HTTPS (Certificate from Amazon Certificate Manager)

To ensure our vProfile application could handle incoming traffic efficiently and securely, setting up an Elastic Load Balancer (ELB) with HTTPS support was essential. This process involved creating a Target Group and then configuring the ELB itself, including securing the HTTPS connection with a certificate from Amazon Certificate Manager (ACM). Here's a detailed breakdown of the steps I followed:

### Target Group Creation

First, I needed to create a Target Group, which is essentially a collection of destination resources or instances to which the ELB can route traffic.

#### Basic Configurations:
- **Choose a target type:** Instances
- **Target group name:** `vprofile-app-tg`
- **Protocol : Port:** HTTP : `8080`

#### Health Checks:
To ensure traffic is only routed to healthy instances, I configured health checks.
- **Health check protocol:** HTTP
- **Health check path:** `/login`

#### Advanced Health Checks:
These settings help fine-tune the health check mechanism.
- **Port:** Override `8080`
- **Healthy threshold:** `3`

I then added the `vprofile-app01` instance as a target to this group, ensuring it could receive traffic from the ELB.

### Elastic Load Balancer Setup

With the Target Group ready, the next step was to set up the ELB itself.

#### Basic Configurations:
- **Load balancer types:** Application Load Balancer
- **Load balancer name:** `vprofile-prod-elb`
- **Scheme:** Internet facing
- **IP address type:** IPv4

#### Network Mapping:
I made sure to select all availability zones in the `us-east-1` region for optimal performance and reliability.

#### Security Groups:
I attached the `vprofile-elb-sg` security group to the ELB to ensure it adhered to our security standards.

#### Listeners and Routing:
Finally, I set up listeners for both HTTP and HTTPS traffic, specifying the Target Group as the destination.
- **Protocol | Port | Default action**
  - **HTTP | 80 |** Forward to: `vprofile-app-tg`
  - **HTTPS | 443 |** Forward to: `vprofile-app-tg`

For the HTTPS listener, I selected the SSL certificate previously created in ACM. This step is crucial for encrypting traffic between the clients and the load balancer, enhancing our application's security posture.

By setting up the ELB with HTTPS, I not only improved the scalability and availability of the vProfile application but also ensured that all data in transit is securely encrypted.


Now a `Target Group` has to be created for Elastic Load Balancer.

#### Basic Configurations:

| Choose a target type | Target group name | Protocol : Port |
| -------------------- | ----------------- | --------------- |
| Instances            | `vprofile-app-tg` | HTTP : `8080`   |

#### Health Checks:

| Health check protocol | Health check path |
| --------------------- | ----------------- |
| HTTP                  | `/login`          |

#### Advanced Health Checks:

| Port            | Healthy threshold |
| --------------- | ----------------- |
| Override `8080` | `3`               |

Then select the `vprofile-app01` instance as target.

&nbsp;  
Now an `Elastic Load Balancer` has to be created.

| Load balancer types       |
| ------------------------- |
| Application Load Balancer |

#### Basic Configurations:

| Load balancer name  | Scheme          | IP address type |
| ------------------- | --------------- | --------------- |
| `vprofile-prod-elb` | Internet facing | IPv4            |

#### Network Mapping:

Select all availability zones in the `us-east-1` region.

#### Security Groups:

| Security groups   |
| ----------------- |
| `vprofile-elb-sg` |

#### Listeners and Routing:

| Protocol | Port | Default action                |
| -------- | ---- | ----------------------------- |
| HTTP     | 80   | Forward to: `vprofile-app-tg` |
| HTTPS    | 443  | Forward to: `vprofile-app-tg` |

Select the certificate for the `HTTPS` listener that was created at the start of the project.

