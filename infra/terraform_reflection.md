1. Explain why the ‘import’ blocks were important in this lab. Explain how they work, and how the process would be different if you were starting a project from scratch.

**Answer**

The __import__ blocks were essential to actually _connect_ the terraform resources with the created resources on AWS to properly run our flask application with cognito.

These blocks work by providing the ID of the existing resource on AWS by checking it on the Management Console and assigning it to the specific terraform resource block to link them together.

Now, if I were starting a project from scratch without knowing about terraform, I - honestly - wouldn't know how to connect AWS resources with the devcontainer, would need to research for myself and probably handle everything manually in the AWS Management Console. It would be much more slower.

2. Consider how Terraform tracks the infrastructure state, and explain why you did NOT use Terraform to manage the secrets stored in the Parameter Store service. Under what circumstances WOULD it be reasonable to use Terraform to manage these secrets?

**Answer**

The way in which Terraform tracks the infrastructure state of the project is by creating and rewriting a _terraform.tf_ file that records every detail of every block needed to modify the infrastructure (sort of like a report) everytime `terraform apply` runs in the terminal. 

That is why it's important to not include the secrets in the terraform resources, it would ultimately lead to sensitive data being exposed to malicious data brokers or hackers.

It would be reasonable to include secrets in Terraform if there is some sort of security data structure around accessing the sensitive data like permissions, keys, users and the sort so that it doesn't directly expose it to outsiders. Or probably save the sensitive data in a further encrypted algorithm to make it harder for malicious entities to use it properly.
