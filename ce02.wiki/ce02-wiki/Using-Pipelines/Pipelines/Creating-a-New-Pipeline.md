# Creating a new pipeline in Azure DevOps

1. Go to Pipelines > new Pipeline (top righthand corner) > click **use the classic editor to create a pipeline without YAML** (at bottom)
2. Select the project, repository, and default branch you want to use (e.g. team project: ce02, Repository: hugo_mp, Default branch: ux_tests). Make sure that you are in the **Azure Devops Git** and select continue
2.a. Choose empty job at the top of the screen, rather than selecting a template (NB: once you've done this if you select **Get sources** it will tell you if you have the correct source/configuration)
3. To add a new command to your pipeline click on the + on **"Agent job X"** (e.g. a command line script) and input the functions/commands/etc. that you would like to run. Within the task (e.g. your command line script) you can change the name in **Display Name** so that you can clearly see what work is being done in each task and it is easy to go back and edit your pipeline (think of this how you might label your git commits)
4. Select **save and queue**
5. You can go back and edit this pipeline to fix bugs/whatever by finding this pipeline in **Pipelines**, selecting it, and then clicking **edit** in the top right hand corner

To review the results of a pipeline run, go to `pipelines` and select your pipeline. Select the desired run:
![Pipeline run.](/.attachments/image-eea7a238-b776-4a0b-be8d-6efc97dc0e0b.png)
You will now see a summary of the pipeline run. To check that it has created the outputs that you requested, select on the `Related` column and click on `Consumed`, which will show all the artifacts consumed by the pipeline and those created.
Along the top again, go to `Tests` to view the result of any tests that were run within the pipeline.

## Notes:
- You may want to an extension to your pipeline so that it can mirror your machine. For example, if you want to run Python you can select **add agent**, type in Use Python Version* and input the version of python that is suitable for your Mac in the *Version Spec* command (e.g. change 3.x to 3.10
- Inside your agent configuration you can add in 
- You can right click on various agent tasks and choose to enable and disable them as required depending on what you are doing
- In any task, you may set the "Control Options" to force a task to run even if the task itself fails or if preceding tasks fail. This can help in troubleshooting or to force a pipeline through to completion.