# Getting Started with Python
1. Open up Anaconda Powershell prompt.
1. Create a folder for your Python things.
`cd C:/ce02`
`mkdir python`
`mkdir course_notes`
`cd python/course_notes`
1. Open up a Jupyter notebook by running `jupyter notebook`. Open it up in a browser.
If you get the error that "Jupyter was not recognised as a command" or whatever, try running it again using the "Anaconda Powershell Prompt" (search for it in your Windows search bar).
   - This command starts a Jupyter server which you open in your browser.
   - Clicking "save" on your work saves all the open content. Jupyter tells you if a notebook if open or not.
   - Quit in the top right corner to close it properly and ensure you don't lose anything.
1. In the browser, go to the top right and create a new Python notebook (Python 3).
1. Jupyter notebooks have two modes: the Command mode (blue bar on the side of the terminal/blue border) and Edit mode (green border).
Jupyter will accept markdown or Python code.
Each "line" is called a cell. **The type of cell is identified by the absence or presence of the** `In [ ]:` **to the left of that cell**. The cell type can be changed by clicking "escape" so that you are no longer editing the contents of the cell and then clicking "m" to go into markdown, or "y" to return to Python code. Or you can just use the handy drop-down.
   - In fact, just about everything and its associated shortcut are present in the different drop-down menus, so check out those clicky menus if in doubt.
   - Jupyter will remember all variables stored in a notebook so long as the assignment takes place **before** it is needed later on. Remember that `In [ ]:`? It will populate the square brackets with the position in the queue that it was run.
1. Python will automatically evaluate arithmetic expressions.
1. "=" is also called the "assignment operator". It takes whatever is on the right of it (strings and values and whatever) and assigns it to the variable on the left.
   - Variables may only contain alphanumeric characters and underscores in their names and their names may not begin with a numeric character.
   - Be careful of putting an underscore as the first character of a variable name. It is valid but has additional functionality.
   - Your variables cannot be named after Python keywords.
   - Variables are typically named in lower case.
   - Variable names should be descriptive but concise. Long, unwieldy names are uncool. Meaningless variable names are also pretty uncool.
   - If you get `syntax error` it means your name is **wrong** and Python is **not having it**.
1. Use the `whos` function to list all variables created so far and the values assigned to them.
   - Traceback error when running it? Slap a "%" in front of it and try again. (This is a Jupyter-notebook-only fix.)
1. Lines that begin with "#" are comments and will not run.
   - This is where "commenting out code" for troubleshooting comes from - just comment that sucker out and it won't run.

### Today's Topics
![image.png](/.attachments/image-fa21bb94-7187-46f7-bc54-2a0b93867a65.png)
