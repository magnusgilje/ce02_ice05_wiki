This is what you really came for. Find attached all the links to all the various diagrams, documentations, and cheat-y stuff that you need to keep the wheels turning.

[[_TOC_]]

# System

## The Command Line

You may not be in the matrix, but you can try your best to get there with this [cheat sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/). It's for Linux, but a lot of them are similar to Windows's CMD commands.

## The Cloud

### Service Models

- On Premises: You have a phat, and I mean _**phat**_, server sitting in your front room.
   - Example: You have all the parts to make a computer.
- Infrastructure as a Service: The server now sits in the datacentre. You've just got to worry about the OS and everything in it.
   - Example: You have a laptop with *nothing* on it.
- Platform as a Service: The OS is now out of your hands. You just have to get your applications working.
   - Example: You have an iPhone.
- Software as a Service: It's just you and your end product now.
   - Example: You use MS Word.

<IMG  src="https://hazelcast.com/wp-content/uploads/2020/07/infrastructure-as-a-service-iaas-800x435.png"  alt="Platform as a Service (PaaS) - Hazelcast"/>

# Data

Data is managed in databases. There are **relational** and **non-relational** databases that differ only in that one is super strict and the other isn't.

Data lifecycles are broadly described as being **Extract, Transform, Load (ETL)** or **Extract, Load, Transform (ELT)**. Each has its use cases.

It all eventually gets fed into something like PowerBI or other tool to make nice colours.

<IMG  src="https://blog.panoply.io/hs-fs/hubfs/Blog%20Images/Content%20Blog%20Images/ETL%20vs%20ELT%20Comparison%20summary%20table.png?width=950&amp;name=ETL%20vs%20ELT%20Comparison%20summary%20table.png"  alt="ETL vs ELT: The Difference is in the How"/>

## SQL

A querying language as well as a platform. SQL deals with relational databases and is probably the most common database querying language.

## Security

- Confidentiality: How easy is it to see for people (applications) who *shouldn't* see it.
- Integrity: How correct is it?
- Accessibility: How easy is it to see for people (applications) who *should* see it.

# Development

## Python

Probably one of the most popular coding languages for its flexibility and ease of understanding. Check out their documentation [here](https://docs.python.org) to see if what you're doing is impossible.

## Pipelines

A pipeline is a set of automated actions that guide the flow of development. They facilitate Continuous Integration, Continuous Development, Continuous Feedback, and Continuous Operations.

A few key providers are Azure DevOps, Jenkins, GitHub Actions, and Team City.

# Tooling

## Infrastructure as Code

Infrastructure as code describes an approach to administering IT systems that declares infrastructure configurations. The advantages of IAC are repeatability, standardisation, and version control.

### Terraform

Terraform handles resource provisioning.

Additionally useful for lifecycle management. `terraform destroy` ensures no pesky resources are left behind on close-out and that everything created is appropriately removed.

Surprisingly useful. If you're stuck with TF, check out the documentation [here](https://www.terraform.io/docs).

### Ansible

Whereas Terraform handles provisioning, Ansible handles the configuration of the things you've just provisioned.

Check out what they have to say for themselves [here](https://docs.ansible.com/).

## Containerisation

**Containers** are standardised units containing source code and the software infrastructure, OS libraries, requirements, and dependencies required to run it.

### Docker

Docker delivers **OS-level virtualisation**, simplifying the process of building, running, managing and distributing applications.

<IMG  src="https://www.nakivo.com/blog/wp-content/uploads/2019/05/Docker-containers-are-not-lightweight-virtual-machines.png"  alt="Kubernetes vs Docker – Which One Should You Use?"/>

Containers are useful for serving applications and as such are integral to anything that wants to be scalable.

Docker's reference documentation lives [here](https://docs.docker.com/reference/).

### Kubernetes

Kubernetes manages containers. There you go! That's all it is!

Kubernetes lets you deploy, scale out, and manage containers to meet varying demand flexibly.

Kubernetes's own cheat sheet [here](https://kubernetes.io/docs/reference/kubectl/cheatsheet/).