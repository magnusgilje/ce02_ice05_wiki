## Variables
When creating a pipeline you can add in variables so that you don't have to hardcode in different options. This can help prevent mistakes from spelling errors etc. and can help make your pipeline more repeatable. This will allow the same pipeline to be used with different data/groups/etc but without writing any new code. Instead you can just change your input variables and run as normal.

To change a variable click on your **Release Pipeline** option and select **edit**
Within that pipeline you should see an option at the top called **Pipeline variables**. You can add in different variables, e.g. name: cloudid, Value: pea01.

These variables can then be called back within your pipeline such that when you need to input a storage account or ID etc. instead of inputting those manually you can just put in the option $(cloudid) and it will call it for you.

The general format for variables is `$(yourVariable)`.
Example: `--url $(myURL)` will return `--url https://hellothere` if `myURL` is set to `https://hellothere`.