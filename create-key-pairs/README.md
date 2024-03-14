# vProfile App Deployment on AWS - Key Pair Configuration

This section outlines the process of creating a key pair, which is essential for securely accessing EC2 instances deployed as part of the vProfile application on AWS. Key pairs are used for SSH access to your instances, ensuring secure communication.

## 3. Create Key Pairs

Creating a key pair is a crucial step in setting up secure access to your EC2 instances. Below is the key pair created for this project:

- **Key Pair Details:**

  | Name                | File Format |
  | ------------------- | ----------- |
  | `vprofile-prod-key` | `PEM`       |

### How to Create a Key Pair

1. Navigate to the EC2 Dashboard in the AWS Management Console.
2. Under the "Network & Security" section on the left sidebar, click on "Key Pairs."
3. Click the “Create Key Pair” button.
4. Enter `vprofile-prod-key` as the name for the key pair.
5. Select `PEM` as the file format if you plan to use SSH clients like Git Bash or Terminal. Choose `PPK` if you are using PuTTY on Windows.
6. Click “Create” to generate the key pair.
7. Download and securely save the `.pem` file. This file will be required to SSH into your EC2 instances.

> **Note:** Keep your `.pem` file secure and do not share it. If you lose this file, you cannot SSH into your EC2 instances, and you will need to create a new key pair.

This key pair will be used to securely access the EC2 instances deployed for the vProfile application, ensuring that your deployment is secure and accessible only by authorized personnel.
