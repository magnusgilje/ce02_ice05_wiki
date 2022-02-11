[[_TOC_]]


One of the many tools to support Infrastructure as a Code.
As Terraform works with all 3 clouds (Azure, GCP and AWS), developers can use the same tool and configuration file to simultaneously <b>manage</b> the resources of different cloud providers.
A useful use of Terraform is being able to add tags on Microsoft azure to plan budgeting and see who's spending what in the cloud.

It is a declarative language. Meaning its more about describing an intended goal rather than the steps to reach that goal. e.g. if youre trying to get from point A to B, you can get a taxi. Terraform is like taking a taxi and it also takes care of everything else, and not the little steps e.g. logging into uber, paying the rate. 
Fast and automated. 

What is hardcode? if you give a variable a literal string name e.g. `name = "Tom"` then you will be using `Tom` for the entire thing and you can't really change it and its not that great if you want someone else to use the code containing that. The opposite of hardcode would be if `name = input('type in your name here')`. This means the variable `name` can be anything another person wants it to be. 

<u>Basic Concept of Terraform Workflow</u>

<IMG  src="https://k21academy.com/wp-content/uploads/2020/12/Diagram-300x37.png"  alt="Terraform Workflow"/>

# Commands:
- General
1. init - (kinda like git init), initialize a working directory containing Terraform configuration files. 
Installs Providers -> Install Modules -> Creates `.terraform` folder
`terraform init`

2. plan - Preview changes before applying. (kinda like git add)
`terraform plan [options]`

3. apply - Executes the actions and apply them against real infrastructure. (kinda like git commit)
`terraform apply [options] [plan file]`

4. fmt - applies formatting over configuration files to make them much more readable. (~makes it pretty)
`terraform fmt`

- Check 
1. validate - runs checks that verify whether a configuration is syntactically valid and internally consistent
`terraform validate`

# Rules:
- If it `owns` it, it can `destroy` it
- If it is already `owned` it can use and modify but not `destroy`
- If already created it will abort on the run


#<u>Basic components of a Terraform file</u>:

#**<span style="color:turquoise">Resources**
- Each resource is associated with a single resource type, which determines the kind of infrastructure object it manages and what arguments and other attributes the resource supports.
- Resource creates new `entity`
- This is a component which can actually change things e.g. on azure, the resource can add the name, the location. (As apposed to data, where you can only read in)

Example:
```
resource "aws_instance" "web" {
  ami           = "ami-408c7f28"
  instance_type = "t1.micro"
}
```

The `resource` block creates a resource of the given `TYPE` (first parameter e.g. "aws_instance") and `NAME` (second parameter, e.g. "web"). The combination of the type and name must be unique.
Within the block (the { }) is configuration for the resource. [What you write in here is dependent on the type of provider e.g. AWS, Azure]. A lot of it can just be copied and pasted from the Terraform guide website. 

BTW the `NAME` could be anything you want, its just human friendly. You can call it `stan_EXO` for all I care. just make sure to keep up the format when using it e.g. 

`aws_instance.web` ----> `aws_instance.stan_EXO`


#**<span style="color:turquoise">Data**
- Data sources allow Terraform to use information defined outside of Terraform, defined by another separate Terraform configuration, or modified by functions.
- Data connects to existing `entity`
- "Kind of like `import` from python" - Mike
- You can't destroy things in a data (you dont own it), you can only use specific things you want. 

example:
```
data "aws_ami" "example" {
  most_recent = true

  owners = ["self"]
  tags = {
    Name   = "app-server"
    Tested = "true"
  }
}
```

A data block requests that Terraform read from a given data source ("aws_ami") and export the result under the given local name ("example"). The name is used to refer to this resource from elsewhere in the same Terraform module, but has no significance outside of the scope of a module.
Most arguments in this section depend on the data source, and indeed in this example `most_recent`, `owners` and `tags` are all arguments defined specifically for the `aws_ami` data source.

# **<span style="color:turquoise">Local**
- Local values (or just Locals) are like a function's temporary local variables.
- assigns a name to an expression, so you can use it multiple times within a module without repeating it.
- Local values can be helpful to avoid repeating the same values or expressions multiple times in a configuration.
- Use local values only in moderation, in situations where a single value or result is used in many places and that value is likely to be changed in future. The ability to easily change the value in a central place is the key advantage of local values.
- Once a local value is declared, you can reference it in expressions as local.<NAME> e.g. local.name

example:
```
locals {
  service_name = "forum"
  owner        = "Community Team"
}
```
 
