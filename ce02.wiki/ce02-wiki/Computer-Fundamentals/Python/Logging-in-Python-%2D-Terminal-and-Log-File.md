[[_TOC_]]

# Your Daily Dose of Logging: or, How I Learned to Save Logs to a File That I'll Probably Almost Never Look at Anyway

- If, like me, you're confused about logging being extremely important and ubiquitous but simultaneously almost nowhere to be seen and unprovable (at least locally) - this should hopefully clear things up a little. 
- I'm very much hoping that this is just a case of copy pasting this into the start of every little Python project and it handles the rest. 
- No promises on whether this works when you deploy something to Azure etc, because while it does still use the `logging` package, it does it in a slightly different way from what I can see. Maybe a **TODO** could be to change one of the other Python apps we have deployed and see if it breaks Azure logging? I'll leave that as an exercise for the reader.
- The code that's highlighted is the stuff that you can change to however you see fit.

## Initial Setup and the Weird Stuff

### Import the Logging Package

```
import logging
```

As always, you need to import the logging package, which I'm sure you all know how to do, but I'll save you 3 seconds of typing and replace it with 7 seconds of copy pasting.

### Use a Specific Logger and Setup What the Messages Look Like

```
logger = logging.getLogger('euanslogger') # Change the name if you like - explanation on wiki
formatter = logging.Formatter(
    "[%(asctime)s][%(levelname)s] %(message)s", "%Y-%m-%d %H:%M:%S"
) # Change this format too if you like - explanation on wiki
```

**First, everything in this section goes just after you import it (at the top of your code), it's important that it comes before any requests for a logging message in your code, as it defines what happens to them.**

This section sets up the format that the logging message takes, both in the terminal ("printed" along with the FastAPI stuff) and what is written to the .log file (that we'll setup later in this wiki). It's quite easy to find documentation about how to change this format to suit whatever you like. For what it's worth I'm not entirely 100% sure what the `logger = logging.getLogger('euanlogger')` line even does. From the logging documentation it seems that if you have multiple different loggers it searches for the one with the name you specify in this line, but obviously we only have one logger for now, so it doesn't matter. You can even set the name argument to `None` if you like - it looks like it defaults to something safe if you don't specify it.

### Deciding What Messages I See - Terminal

```
stream_handler = logging.StreamHandler()
stream_handler.setFormatter(formatter)
stream_handler.setLevel(logging.DEBUG) # You can change DEBUG to another message level
logger.addHandler(stream_handler)
```

This is where it gets a little complicated, but it's relatively easy to understand what's going on. From what I understand, the two little blocks (above and coming up in the next section) can be thought of like filters. They're deciding what should be allowed through to a display of the log - either in the terminal or in the .log file itself. So the idea is that when your code calls a log message, each of the filters checks if it is at least at a certain level of "importance". The hierarchy of logging messages that we use - again, as far as I can tell, is:

```
Message level hierarchy: DEBUG < INFO < WARN < ERROR
```

Whatever you set in the `.setLevel` line is the "minimum importance" that it will allow to be displayed or written. So in the 4-line block above, the terminal filter is being set up to essentially allow all logging messages to appear in the terminal, because `DEBUG` is at the bottom of the hierarchy. There are levels of logging below `DEBUG` and above `ERROR`, but we don't use them right now. You may need to test this out though, this was just the best answer I could find and it seems to be true so far from my limited testing.

### Deciding What Messages I See - Log File

Now, we **can** actually send some (or all) of these log messages to a file for permanent safekeeping, so they won't just magically disappear and you never have to worry about them again. Here's how.

```
file_handler = logging.FileHandler('tomato_edgar.log') # Change the file name to whatever you want it to be
file_handler.setFormatter(formatter)
file_handler.setLevel(logging.ERROR) # You can change ERROR to something lower to get more messages in your log file
logger.addHandler(file_handler)

# Not too sure what this does, think it sets the min filter for the logger generally? Probably don't touch.
logger.setLevel(logging.DEBUG) 
```

This block of code is defining what is allowed to be written to the log file itself - the "more" permanent copy of what happened, or more likely what went wrong, with your API. The first thing you can do is change the name of the log itself - currently called `tomato_edgar.log`. For what its worth, if you just run this clean it will create a file with that name in the location of your API's `main.py` - at least that's what it did for me. And from the hierarchy above you can see that the only logging messages that will be saved to the file with this code are `ERROR` messages - the line `file_handler.setLevel(logging.ERROR)` - as there is nothing above `ERROR` in the hierarchy that we use. Also bare in mind that you can add a full file path in front of the .log file itself i.e. it could take the form `logging.FileHandler('ce02\git_repos\week10_edgar\tomato_edgar.log')` or `..\..\tomato_edgar.log`.


## Actually Using All of This In Code

So, there's a very small change to how we actually write a line when we want to log something during our code run. Here's a little example.

```
if ticker not in valid_tickers:
    logger.error("Requested ticker is outwith SP100")
```

Literally the only difference is that where we had `logging.error` this has `logger.error`. If you missed that because it's such a small and surely insignificant change (right?) --- ~~logg<span style="color:red">ING</span>~~ to logg<span style="color:red">ER</span>.

Thank you for coming to my Ted Talk.