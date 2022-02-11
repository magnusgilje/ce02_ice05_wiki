Here it is, ladies and gents, the cloud we've been waiting all week to deploy. It's been so long that I even forgot that we already had a GCloud console set up...

Anyway, the steps and common problems with deploying to GCloud from an Azure Pipeline.

[[_TOC_]]

# Steps
1. Create a bucket in your GCloud console. Ensure that the option for `Enforce public access prevention on this bucket` is **unchecked**. i.e., you need public access to this bucket.
Additionally, it may be necessary to change your bucket permissions so that Access control has been changed to "Fine-grained".
1. Within "Permissions", select "Add" next to permissions to add a new principal called `allUsers`. Change its role to `Storage Object Viewer`. Accept the scary notif to allow public access.

Now go back to Azure DevOps, back to that friendly interface we all know and love.

3. Click on the rocket on the left and go to "Releases". Go to your release and click "Edit" in the top right. Then go to where you need to edit your tasks (in this case, "dev"). But you knew this bit already.
1. Add an Agent Job and call it GCP.
1. Add a task called "Download secure file". You'll need to select a Secure File which better have been configured behind the scenes, otherwise, this is going to return blank and we'll be stuck. Add an "Output Variable" and call it "gcp" just to make it easy to find and reference in other tasks. It should look like this:
![Step 5: Download Secure File settings.](/.attachments/image-c690dfa8-8624-47ef-9387-345d90bc58be.png)
`Reference name` = `gcp`
1. Add a task called "Run a custom gcloud command", which will allow you to run GCloud commands. Which is sick, because Alphabet, in all its glory, couldn't get this set up themselves. Populate it like so:
![Step 6: Run a custom gcloud command settings.](/.attachments/image-d848a39b-0a19-4d3c-bbc7-84b71eaad935.png)
`command` = `auth`
`arguments` = `activate-service-account --key-file $(gcp.secureFilePath)` (remember we set this variable just now?)
1. Add a task called "Run a custom gsutil command", which is something else Alphabet has declined to grace us with. Populate it like so:
![Step 7: Run a custom gsutil command.](/.attachments/image-b03686cf-5b16-4854-8ae0-ffa34014f1dc.png)
`command` = `cp`
`Arguments` = `-r . gs://ce02gar05dev` where the directory will be **your directory**. As before, if you upload into mine, I will know...
`Working directory` = find your "site" folder as before.
`Command options` = `-a public-read` which sets all the files that have been copied over to have public read access.
1. You should end up with an agent that looks like this:
![Step 8: All agents in Azure Pipeline.](/.attachments/image-2a384cd7-bee5-4e5f-825d-2c77eb7e1a6c.png)
1. **Don't get smart here.** Don't go ahead and set that control option to "run even if the house is on fire" because we need to check that the pipeline is working and configured correctly before we go and tell it to ignore errors. Run your pipeline.

# Troubleshooting
`Failed with exit code 1`. There's a directory that doesn't exist. Check your references, directories, and names.
`Failed with exit code 2`. Go and check your commands inside each task. There's a stray character somewhere, usually a space or period that's missing or not supposed to be there. Or, like me, you've misread a command and typed it in wrong.
Still got an `exit code 2`? **Go and check again!**