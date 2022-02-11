Make sure you have gone through and understood the steps in [creating a website](/ce02-wiki/Website-Creation/Creating-Websites-and-Azure-Repositories). **Missing or forgetting** `hugo submodule update --init` **can also cause funny 404 errors that otherwise have no cause.**

Make sure you have gone through and understood the steps in [deploying to the cloud](/ce02-wiki/Deploying-Websites).

Make sure you have gone through the steps for [preparing your pytest environment](/ce02-wiki/Website-Creation/Testing-Websites-with-Pytest/Preparing-the-Pytest-Environment). **Forgetting to run** `pip install -r requirements.txt` **will cause failures that might be hellishly difficult to diagnose.**

All done? Now follow closely...

[[_TOC_]]

# Running Pytest
- Check that you are in the correct directory (the directory above the one containing your python files)
- You will also need to split your terminal because once you launch the server **you will not be able to interact with that terminal until the server has been closed**. So go ahead and run the script activations in two terminals, launching the server from one and the test from the other, once the server is up.
- Make sure you have gone through [Preparing the Pytest Environment](/ce02-wiki/Website-Creation/Testing-Websites-with-Pytest/Preparing-the-Pytest-Environment). This is your last warning. `pip install` will end you.
1. Run `python -m venv .`
1. Run `.\Scripts\activate` (This will give you that lovely green (ux) symbol in VSCode)
1. **Check** that pytest exists and is working: `pytest --verion`
This command will return a neat little line about which version of pytest you're running if pytest exists and is running. If it does not, go back and make sure you're running everything in the right directory.
1. Run `python -m http.server --directory ../../public 80` This launches the website with the local machine as the host.

**Check** that your website is working by browsing to it manually. If you get a 404 or anything other than what you expected, there is something you need to fix. Check which directory you're running your commands from, check that the public folder is present and updated (remember `hugo -D`?), or just delete your `public` folder and start again. If in real doubt, try browsing to it in an incognito window to make sure your browser cookies aren't messing with you, and **make sure other stray VS Code windows are closed**. Check other CMDs too for rogue servers on your local machine.

**In the other terminal**

5. Run `pytest test_hugo.py -v --url http://localhost`.

**IF** you are testing web deployments on other clouds, simply change the URL to your Azure URL, AWS bucket URL, or GCP URL.

**IF** you are testing a deployment as part of a pipeline in the cloud, add the following parameter to your command: `pytest test_hugo.py -v --url <URL> --headless=yes`.

# Adjusting Your Test

1. You may need to make and save changes to your test file
- Make changes to test code file (here `test_hugo.py`)
- Check the status of your branch to determine if there are changes to be saved: `git status`
- Add file changes to branch: `git add test_hugo.py`
- Commit these changes to your branch: `git commit -m "Title of changes made here"`
2. Check your website on the local host
`pytest test_hugo.py -v --url http://localhost`
3. If the website is working you can push the changes:
`git push`

# Additional Notes
The `--headless=yes` option prevents the test from opening any browser windows. This is useful when testing deployments on servers where there may not be input/output devices, making interactions with a website impossible.
A **web driver** is a remote control that acts as an interface to allow user agents (such as web browsers) to be controlled by other programs.

## Checking Test Results
Your tests will probably fail more than they succeed. When they fail, first things first, check that your site is configured correctly. Have you run `git submodule --init` since launching your site? Is there a theme in place? Does your site behave correctly when you navigate it manually? Does it update as expected when you make changes (is the `public` folder ignored)?

Then check your naming. Does the site name match the name the test is looking for? Does each page match the details that the tests are looking for on each page? Are there any illegal characters in the wrong places (e.g., a blank character in a URL)?

Good luck, young Padawan. You're going to be looking through these kinds of things for a long time...