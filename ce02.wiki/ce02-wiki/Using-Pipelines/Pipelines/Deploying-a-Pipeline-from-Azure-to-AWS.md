So you have a working CI/CD pipeline in Azure, but you want it to deploy to AWS too. Well, good luck!

Nah, jokes, of course I'm here with some steps for you.

[[_TOC_]]

# Steps
1. Go to your CD pipeline from the "Releases" tab on the left, under "Pipelines" (you should be clicking on a little rocket icon).
1. Edit your pipeline by going to the top right and clicking "Edit".
1. Go to the "dev" section of the pipeline.
1. Go to the "Tasks" tab and create a new Agent Job by clicking the kebab menu on the right of the title.
1. A new block should appear, and you will want to rename one of them to "Azure" and the other to "AWS" to make this clearer to the hoomans using the pipeline.
1. Clone all of the tasks already in the Azure block. *Don't clone the "Upload to Azure" task.*
`ctrl+click` to select multiple, then just right click and select "Clone".
Then drag them all, in the same order, into the new AWS block.
It should now look like this:
![image.png](/.attachments/image-dbac1709-bac9-44d3-b4be-0922263c5f37.png)
1. Add a new task to the AWS block. Search for "S3 Upload" and populate it like so:
![image.png](/.attachments/image-8245b8e0-1669-433c-8319-8d67e682a65d.png)
Obviously, change the names of things that should be your things, not my things. So your **bucket name** should not point to *my* bucket. And if it does, I will know...
Also please check that your **Access Control** is set to "public read".
1. Now, go to your Command Line Script copy. Remember that URL from way back when you deployed your AWS website? Change the URL in the CMD block to the URL for your static website.
1. Make sure your bucket is empty, and if you save and run your release, it should all work and your site will be tested and deployed to AWS. The bucket should now be populated with your files.

# Troubleshooting
**Check that your web tests work on your local machine first.** This saves time and effort by preventing the situation that a duff test was uploaded. If you **know** that your tests work and your deployment should pass, it shifts all the troubleshooting to the cloud environment, rather than having to figure out that your tests were never going to pass anyway.

`cmd.exe exited with code '1'`. Check and double-check your URLs. This may be because a reference, link, or directory is broken or points to the wrong place. Check your Access Control setting in the "Upload to S3" task too. This code means that CMD couldn't get into something that it was expecting to be able to get into.