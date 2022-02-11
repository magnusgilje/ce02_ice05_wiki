1. Select the **Releases** option on the **Pipelines** dropdown. On the left hand side you should see an option saying *New* - select this and choose *New Release Pipeline*
2. Select your template (generally an **Empty job**  template, seen at the very top)
3. Add your artifact - this is what you generate from your CI pipeline. This acts as your source information for the deployment pipeline
4. Click the lightning bolt symbol to decide whether you want to enable continuous deployment
5. Add your stages (e.g. development, testing, production).
6. Within your stages add tasks to your work in the same manner as you did in [Creating a New Pipeline](/ce02-wiki/Using-Pipelines/Pipelines/Creating-a-New-Pipeline).
1. Within the task "Publish Test Results", inside its "Control Options", set the value for "Run this task" to "Even if a previous task has failed, even if the deployment was canceled". This forces the pipeline to show the results of the test, even if the tests themselves fail. This helps to pinpoint the point of failure in the pipeline.