This subsection of the Wiki only deals with the steps for deploying to various hosts and assumes that *your account with each host is correctly configured* and that *your website actually works in some basic sense*.

This subsection of the Wiki does not deal with account creation or all of that behind the scenes stuff that admins have all the joy of setting up.

[[_TOC_]]

# Understanding the Public Folder

In pipelines and cloud deployments, the `Public` folder is always being added or uploaded or whatever. The `Public` folder is a bit of a popular folder. But it's a directory that's listed in `.gitignore`, meaning that the only place that won't have this all-important folder is the repository with all the code. Why is that?

The `Public` folder is created when you run the command `hugo -D`. This command tells hugo to generate the files that the webserver will serve to a client. Basically, the `public` folder, true to its name, is the public-facing side of your website. This means that every time a change is made to your website, the `public` folder is updated.

If the `public` folder is being included in the code base, it will be hard-coded and become resistant to future changes. Which sucks. This is why it is excluded through `.gitignore` and yet used in pipelines and cloud deployments. We don't want this folder hard-coded - it is generated fresh every time a server is launched anyway. It becomes an artifact that we can use in pipelines because it is generated fresh every time a pipeline is run (through the hugo generate task). It also has to be manually updated on each cloud deployment because those deployments *do not* contain the code that would be updating this folder.

**If your** `public` **folder has not yet been ignored, you can still add it at a later stage. Once you do that, delete the public folder to force it to update when you run** `hugo -D` **again**.

# Deploying to AWS
## Prerequisites
This guide assumes that your site *works* in its current state and that it has created a `public` folder. It also assumes that your Amazon account is correctly set up and configured with S3 storage.
## The Manual Method
1. Navigate to your bucket in the S3 storage area. `Services > Storage > S3`.
1. Inside your bucket, select the big orange `Upload` button.
1. Add **the contents** of the `public` folder to the `File Upload` area. The quickest way to do this is to have a File Explorer window open alongside the upload page, allowing you to select everything inside the `public` folder at once and simply drag it into the browser window. Who said GUI didn't have its uses?
1. Expand the `Permissions` section and **make sure you have selected "Grant public-read access"**. If you do not, you will run into fancy 403 errors and will have to do all of this again. Don't say I didn't warn you.
1. Expand the `Properties` section and add some useful tags so that you can find the files later on.
1. Click `Upload`.
1. Now, your bucket should show you all the files that you just uploaded. In the bucket, navigate to the `Permissions` tab and edit the "Block public access" settings for the bucket. Uncheck everything. Amazon will not like it, but since when did we care what Jeff Bezos liked? Accept all the warnings.
1. Navigate to the `Properties` tab and scroll to the bottom. There will be a section titled "Static website hosting". Edit these settings.
1. Select `Enable` static website hosting.
Select `Host a static website` under "Hosting type".
Input `index.html` as the "Index document".
Select `Save Changes` and be happy (until an error hits later).
1. Under "Static website hosting" in the "Permissions" tab, AWS will indicate the website endpoint. This is the URL that you will need to navigate to the website in your browser.

You have now deployed a website through AWS.

# Deploying to Azure
## Prerequisites
These steps take place in Visual Studio Code and require that the **Azure Tools** extension has been installed. This guide also assumes that the website *works* in its current state and has created a `public` folder within its directory. Check in File Explorer if in doubt.
## Steps
1. In Visual Studio Code, find the Azure logo on the left-hand panel.
1. Select the `STORAGE` drop-down and locate the desired deployment repository (i.e., the place where you want your website to live in Azure).
1. Right-click on the desired repository and select `Deploy to Static Website via Azure Storage...`.
1. Visual Studio Code will sneakily shift your attention to the search bar in the top centre of the screen with an option to `Browse`. Select your `public` folder.
1. A rather scary pop-up will warn you that some things will get deleted. Select `Delete and Deploy`.
1. Once deployed, a small pop-up will appear in the bottom right corner with an option to `Browse to website` as well as a URL with the primary web endpoint. This is the URL you will need to browse to this website from a web browser.

Your website has now been deployed to Azure.

# Deploying to GCloud

# Deploying to Local Host
## Prerequisites
This guide assumes that you already have your site made and that it functions in some basic sense. This guide also assumes that Visual Studio Code is installed, although I don't think this is absolutely necessary.
## Steps - Running a Server With Python
There is a bit of infrastructure that must be installed and prepared to open a server with Python. These steps assume these are in place prior to starting.
1. Follow the steps [here](https://dev.azure.com/kubrick-training/ce02/_wiki/wikis/ce02.wiki/504/Preparing-the-Pytest-Environment).
1. Run `python -m http.server --directory ../../public 80`. If this is successful, you will be able to navigate to your website in your browser with the URL `http://localhost`.
**If you can't**... Try step 3 of running a server without Python, and if that doesn't work or looks like it might be too expensive double check which directory you're running your commands from. That's usually the problem. Or check for typos. That's another.
## Steps - Running a Server *Without* Python
These steps assume that a website has already been built and *works*.
1. Ensure that you are in the directory that contains the `config.toml` file.
1. Run command `hugo server -D`.
The `-D` parameter indicates to Hugo that draft pages are to be served as well.

1. ~~Sacrifice seven chickens at the points of a heptag̴̨̢̧͓̬͕̼̭̟̓̀ŗ̶̡͚͍̮͚͍̇̏̀̄̑̌̈͘͘a̷͉̖̫̗̬̖̍̽m̴̼͙̙̝̯͎͎̈́́̊̾̉̾̃͝͠ ̴̝̱̥̮̼͊̂͊͑͌t̸̢̢̳͓̻͇̱̞͎̭͛̽́̑̈́̃̀͝o̵̦̫̠̍̓̒͗̑ ̵̦͍̤͎͓̫̔̎͜ͅͅt̷̫̼͙̪̯̀̍̄͑ḧ̴̡̧̗̹͖́ė̶̺̃̔̀̃̎͗̈́͜ ̴̢͚̭̾͘m̵̨̙͎̦̹̰̘̣̓̈́͒̑͜ͅĭ̶̛̜̃͒̂͜n̸̜͖͖̚͝i̴̡͙̯̤͓͖̝͙̖͙͂͂̒̍͋̀̌̕̕ŏ̷͕̖̳̞͙̕͜͝n̶̼̗̺̠̞̐͛͗ş̸̡̲̞̎̏̈́̎͒ ̸̣͔̙̜̤̒͐̔͜o̷̫͇̪̠͒͐̌̊̓̈͋͝͝͠f̴̡̺̥̳̠̗͇̺̺̝̿̋͒͋̓͝ ̷̯͇̺̞̟̃͗͋̿́ȁ̶̢͙̗̞͇̭͕̙̌̚f̵̧̩̪̫͊ͅͅs̶͕͇̺̤͈̝̎̒͂̈́̀̿͌̈́͝h̴͈̾j̶̨̟͇̦̩̼̠̮̠̑̄̌̈̑ǩ̶̲̖̀k̴̗͆̔͌̈́̄͂̎͌̈́l̸̤͇̘̱͊̇͋͆̊̽̀́̕f̸͓̘͇̘̝͚̹͔̗̟͒ǎ̴̧͎̥͈̦͚̯͜ͅe̵̤̾͐͑̒̒͊͝~~
1. Visual Studio Code will indicate a URL.
1. The website can be accessed by navigating to the indicated URL.

You have now deployed a website with your machine as the server.

Consider that you may need to adjust your firewall rules if others are unable to visit your site.