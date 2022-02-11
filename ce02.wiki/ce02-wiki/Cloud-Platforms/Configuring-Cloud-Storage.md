This sub-section of the Wiki discusses the various steps to setting up different cloud environments.

[[_TOC_]]

# Azure Blob Storage
1. Go to your [Azure Portal](https://portal.azure.com).
1. Somewhere, in the haze of options and places you could be, find "Storage Accounts". You need to create a new storage account that will function as the place in the cloud where all your stuff will live.
1. Click `Create` in the top left corner. There may be a big "+" next to it.
1. It will walk you through the process of creating a user account. Things to be wary of:
   - Mind your subscription. This affects who gets charged for everything.
   - Mind your resource group. This affects how angry the admins get with you when it's wrong.
   - Name your storage account. Make this something that follows a sensible convention - it'll make development pipelines way easier later on.
   - Your region will be determined by the policies on your subscription. Find out which region you should be in from your administrator. Otherwise, just click around.
   - Performance affects costs (I presume).
   - Redundancy affects how resilient your storage options are. This will depend on your application.
1. Things to look out for in the "Advanced" tab:
   - These settings are generally application-specific and if you know, you know - if you need to ask what it is, you probably don't need it.
1. Things to look out for in the "Network" tab:
   - You'll need to select "Public endpoint (all networks)" if your content needs to be made accessible to the internet.
1. Things to look out for in the "Data Protection" tab:
   - Again, if you need to ask what these are, you probably don't need it.
1. Please tag your storage appropriately. Makes it easier to find.
1. Review your settings and launch that sucker. You now have a storage account with Azure.
1. Did you think you were done? Well, you nearly are. Head on over to Visual Studio Code.
1. Add the Azure Tools extension to Visual Studio Code. Once installed, a big fancy "`A`" will appear on the left side of your window, under the file explorer, branches, and extensions icons. Go there.
1. Azure should then walk you through the process of signing into your Azure account and, as if by magic, your storage account will appear in the sidebar.

**It is possible** that Azure does not automatically sign you in. In this case, you will need to check... some things... that I am not sure about at this point. Post a comment if you find out how to troubleshoot stubborn Azure connections.

# AWS S3 Buckets
1. Sign in to your [AWS management console](https://console.aws.amazon.com).
1. Under the little dropdown that's supposed to say "Departments" (don't lie to me, I know you shop at Amazon and I know you were expecting some shopping options there), under "Storage", click on "S3".
1. Click on the big orange "Create bucket" option on the right.
1. Set your bucket name. Try and use a naming convention that will make it the same as the Azure and GCloud buckets, and **make sure it satisfies the naming rules that Amazon has set out**.
1. **Uncheck the tick box for "Block *all* public access"**.
1. Add tags to help identify and group your bucket.
1. Consider encryption. You may need it, you might not, but this will be application-dependent.
1. Under the "Advanced settings" you'll probably want to leave Object Lock disabled. This is application-dependent too.
1. Create your bucket and enjoy!
1. Now go into your fancy new orange bucket. It'll be empty. Go to "`Properties`". Right at the very bottom, there's a "`Static website hosting`" section.
   - Enable status website hosting.
   - Scroll down and define the index document, which will almost invariably be `index.html`.
   - Save those changes, come back out and make a note of your Bucket website endpoint. You'll need this URL to navigate to your website from the interwebs.
1. Go to "`Permissions`". "Block *all* public access" should be "`Off`". As should everything else in that list.
   - In the "`Access control list`", the list should look something like this:
<image coming>

You now have an AWS S3 bucket ready to accept website files.

# GCloud Buckets
1. Sign in to your [Google cloud console](https://console.cloud.google.com).
1. Open up the hamburger menu in the top left (yes, that's what it's called - I don't come up with these things, it's just the way it is), scroll down the list until you find "`Cloud Storage`" under the "`Storage`" header.
1. At the top, there's a cute little "+" with a button to "`Create Bucket`".
1. Name your bucket. Make sure it follows Google's guidelines. Make sure it follows a convention yada-yada...
1. Choose your region availability and location. Speak to your administrator if you're unsure.
1. Choose a storage class. Some funky names. This will be affected by your application.
1. Leave that thing about enforcing public access prevention unchecked (how's that for a double-negative with an affirmative option).
   - Also set your "`Access control`" to "`Fine-grained`". You can change this later, but this is one option that comes back to bite you when nobody can get into your bucket and browse your site.
1. Protecting object data is application-specific so go ahead and breeze past that.
1. Create your bucket and enjoy!
1. **BUT** we're not done yet. Go back to your shiny new bucket and go to "`PERMISSIONS`".
   - Add "`Permissions`" - the one with the lil' person icon.
   - Add a "`New Principal`" going by the name of `allUsers`.
   - Set their role to `Cloud Storage` (first column), `Storage Object Viewer` (second column).
1. With all that in place, your GCloud bucket is ready to host your website!

# [Follow the next steps to deploy your website to these clouds](/ce02-wiki/Website-Creation/Deploying-Websites)