This page is a quick and dirty instructional on setting up an Azure repo, branching it, creating a website, and merging your branch back into Main. There will be duplication with other pages, and that's fine because this is your one-stop shop when it comes to smashing a website together in a collaborative environment.

[[_TOC_]]

# Understanding the Public Folder

In pipelines and cloud deployments, the `Public` folder is always being added or uploaded or whatever. The `Public` folder is a bit of a popular folder. But it's a directory that's listed in `.gitignore`, meaning that the only place that won't have this all-important folder is the repository with all the code. Why is that?

The `Public` folder is created when you run the command `hugo -D`. This command tells hugo to generate the files that the webserver will serve to a client. Basically, the `public` folder, true to its name, is the public-facing side of your website. This means that every time a change is made to your website, the `public` folder is updated.

If the `public` folder is being included in the code base, it will be hard-coded and become resistant to future changes. Which sucks. This is why it is excluded through `.gitignore` and yet used in pipelines and cloud deployments. We don't want this folder hard-coded - it is generated fresh every time a server is launched anyway. It becomes an artifact that we can use in pipelines because it is generated fresh every time a pipeline is run (through the hugo generate task). It also has to be manually updated on each cloud deployment because those deployments *do not* contain the code that would be updating this folder.

**If your** `public` **folder has not yet been ignored, you can still add it at a later stage. Once you do that, delete the public folder to force it to update when you run** `hugo -D` **again**.

# Create a Repository in Azure
1. In Azure DevOps, go to Repos, select the dropdown next to your repository name and click on `New Repository`.
1. `Repository type` = `Git`.
Give your repository a name.
Typically, you'd want to add a README and depending on your environment you might want to add things like Python to the `.gitignore`, but this is something you can easily amend later on. **Don't go crazy on your** `.gitignore`. **Files and directories being ignored must have an explicit reason for being ignored, and this usually comes from your infrastructure and development needs.** Leave it blank to start off with, you can always ignore things later.

Your repository should now be initiated with one branch: Main. That's all good, but typically you won't want to be working on the main branch.

# Set Up Your Local Folder
1. Create some local directory that you'll use to house your files as you work on them locally.
1. Inside this base folder, for your sanity, create separate folders with names matching the branches that you'll use. Don't pre-empt this stuff, make it as you need it.

# Branch and Clone
1. You probably won't want to be working on Main, so go ahead and, in the kebab menu on the top right, add a fork to the main branch.
1. Along the top, swap to your branch and, still along the top towards the right, click `Clone` and copy that HTTPS URL to your clipboard. (Just click that copy icon.)
1. From within your branch folder on your local machine, run this command:
`git clone <URL from clipboard> -b <local directory>`
The `-b` parameter tells Git that this is a branch that we're checking out.
1. Your repository should now have been copied to your local machine in a new folder and you're free to mess around with it as you please.

# Creating a Website with Hugo

