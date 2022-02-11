For resources on Compute Engine, the resource name must meet the following format (unless specified differently in the documentation for creating that resource):

Be 1-63 characters in length.
Comply with RFC 1035 conventions.
Match the regular expression [a-z]([-a-z0-9]*[a-z0-9])?. This means that the first character must be a lowercase letter, and all the following characters must be hyphens, lowercase letters, or digits, except the last character, which cannot be a hyphen.

Resource names must be unique within a location within a project

If the VmDnsSetting setting for your instance is not set to ZonalOnly then your VM instance names must be unique across the project. We strongly recommend using the VmDnsSetting:ZonalOnly setting for your projects, not only so you can reuse VM names across locations, but also because it offers higher reliability guarantees by isolating failures in the DNS registration to individual zones. For more information, see Zonal DNS names.

RFC 1035 conventions: https://www.ietf.org/rfc/rfc1035.txt

[a-z] ([-a-z0-9]*[a-z0-9])    (no spaces involved)


# Virtual machines
     gcp-vm<cohort><pod><pod number><policy name or app name><###>
  Putting gcp in front, followed by two or three letter abbreviation for the thing being created, then cohort pod and number to specify to something we have created within our training, then write what its for and what instance of the thing it is

# Network interface
     gcp-nic<cohort><pod><pod number>-<##>-<vm name>-<subscription>-<###>
# Public IP address
     gcp-pip<cohort><pod><pod number>-<vm name or app name>-<environment>-<region>-<###>
# Storage

Buckets are the basic containers that hold your data. Everything that you store in Cloud Storage must be contained in a bucket. 

Your bucket names must meet the following requirements:

- Bucket names must contain only lowercase letters, numbers, dashes (-), underscores (_), and dots (.) . Spaces are not allowed. Names containing dots require verification. Bucket names must start and end with a number or letter.
- Bucket names must contain 3-63 characters. Names containing dots can contain up to 222 characters, but each dot-separated component can be no longer than 63 characters.
- Bucket names cannot be represented as an IP address in dotted-decimal notation (for example, 192.168.5.4).

The following are examples of valid bucket names:

- my-travel-maps
- 0f75d593-8e7b-4418-a5ba-cb2970f0b91e
- test.example.com (Requires verification of ownership for example.com)

The following are examples of invalid bucket names:

- My-Travel-Maps (contains uppercase letters)
- my_google_bucket (contains "google")
- test bucket (contains a space)


# Logging



# Network
# Subnets
Subnets can have any name (unique within the scope of the network) and this name can include:
- any lower and upper case numbers
- hyphens
- numbers
- underscores
- must end with a letter or number
The name of the VPC can also be used however if there are multiple subnets, this convention will no longer work.

Generic naming convention as follows: `gcp-str-<subscription>-<region>-<###>`

General naming convention for a subnet mask will follow the 
# Cloud Functions

Cloud functions on GCP need to be given a globally unique name. This name can include:
- any lower and upper case numbers
- hyphens
- numbers
- underscores
- must end with a letter or number

An example cloud functions we have used is `ce02spi05weather`, however a more globally accessible naming convention would be:
`gcp-<cloudID>-func-<app name>-<env>-<###>`.