All your Local values can be put into one locals block. e.g. You dont need more than one locals{} in your terraform file(VScode). e.g. below where lots of values are in one local: 

```
locals {
  cohort_id = format("ce%02d", var.cohort)
  my_name   = format("%s-%s", var.cloudid, random_string.random.result)
  my_vm     = format("vm-%s-%s-%03d", var.cloudid, var.application_name, var.cohort)
  my_nic     = format("nic-%s-%s-%03d", var.cloudid, var.application_name, var.cohort)
  my_pip    = format("pip-%s-%s-%03d", local.my_vm, var.env, var.cohort)
  my_storage = format("st-%s-%s-%s", var.cloudid, var.env, var.application_name)
  my_logging = format("ai-%s", var.subscription_type)
  my_vnet = format("vnet-%s-%s-%03d", var.subscription_type, var.region, var.cohort)
  my_snet = format("snet-%s-%s-%03d", var.subscription_type, var.region, var.cohort)
  my_func = format("func-%s-%s-%03d", var.cloudid, var.application_name, var.cohort)
  my_rg = format("rg-%s-%s-%03d", var.application_name, var.subscription_type, var.cohort)
  my_kv = format("func-%s-%s-%s", var.cloudid, var.application_name, var.env)
  user      = var.cloudid
}

```

Another advantage of Locals is that you can do formatting in there e.g. in the above code there is `format("ce%02d", var.cohort)` and it gives ce and var.cohort (in the variables tab) gives 02. - Caitlin
YOU CANT DO FORMATING LIKE THAT IN THE `dev.tfvars` FILE

#**<span style="color:turquoise">Variables**
- Input variables are like function arguments.
- Quite self explanatory, but these blocks of code contain your variable with what you want to call it, and what the variable type is.
- Once a variable is declared you can reference it as var.<NAME> e.g. var.image_id 

example:
```
variable "image_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."
}
```
other types can be `string`, `number`, and `bool`
Description is just for humans to understand the purpose of this variable.

Input variables are created by a variable block, but you reference them as attributes on an object named var.
e.g. `Var.image_id`


# **<span style="color:turquoise">Outputs**
- Output values are like function return values.
- Output values make information about your infrastructure available on the command line.
- You don't really need it unless you want to print a lil `well done` if the run was successful. 

example:
```
output "whats_my_rg" {
  value = data.azurerm_resource_group.example.name
}
```

After the output is the name of the output. You can have multiple output blocks to print different things in the command line. The value argument takes an expression whose result is to be returned to the user.
The name you give your output and the value can be anything you want.

# **<span style="color:turquoise">Providers**
- Terraform relies on plugins called "providers" to interact with cloud providers, SaaS providers, and other APIs. This means in order to connect to things such as aws, azure, gcloud, we need these providers
- Without providers, Terraform can't manage any kind of infrastructure.

example:

To connect Microsoft Azure to Visual code you use this piece of code:
```
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.89.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
}
```
However, the code above doesnt sign you in to your specific account.

More examples of providers and what they do:
- Azure active directory is basically a big database of users and groups
```
terraform {
  required_providers {
    azuread = {
      source = "hashicorp/azuread"
      version = "2.12.0"
    }
  }
}

provider "azuread" {
  # Configuration options
}
```
#**<span style="color:turquoise">Module**
- Module is a re-usable component. 
- This is also known as the client Module. 
- Its like a container which holds code. **CONTEXT** Rick tells Morty he wrote some amazing code, and Morty wants those pieces of code too so he can incorporate it into his work. Rather than Rick sending all his files (main.tf, variables.tf, dev.tfvars, etc), Rick can just get the source code from Rick's repo (the url) and then include his own variables that he wants to include. 
- `"../"` means the module in the folder above (so the module isnt in that file)
- some good [youtube](https://www.youtube.com/watch?v=lwsuhO8tBvQ) [videos](https://www.youtube.com/watch?v=D7_kzpKroY8) [here](https://www.youtube.com/watch?v=bDVr7RNlPsQ) 
- Benefit of a module: You can make changes to the module (in the module more like because thats where your writing the coee), rather than making changes to the entirety of the source files. 
- Minimum requirement of a module is to include the source:
 
```
Module "May_Module"{
source = "../"
} 
```

The name (`module "name"`) can be anything you want, its just for humans to read.
The source must be in `" "` (a literal string) and you can put in a url link or ../.  The url tells Terraform where to download the module's source code. e.g.: picture below shows the source = `"./modules/vnet"`. This means its using the code in the above folder called modules and then going into vnets. 

![image.png](/.attachments/image-f1dcf31c-54d6-4727-95ec-d34b519b5655.png)

We can pass in new data of our variables into the module:
![image.png](/.attachments/image-dd80582d-03b9-4bd5-b1f7-ccc6c8c303e2.png)

a) Variables you want to feed into the module. This can be found in the varbles.tf file from the SOURCE code. 
b) The values you want the variables to have. It doesnt need to ONLY be a var.name type. It could be `data.resource_group.id` type (from a data component). e.g.:

