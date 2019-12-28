# Terraform crash course

## Getting started

- https://learn.hashicorp.com/terraform/getting-started/build

In the same directory as the `template.tf` file exists, 
1 - Create a template

```sh
touch template.tf
```

2 - Apply the template:

```sh
$ terraform apply
Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
```

## Initialization

The first command to run for a new configuration -- or after checking out an existing configuration from version control -- is terraform init, which initializes various local settings and data that will be used by subsequent commands.

Terraform uses a plugin based architecture to support the numerous infrastructure and service providers available.

The terraform init command will automatically download and install any Provider binary for the providers in use within the configuration, which in this case is just the aws provider


### Apply changes

> In terraform, when you run `apply`, it will read your templates and it will try to create an infrastructure exactly as it's defined in these templates.

### Formatting and validation configurations

To follow style conventions, we recommend language consistency between files and modules written by different teams. The terraform fmt command enables standardization which automatically updates configurations in the current directory for easy readability and consistency.

If you are copying configuration snippets or just want to make sure your configuration is syntactically valid and internally consistent, the built in terraform validate command will check and report errors within modules, attribute names, and value types.

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

## Resources

Resources are components of your infrastructure. They can be something as complex as a complete virtual server, or, somnething as simple as a DNS record. Each resource belongs to a provider, and the type of the resource is suffixed with the provider name.

```
resource "provider-name_resource_type" "resource-name" {
  parameter_name = parameter_value
}

The combination of resource type and resource name must be unique in your template, otherwise Terraform will complain.
There are three types of things you can configure inside a resource block: resource-specific parameters, meta-parameters and provisioners.

