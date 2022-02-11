[[_TOC_]]

# Some setting up going on
1. Windows Powershell ISE. Open as Administrator. Just do it. (I just got here I'm not sure where we're going just yet.)
1. Open up [this file](/.attachments/machine_info-aa971e2a-ecf7-447d-929d-00ad6e8bcc55.ps1).
1. Highlight all of it (`crtl + a`) and hit F8 on your keyboard (also "Run Selection" up at the top).
1. And it'll spit an output out in some directory. Look in the blue area and you'll see "`Writing to...`" and then some splurge which will take you to the file.
1. Go ahead and upload that to the folder called `machine-info` in the General channel.
   - This script just spits out a whole bunch of information about your machine. We trust Martin and this is what he says it does, so yeah.
   - Check out the line in the script that says `$info = Get-ComputerInfo`. If you run this command on its own you get `absolutely everything`. This script slims that down so it's just what we want. Or what IT wants.
1. If you're curious, double-click that sucker and it'll open up in Notepad or VSCode or other text editor.
1. Now go back to Windows and in the search bar type in "Scripts". A spanner and screwdriver will turn up.
1. Change the execution policy on Powershell and click Apply. You want it to allow scripts to run.
   - This allows scripts to run on your machine, which is disabled by default for security reasons. Because a script can do anything... So by allowing scripts to run, your machine's safety is on you. Check your scripts before running them! And keep backups.
   - So on some machines, it seems that the checkbox is ticked but not applied. If the checkbox and "Apply" button is lit up, you'll need to click on "Apply". If "Apply" is greyed out, it's already been applied. Weird but true. I don't make the rules.

**Step 8 is probably the important one. Step 5 was just for the session.**

# Some General Notes About Scripting
A script is a collection of commands that a computer runs. It is functionally very similar to a program, as we saw with Pytest and other things that we might have run. Hey, we even had a "scripts" folder (that was causing me all kinds of problems). Technically, it is also a more human-readable format than other formats that would probably install you into the Matrix or something.

Scripting can be thought of as a kind of glue that binds different programs together to form larger programs or suites of programs.

Scripting can expand the functionality of existing programs

## Bash and Bashing
[Bash is a Unix shell and command language written by Brian Fox for the GNU Project as a free software replacement for the Bourne shell. First released in 1989, it has been used as the default login shell for most Linux distributions](https://www.google.com/search?q=bash&oq=bash&aqs=edge..69i57j0i131i433i512j0i512j0i433i512l4j0i512.479j0j1&sourceid=chrome&ie=UTF-8). "Born Again Shell."

So the commands we think of as being associated with Linux distributions are generally pretty similar, if not identical, to Bash. Because they're the same language. I think.

`#!/bin/bash` - identifies a file as a bash file, and therefore a file containing scripts. This line at the top of the file specifies the binaries (bin) in question (bash). "Run this file with Bash."

**API** - Application Programming Interface. A software intermediary that allows two programs to talk to each other. [This website](https://api.weather.gov/alerts/active?area=AM) is the API between the weather service behind the site and whichever scripting programme you're using to get the weather.

`curl` - is a command-line tool to transfer data to or from a server, using any of the supported protocols (HTTP, FTP, IMAP, POP3, SCP, SFTP, SMTP, TFTP, TELNET, LDAP or FILE). "Command URL."
   - An example, using the weather site from just now, would be `curl <URL> | jq`
   - The `|` delimits the command, separating out the other parameters.
   - `jq` as a parameter just formats the plain text in a way that helps a human to read the text that `curl` would return. `jq` specifically stands for "JQuery", which recognises that the incoming text may be in the JSON format.
      - The cool thing is that you can use `jq` to search for specific parts of a site. Recognising that the output of a site is a bunch of key-value pairs, we can use `jq` to search those keys to return a bunch of values that you're interested in.

`chmod +x !$` - WHAT A COMMAND! 
- `chmod` changes the access permissions to a file.
   - `+x` - "Make my file executable."
   - `!$` - "The last command I did."
- Altogether now: Change the permissions on my file so that it is executable, but my file is in the command I executed previously.

`touch <filename>` - create a blank file right here, right now.

`~` - A shorthand way of writing "home directory".

### An Example of a Script
`weather.sh`

    1   #!/bin/bash
    2   
    3   if [ -n "$1" ]; then
    4      curl https://api.weather.gov/alerts/active?area=$1 | jq '.features[0].properties.description'
    5   else
    6      echo "Region defaulted to 'AM'"
    7      curl https://api.weather.gov/alerts/active?area=AM | jq '.features[0].properties.description'
    8   fi
Which says:
Line 1: run this thing as a bash.
Line 3: Check the first variable, `$1`, which the user passes to the script. If it is defined, then...
Line 4: Command URL to that URL and where that cheeky `$1` is at the end, substitute it with the defined variable. This is also a JQuery and I've asked for those bits of the returned content.
HOWEVER
Line 5: If `$1` is not defined,
Line 6: `echo` to the screen the following message,
Line 7: then run the command to get that information from the defined URL.
Line 8: Finished, innit.

**And the indentation is important!** Use the `tab` key to get the proper indentation and give your spacebar a rest.

Then, to run this command, I'd go into the command line in bash:
`chmod +x weather.sh`
Which says "change the file `weather.sh` into an executable and run that sucker".
But to actually pass it the variable, you'd want to add something like
`weather.sh UK`
Which will use the first variable (in this case the string "UK") inside the function.

### A Quick Note on Variables
`$0` is the command itself.
`$1` is the first string after the command.
`$2` is the second string after the command.
So in this command: `thisScript.sh firstVar secondVar`
`$0` = `thisScript.sh`
`$1` = `firstVar`
`$2` = `secondVar`

# Scripting in the Cloud
Each cloud provider offers its own interpretation of a scripting environment or console that allows you to interact with their computers in a consistent way.

## Scripting in Azure
1. Head on over to your [Azure portal](https://portal.azure.com/) (if this isn't a bookmark yet, it should be).
1. On the **immediate right** of the search bar at the top centre, there's a familiar-looking Powershell-esque icon. Click on it.
   - For now, select `Bash`, although you can swap later.
   - It may say something about creating storage. Go ahead and accept that.
   - **If your storage creation fails**, well you've been royally sabotaged.

## Scripting in GCP
1. Head on over to your [Google Cloud Platform](https://console.google.com/home/) (if this isn't a bookmark yet, it should be).
1. On the **right** of the search bar at the top centre, next to a vaguely gift-like icon, is the console icon. Click on it. This area is called the "`Cloud Shell Terminal`".
   - You may need to click "Continue". And you may need to wait a few seconds. Be patient. It'll appear.
   - This console works in Bash.
1. **To swap to a Powershell console** just run `pwsh` and it'll swap.
   - If successful, your console on the left should swap to `PS>`.
1. **To swap to a bash console** just run `exit` and it'll go back to the default console (bash).
   - It'll now show your file path instead of `PS>`.

## Scripting in AWS
1. Head on over to your [AWS console](https://console.aws.amazon.com/console/home/) (if this isn't a bookmark yet, it should be).
1. On the **immediate right** of the search bar at the top centre, there's a familiar-looking Powershell-esque icon. Click on it.
   - AWS will open up a new tab, ask you to click through some advertising (well, more an information block, but I've done two others and I'm cranky).
   - This terminal is called "`AWS CloudShell`".
1. You can swap to a Powershell console by running `pwsh`.
   - If successful, `PS` will appear to the left of your current line in the terminal.
1. Swap back to bash by running `exit`.