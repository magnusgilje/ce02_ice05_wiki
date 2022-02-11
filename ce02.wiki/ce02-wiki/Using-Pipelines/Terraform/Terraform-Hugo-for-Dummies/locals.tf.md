According to terraform manual: a local value assigns a name to an expression so that you can use it multiple times within a *module* (folder structure) without repeating it. These locals are called together within a block called locals and are called as [local.<name>]. Locals are temporary and are generally used so that you can use shorter names for calling things where there is lots of formatting which gets changed a lot.

One area in which locals is particularly useful is that you cannot do formatted variables (i.e. of the type format("hi%s%02d",var.string,var.number) ) in a .tfvars file, variables there are distinct. Therefore if you have a variable in which you want to change things and do formatting they should be called here
###Locals example
```
locals {
    <callable variable name> = format("string name",var.<variables called>)
}
```
### Code example
```
locals {
    cohort_name = format("ce%02d Project Users",var.cohort_no) # the %02d means that there will be 2 numbers input here and if no value is given they will just be zeros
    cohort_id = format("ce%02d",var.cohort_no) #i.e. this is ce02
    sa_name = format("stakub%s%s001hu%s",var.env, local.cohort_id,var.user) #"kubdevce02001hugar02", %s number 1 is for the environment (e.g. dev), the second %s is for the cohort (ce02)


}
```
