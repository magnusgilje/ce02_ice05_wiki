# Put Your Questions Here

This is the FAQ section.

Ask your questions in the comments.

Follow the page to get updates.

If you know the answer, reply with the answer so that others can find it.

If you think that a group of questions is being asked frequently, consider making a Wiki page to address them all under one topic.

Apes together strong.

# Questions, Tips, Tricks, and Hacks (only ethical ones please)

## How do I find and replace loads of instances of the same text in VSCode?

I have a variable that I want to rename, but there are literally millions of mentions of it in my file. How do I change all of them before I retire?

In VS Code, go into your editor (i.e., click inside the file). For Windows users use shortcut "ctrl + h". For Mac users it's "cmd + h". A little find and replace box will appear in the corner and it will allow you search exact strings, embedded strings, case sensitive strings, use wildcards, and all sorts of cool ways to find and replace code snippets in your work.

## Scripts\deactivate does exactly nothing?

I've activated my scripts but, quite frankly, I don't like green anymore. I'm going in there and I'm running `.\Scripts\deactivate`, I'm letting it autocomplete to `.\Scripts\deactivate.bat`, I've tried both of them, but in different directories, I've tried all of the above after praying to just about every holy and unholy creature under the sun (and moon, and stars). And yet the green persists. Do I burn my laptop?

If you are in a PowerShell Terminal, simply type `deactivate`. Job done.

`scripts\deactivate` works if you are in command prompt.

That wasn't so hard, was it?

> Answer courtesy of Abhishek.

# My CI Pipeline is asking for variables and I can't input them.

I'm running a pipeline with Terraform, and about halfway through it'll ask for inputs, which is totally ending my existence because I can't give it any variables. How do I make sure the pipeline isn't asking me for things?

`-input=false`

This parameter prevents the CI pipeline from asking the user for inputs (which it of course is unable to receive). Be careful out there, cloud developer.