>This page is under consideration for a new Wiki page or step-by-step. Check out other pages if what you were looking for isn't in here!

# Live Session Steps and Notes
This section is exclusively for the step-by-steps in the current meeting/session. It will all be shipped out to its own page once ready. Think of it as a transcript, but trimmed down and re-phrased.

# Afternoon Session
1. `cd ~` to return to the home directory.
1. `ls -A` to show all files, including hidden ones.
1. `cat .profile`, which opens up the named file. This file is run whenever the user runs an interactive file and enables interactivity with live commands.
1. `vim .bashrc` then add to the bottom `export PATH=$PATH:~` appended to the end of `.profile`, which sets every interactive command to run in the root folder.

### You can follow along in the next bit in any local or cloud terminal. It is worth distinguishing between applications like PowerShell 7 and so on that are just text editors with a PowerShell focus, rather than PowerShell itself. Some are also to do with permissions.
Powershell will still run most bash commands - it has strong aliasing (that is, bash commands have been renamed and ported to Powershell).
1. Swap your terminal from bash to PowerShell by running command `pwsh`. If successful, your terminal will show a `PS` next to your file path.
1. `vim example.ps1`
1. `Write-Host "Hello World" -foregroundcolor red`
1. Hit "Esc". Type `:wq`, which means "write" then "quit".
1. `cat ./example.ps1` to view the text file as a text file.
1. `./example.ps1` to run the file, which will display the text, but in red. Nifty.
   - If you just type `example.ps1`, it will fail to identify the file as a command and say something like "`not recognised as a name of a cmdlet...`" and so on.
1. `$name = read-host "What is your name?"` Which will prompt the editor to ask your name.
1. Type your name, and ta-da!
1. `Write-Host "Hello" $name`
1. And it will say "Hello" with whatever name you previously inserted. Again, nifty.
1. Now I want to save my variable. `$name | out-file -encoding ASCII name.txt`.
1. And to view it: `cat name.txt`.
1. But I don't like the name now. `Rename-Item name.txt myname.txt`. The file is now called "myname.txt".
1. But I'm indecisive. `ren myname.txt name.txt`. And now it's back to what it was.
1. `cat <filename>` to view that file whenever you like.

Let's play around with something else.
1. Go look at that weather API from yesterday.
1. Powershell takes the results of queries (such as JSON queries) and will convert them into objects.
1. Make a Powershell script that promts the user for a region and then returns the features for that region.

### Registries
The Windows Registry is a hierarchical database that stores low-level settings for the Microsoft Windows operating system and for applications that opt to use the registry. The kernel, device drivers, services, Security Accounts Manager, and user interfaces can all use the registry.

Changing these files is how to brick your computer. But if you know what you're doing these files are *sick*.

## Powershell
Powershell was a language developed by Microsoft to address the inefficiencies of Bash and allow them to remotely script a machine. Whilst Bash could be seen as a language that thinks in "human-readable" text files (.json, curl, .csv, .XML, .yaml), Powershell thinks in terms of objects. These are best thought of as collections of files. Take a Word file, .docx - this is actually a zip file that contains a whole bunch of smaller files that build up the document. It does not lend itself to human legibility.

Up until 2016 or so, Microsoft was not very interested in non-Windows machines. Recently, it has shifted its stance with ARM development, .NET, and so on, so that its scripting languages, such as Powershell and its derivatives, can be run on Linux and MacOS.

# Morning Session
1. Open up GCP. Log into the console, and open up the terminal. (See [scripting](/ce02-wiki/Computer-Fundamentals/Scripting) from yesterday to see how to do that.)
1. `rn jq`
1. `ls -lrtA`. Lists all files, including hidden files.
1. Files may be coloured according to their contents (or lack thereof) or executable status. Check out that `chmod` command to turn a file into an executable.
1. BUT THERE'S NO NEED TO DO ANYTHING RIGHT NOW. So sit back and chill. (10:37)

```
#!/bin/bash

set -eu

function git-curr-branch {
   git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null
}

if !(git rev-parse --git-dir > /dev/null 2?&1); then
   echo "Error: Not in a git repo"
   exit 1
else
   (git-curr-branch)
fi
```

1. The script above is called "git-current-branch"
1. `export PATH=$PATH:~`, which appends your user path to the full path.
1. `git current-branch`, which runs the above script.
1. If you're not inside a git repository, it will return the stated error. If not, it will run the defined function, which returns the name of the current git branch.

## The Task (until 1105)
Create a bash script that works with git that will call add any modified files in the repository and commit them with a suitable comment returned to the terminal. Something like "these are the WIP files that have been added".

### Solutions to common queries:
`please tell me who you are` - You have to run those configuration commands if it asks you to. Give it some username, then use the email that's listed in the terminal.

`bad interpreter` - check your first line. It must say `#!/bin/bash` which means "find me an interpreter called 'bash'". If it says anything else your machine will get totally confused.

`permission denied` - go and run `chmod +x <fileName>` again.

`unable to find command` - check which directory you're running from, and which directory your git repository is supposed to be. If your script isn't in your git repository's top-level directory it will fail. If you try and run the script from the wrong directory, it will not find it.

# Q&A
> Are `git current-branch` and `git-current-branch` interchangeable?

`git current-branch` is saying "I want to run a git command, and the name of this command is `current-branch`.
`git-current-branch` is saying "run this command (script), and the name of this command is `git-current-branch`. This is not natively a git command, and the terminal does not associate it with git. What goes on inside the script is a whole separate discussion. The script *itself* is not associated with any program, since it's just a file that is executable whose name is `git-current-branch`.