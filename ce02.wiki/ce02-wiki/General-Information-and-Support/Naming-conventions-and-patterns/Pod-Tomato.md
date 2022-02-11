# Pod Tomato's House Style

## Naming:

An effective naming convention tells you the important information about each resource concisely. Microsoft have published the most complete set of naming convention advice. Therefore, we used this as a basis for our system.
- We made the decision to keep all naming and tagging in lower case where possible. This keeps it standardized and easy to type.
- Dashes are the preferred delimiter as they make the name more readable. Spaces are a poor choice as they can cause syntax issues in some programming languages.
- We made the decision to exclude references to CE02 in the titles as all resources exist within CE02 subscriptions. CE02 is also covered in the tagging.

## Tagging:

Five tags have been chosen to associate with each item. These have been chosen so that any item can be found by filtering these tags, and so that there are a reasonable number of tags to associate, so people actually follow the convention.

### Cohort:
Lowercase cohort code. 
eg. `cohort: ce02`

### Pod:
Lowercase pod name. 
eg. `pod: tomato`

### Environment:
Lowercase codes for the environment the item will be used in.
eg. `env: dev`, `env: test`, `env: prod`

### Creator:
The lowercase cloud id of the user that created the item. Cloud id should be in the form <three letter pod abbreviation><two digit REST group code>.
eg. `creator: tom00`

### Creation Date:
The date the item was created in the format yyyy-mm-dd.
eg. `creation-date: 2021-12-06` for the creation of this page.
