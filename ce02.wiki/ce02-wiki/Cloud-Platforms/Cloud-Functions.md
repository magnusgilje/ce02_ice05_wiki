[[_TOC_]]

# Azure Functions

## Setting up the Function

1. Go to Azure in VS Code.
1. Go to the "Functions" drop-down.
1. Click on the little folder with a lightning bolt to create a new project.
1. Select your function (in this case, circle).
1. Select "Python".
1. It should now say "HTTPTRIGGER" or something like that. Name your function.
1. Click "Enter".
1. Make it Anonymous.
1. Accept all the warnings.
1. Good, a new function template has been initiated.
1. Go back to file explorer and a new folder will have been added to your directory. Rename it to something useful and preferably unique (globally).

## Deploying a Function

1. Right-click on it and select "Deploy to Function App".
1. Create a new function (advanced option).
1. Name your function the same thing as your folder - keeps things globally unique and sensible.
1. Select "Python 3.9" as the runtime stack.
1. Select your resource group (this time it's the one with "fn" at the end).
1. Select your region - this time it's North Europe.
1. Select "App Service Plan".
1. Select the service plan you'd like - this time it's related to your pod.
1. Select your storage account.
1. Select an Application Insights resource - this time there's only the one.
1. Confirm the name, and go have fun.
1. If the setup is successful, you will receive a URL in the OUTPUT window - it's called a `HTTP Trigger Url`. You may get more than one if that's what you're trying to set up.
1. **IF** your deployment fails, well at the moment Martin is suggesting that you run through the setup again but we don't know if that'll work yet.
   - Sometimes Function Apps may suffer mini DDoS attacks if the whole cohort goes at it at once, leading to failures.

## In your code
1. Add a line to your `def __init__` function that's inside the `circle.py` file. This line, at the end of your function, should read
`logging.info('created circle with {:.2f}'.format{self.radius})`
It might look something like this:
![image.png](/.attachments/image-2c5c1692-613c-41e1-ba8a-f18eaab231f2.png)

## Now that it's set up...
1. If you go back to the Azure section, you can see the new functions it is setting up by going to the "functions" drop-down and refreshing that view.
1. Go and test your URL in your browser.
1. Go to your `__init__.py` file in the new folder that you created just now (you know, the globally unique one). This one tells the browser what to do. The stuff in here can be edited to make the server respond according to the functions and classes that you've already developed (you have done them, haven't you).
1. Now go to your `circle_demo.py` file and copy the line that says `sys.path.insert(0,"..")` into the top of the `__init__.py` file from the previous step.
1. Go through the `__init__.py` code and change everything that says "name" into "radius". You can use "ctrl + h" for this.
1. Save it and "Deploy to Function App" again. That's two headers ago - off you pop, I'll wait.
1. Copy lines 29 and 30 from the `circle_demo.py` file into the `__init__.py` file and paste it into line 20. There may be some tweaks needed to fully integrate it.
1. Remove what is now in line 21.
1. Add `import circle` to the top of that file.
1. Ultimately, your aim was to hijack this template using your circle code, so that instead of asking for a name, it asks for a radius and then does circle things with it.

Your deployment should maybe look something like this:
![image.png](/.attachments/image-d2c11aa5-0bab-4715-af0c-e4196388f57b.png)

1. **In the browser url**, append the text `?radius=5` or any other number.
   - At the moment the app service may not have taken your changes just yet. So yeah. Be patient.
   - When it works, it'll do your circle things.
1. Now we want it to log some errors. Go to `__init__.py` and wrap the "myC" bit with an error handler. It should now look like this:
![image.png](/.attachments/image-69d08fd1-2fd9-4067-bea3-716f95efc270.png)

## Now head back on over to your [Azure portal](https://portal.azure.com)
1. Go to "Resource Groups".
1. Go to the one that has "fn" at the end. You can see all of the functions that have been deployed as part of this resource group now.
1. Go to "Application Insights" to get a good look at different resources.
1. Go to "Live Metrics" to see nice live graphs of some diagnostic things.

# Google Cloud Functions

1. Go to your [Google Cloud portal](https://console.google.com/home)
1. Search for "Cloud Functions" in the top bar.
1. Walk through the process, ensuring that your authentication and permissions are set correctly or **sh*t will go wrong**.
   1. Click "Create a Function".
   1. Give it a decent name. You know the drill.
   1. Set region to "Europe West 2".
   1. Trigger Type to "HTTP".
   1. Make sure the button next to "Allow Unauthenticated Invocations" is selected.
   1. Require "HTTPS". It's good for you.
   1. Expand the Runtime, build, and security settings.
   1. Fill in the Runtime environment variables. In this case it's `DEFAULT_RADIUS` whose value is 1.0.
   1. Go to connections.
   1. Select the button next to "Allow all traffic".
1. Click "Save", then "Next" (which will become blue after a successful save).
1. Set "Runtime" to "Python 3.9".
1. There will be a `main.py` file and a `requirements.txt` file.
   1. Paste over the contents of `main.py` with the contents from that other file, or whatever you need to get it to recognise and run your functions.
1. Add a new file with the little "+". This will be your function file which you'll need for the function.
1. Change the "Entry point" to `circle_gcp`. This has to be the right method to initiate the function.
1. Go ahead and deploy that.
1. It may take a little while to deploy. Start panicking. No, don't it's fine.
1. Go to your "Permissions" tab within the function and set `allUsers` as a new principal with the role `Cloud Functions Invoker`. It may already be assigned from inherited properties.
1. Click on your function and go to the "Trigger" tab. This will show you where you need to go to light it up.

# AWS Lambda Functions
1. Go to your [AWS portal].
1. Search for "Functions". You want Lambda functions.
1. Author that bad boy from scratch.
   1. Name your function. (As per usual.)
   1. Runtime is Python 3.9.
   1. And everything else is as default.
1. Create function.
1. Inside your function, you may insert your function as a separate file in the "Code Source" area.
1. You can use the "Test" function to configure test events which it will pass into your function to see if it will work. After running a test you will see execution results.
1. Go to your Configuration tab and set your default variables in the "Environment Variables" section. Use a name like `DEFAULT_<variable_name>`.
1. Go back and call it done!

## AWS APIs

1. 