Follow the steps outlined in [Hugo's lovely guide](https://gohugo.io/getting-started/quick-start/) to create your website. In CMD. In the folder where you want it. This should be inside the folder that was created when you cloned your empty branch.

1. `hugo new site <sitename>`
You have now made a shell site. There's nothing in it.
1. `hugo new posts/<postname>.md`
You now have your first post.
1. Go ahead and check the status of git with all of this: `git status`. If this does not work, check your folders and the directory that you're in.
1. `git submodule add <theme URL>`
You now have a theme on your site.
1. **Check your** `config.toml` **file!** If not present, add the following line:
`base URL = '/'`
This tells the website where the base URL is for your site in the folder structure. If it is not present, the browser will get lost, the server won't know what files to serve, and you'll get a really rubbish experience.
1. `echo theme = "<theme name>" >> config.toml`
Your theme is now listed in your `config.toml` file.
1. `git submodule update --init`
Your hugo site should now be initialised with theme files fetched, etc.
1. In theory, you should now be able to launch your website on your local machine.
`hugo server -D`

If this doesn't work, check which directory everything is in. If it says it can't find the configuration folder and you might need to create a site, go ahead and `cd` to the same level as the `config.toml` and try again. Your `config.toml` file **should be at the same level** as the `themes` folder, otherwise it won't be able to find all of its things. The formatting within `config.toml` needs to be flawless too. Everything is laid out as `label` = `"value"`. The value needs to be enclosed in quotation marks.

Go and check out the cloud deployment instructions for instructions on how to deploy your site to different clouds. Essentially, you're just copying the newly-created `public` folder into the bucket/blob/whatever and making note of the URL that it'll be served on.

If you break stuff, no worries, go ahead and wipe the local file and clone the lot again.

**Note that when you** `git clone` **it will copy everything from the online repository, which means it will bring back everything up to your most recent push. If you've gone and pushed all your mistakes to the online repository, you're going to have a lot more debugging to do.**

You could think of a `git push` as creating a "restore point" (to all those who remember systems that explicitly created restore points) by putting everything in the repository ready for others to clone or pull from. A `git pull` only updates your local repository with the changes that have been committed to the online repository since the last time you did a pull. It isn't a command that is meant to restore your local repository if you've broken it.

# Commit and Upload
1. In your base branch folder, run `git status`. This will tell you about all the changes in your local repository as compared to the online repository.
1. Run a `git add <directories>`. <directories> should be all of the files and directories that have been changed, as listed by the previous `git status` command. To add absolutely everything, run `git add .`. Adding files and folders tells Git what to consider in its next commit (probably more, but at this point, this is why we're using it). This is where your `.gitignore` file becomes useful because it lists the files and directories that it should not consider throughout this process.
1. Run `git commit -m "Look I can commit"` where you would of course make the comment in the speech marks more amusing than what I can come up with right now...
Anyway this step goes ahead and tells Git which changes we've committed to the code and what it should try to commit to the online branch.

**Please be careful about which folder you're in when you run this stuff. If you get** `fatal` **or something just as upsetting, you're probably running your git commands in the wrong directory.**

4. Run `git push`. Now the online repository has been updated with all the changes that you just committed.

# Pull Requests and Main
1. **Back in Azure DevOps**, pop on over to `Pull Requests` in the `Repos` section.
1. Create a new pull request using the only button on the page.
1. At the top, make sure your desired branch and its destination are set, fill in the fields with what you'd like. Add commit messages to the description to get a good idea of what just happened in the most recent caffeine-fuelled programming haze. Link it up to a work item, then go ahead and create your pull request. It may go through some approval process, but at the end, hopefully, your branch will get merged into Main and you can go on your merry way.

# If You're Collaborating
Sometimes it's not so straightforward. Sometimes you're at the end of the queue and you've got to merge 69420 changes to get up-to-date with Main. In that case, you're in luck because these steps are just for you.
1. `git status`. Is your local repository up-to-date with your branch? If not, `git add`, `git commit` (with a meaningful comment, please), `git push`.
1. `git merge origin/main`. This tells your branch to now check with Main to see how far behind you are.
1. A whole bunch of merge conflicts may arise. You'll have to resolve them all. By hook or by crook (but properly, if you can). If you had any tests you were running on your repository, run them again after the changes are merged, just to check that everything is working correctly. That's *everything* including the new stuff you've just added from Main. All good? Good.
1. **After** all the merge conflicts have been resolved, have a look at `git status`. You should see a bunch of things that need to be committed. Add and commit them all (if appropriate - consult your fellow developers, you're all in this together).
1. `git push`. Now your online branch repository is up-to-date with this new code chimaera.
1. Go through the steps to [initiate a pull request](/ce02-wiki/Using-Pipelines/Pipelines/Pipelines,-Repos,-and-Pull-Requests) and, hopefully, your changes will be met with thunderous applause, a clean approval, and will be merged with Main. Good job! (You can now go clean out your local repository because your work item is complete.) - Check best practices on this.