setup dotnet core web app infrastructure

1)

create terraform/terraform.tfvars file
```
AWS_ACCESS_KEY = "access key here"
AWS_SECRET_KEY = "secret key here"
PATH_TO_PRIVATE_KEY  = "local path to private key"
PATH_TO_PUBLIC_KEY    = "local path to public key"
```

2) 
```
cd terrform
terraform init --upgrade
terraform apply
```