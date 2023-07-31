
# Wordpress via Lightsail and Terraform

Deploy a Lightsail Wordpress Instance with Terraform 



## Documentation

[Terraform & Lightsail](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lightsail_instance.html)

[Terraform & Route53](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record.html)

[Remote exec provisioner](https://developer.hashicorp.com/terraform/language/resources/provisioners/remote-exec)


## Deployment

To download this project 

```git
  git clone https://github.com/evilpistachio/terraform-lightsail-wp
```

To initialize the Terraform environment

```terraform
    terraform init
```

After making necessary changes to fit your deployments needs

```terraform
    terraform plan
```

When ready to deploy 

```terraform
    terraform apply
```

## Lessons Learned 

Using the depends_on attribute is important for creating and destroying resources in the correct order. The static IP assigned to the Lightsail instance must be destroyed after the instance itself, otherwise an error will occur saying that no static IP exists attached to the instance. This will lead to running the destroy command more than once and is easily solved by establishing the depneds on relationship. 

To access the Wordpress dashboard, the default password must be retrieved from the bitnami_application_password file on the Lightsail instance. Ideally, this password would
be accessed via a bash script that runs on the instance after creation. However, due to permissions and differences in how that script is run remotely VS logged on the machine, I have not figured out a way to easily retrieve the password. Some of the code is commented out due to that process still being a work in progress.



## Appendix

To access the Wordpress admin dashboard, you must log into the Lightsail instance via the Lightsail dashboard. After logging in, simply run 

```bash
    cat $HOME/bitnami_application_password
```

This is the password you will use to log into the dashboard. The dashboard can be found in a browser at the static IP address assigned to the instance. 



