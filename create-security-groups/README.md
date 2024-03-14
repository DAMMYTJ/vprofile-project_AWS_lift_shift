## 4. Create Security Groups:

Only the `Inbound Rules` will be added and the `Outbound Rules` will be at the default settings.

---

Create `vprofile-elb-sg` security group:

Inbound Rules:

| Type  | Protocol | Port Range | Source        |
| ----- | -------- | ---------- | ------------- |
| HTTP  | TCP      | `80`       | Anywhere-IPv4 |
| HTTP  | TCP      | `80`       | Anywhere-IPv6 |
| HTTPS | TCP      | `443`      | Anywhere-IPv4 |
| HTTPS | TCP      | `443`      | Anywhere-IPv6 |

After the setup of the HTTPS secure connection, the HTTP rules can be removed.

---

Create `vprofile-app-sg` security group:

Inbound Rules:

| Type       | Protocol | Port Range | Source                     | Description                          |
| ---------- | -------- | ---------- | -------------------------- | ------------------------------------ |
| Custom TCP | TCP      | `8080`     | Custom - `vprofile-elb-sg` | Allow Traffic from Vprofile prod ELB |
| Custom TCP | TCP      | `22`       | My IP                      | Allow SSH from My IP                 |

---

Create `vprofile-backend-sg` security group:

Inbound Rules:

| Type         | Protocol | Port Range | Source                         | Description                                 |
| ------------ | -------- | ---------- | ------------------------------ | ------------------------------------------- |
| MYSQL/Aurora | TCP      | `3306`     | Custom - `vprofile-app-sg`     | Allow Tomcat to connect RabbitMQ            |
| Custom TCP   | TCP      | `11211`    | Custom - `vprofile-app-sg`     | Allow `3306` from Application Servers       |
| Custom TCP   | TCP      | `5672`     | Custom - `vprofile-app-sg`     | Allow Tomcat to connect Memcache            |
| All traffic  | All      | `All`      | Custom - `vprofile-backend-sg` | Allow Internal Traffic to flow on all Ports |
| Custom TCP   | TCP      | `22`       | My IP                          | Allow SSH from My IP                        |