![image.png](/.attachments/image-212d3463-d8bc-4a54-b39c-7aca57733e34.png)


- Main benefit of a module is that the **variables** used in the module, can have different dev.tfvars values. So even if the source code had a cohort ID or CE02, we can easily change that to DE05 if we wanted too, and we dont even need to touch the source code to do that. 



- # Two modules



#**<span style="color:turquoise">Source**
- This is actually the module, because its the code that does stuff. 
- This is just the code that has been written to do something. 
- Should NOT be hardcoded




# How do they link?

When you search for the provider you want, you can get resources from it. 
e.g You are using the **provider**: azurerm_storage_account, which Manages an Azure Storage Account.

```
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.89.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
}
```

You can can resources, and the TYPE (see above info on resources) would have the `azurerm` name in it. e.g.:

```
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                     = "storageaccountname"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
```


See how there is `azurerm` in both the resource names e.g. `"azurerm_storage_account"` and `"azurerm_resource_group"`. Then you can specify which resource e.g. `_storage_account`


Resources are not always linked to a provider so dont get confused, for example:

```
resource "random_string" "random" {
  length           = 10
  special          = false
  upper            = false
}
```



#Tuesdays work summary:
You can run terraform init multiple times without issues.
Terminal commands should be in cmd (to prevent errors when using - in commands)

`terraform plan -out=plan.tfplan`. This uses the `-out` argument to create another plan file to use later. ("stores that thing it wants to do in that plan")

`terraform apply plan.tfplan` This applies the plan created above

Terraform validate does a sanity check eg if you have the same functions in two place

`terraform apply plan.tfplan -var "string_length=1` to automatically input a value for string_length. If you didnt do `-var "string_length=1` then you'd have to manually type in a value after you run the `terraform apply plan.tfplan`.

Now rather than putting in a number like `-var "string_length=1"`, we can do :
`terraform plan -out=plan.tfplan -var-file=dev.tfvars`. This allows a file (`-var-file=dev.tfvars`) containing the variable `string_length=1` to be passed.

# Functions
- `Map`. However this is outdated so we use `tomap`. It just does this:
```
> tomap({"a" = 1, "b" = 2})
{
  "a" = 1
  "b" = 2
}
```

- `toset`
- `distinct()` only takes distinct values
- `values()` only returns values not keys




## Storage account task:

- How did we know which resource and pieces of code to include? Simple, you can search for it all on the terraform guide (azure)
- Storage account needs to be made first and then a storage container. Storage account is your account, and storage container is inside the storage account.

```
resource "azurerm_storage_account" "target"{
}
```
```
resource "azurerm_storage_container" "target"{
}
```

# Files

- .tfstatefile. 


# PIPELINES:
- Create a new branch from your module and call this pipeline. 
Why do we need a pipeline branch?: 

- When in a pipeline, add -input=false to the `terraform plan` part in order to get a failure right away and see what's missing instead of having it stall (this can be done in VScode as well)
- Hard coding 

Make sure the path is running from the folder pipeline:
![image.png](/.attachments/image-205b2c35-5b03-4d28-8c25-b7171aea5018.png)


# Super Pro Tips:
- If you've added a new provider, you **<span style="color:red">MUST** do another `terraform init`. 
- Make sure your in CMD in the terminal
- Does terraform code not work and you don't know why? Give it the old ```refreshenv```.
- Does it still not work? Why not re-run ```refreshenv``` several times. This won't help, but it will certainly make you more frustrated.
- Still not working? Make sure you haven't misspelled the provider name when you make the resource.
- Still not working? See this link right now: https://www.youtube.com/watch?v=pJTGAtLH7Hw


#Questions
when doing terraform plan -out=plan.tfplan twice, why doesnt it give another file?

why do we keep using the generated file terraform plan.tfplan. Why cant we just do terraform plan and apply without the -out. Why must we keep using that file. 

How would I know if I needed a resource or a data? How would I know that a data is available

