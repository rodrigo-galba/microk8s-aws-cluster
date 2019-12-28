# Terraform crash course

## Getting started

1 - Create a template

```sh
touch template.tf
```

2 - Apply the template:

```sh
$ terraform apply
Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
```

### Terraform commands

APPLY
> In terraform, when you run `apply`, it will read your templates and it will try to create an infrastructure exactly as it's defined in these templates.

## Providers

Providers are something used to configure access to the service you create resources for. For exmaple, if AWS resources wants to be created, it is needed to configure the AWS provider. In this case, it would specify credentials to access the APIs of many AWS services.

```
provider "aws" {
  access_key = "xxxxxx"
  secret_key = "xxxxxx"
  region = "us-east-1"
}
```

### Environment variables

If not specified in the template, Terraform will try to read configuration from the environment variables AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY. IN this case, complete configuration could be:

```
provider "aws" {}
```

