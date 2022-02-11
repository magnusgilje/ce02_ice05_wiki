These steps link up your pipelines with your repositories.

# Steps
## Build Validation
1. Go to `Project Settings` (bottom left corner, nice gear icon).
1. Go to `Repositories` (down the list).
1. Select your repository and go to `Policies` (along the top).
1. At the bottom, go to `Branch policies` and click on `Main`.
1. Then scroll down to get to `Build Validation`.
1. Click the great big "+" icon.
1. In `Build Pipeline`, choose your build pipeline. Leave everything else as default for now.
1. Below that, there is an `Automatically included reviewers` section. This may include some reviewers that the repository may inherit from higher up in the project. Leave that. It makes it easier to organise things for it to inherit reviewers than to set them every time.

What these steps have done is link the main branch of the repository to a pipeline validation and approval process.
Before continuing, make sure that your `README.md` file has been updated with the correct build status badge (from the CI pipeline). Get the badge to link to the main branch rather than your working branch to save a kerfuffle later.

## Pull Requests and Merging Branches

A **pull request** initiated from the server is a request to have all the updates from the local branch merged with the main branch so that the two branches are brought back together.

9. Now that the main branch and pipeline have been entangled with each other, it's time to merge the other branches. Go to `Repos` and `Pull requests`.
1. Create a new pull request. It can help to include all of the commit messages for all the commits made prior to the pull request being made.
1. Click "Create pull request", leaving everything else as its default state.
1. It will fail to complete if you couldn't add a work item to it. No worries! Just find one from your backlog and call it good.
1. Set auto-complete so that the wheels all turn once approval is complete. Leave it with its default settings.
1. To approve a pull request, go to the `Pull Request Dashboard` and look for the pull request that you would like to approve.
1. Go ahead and approve it. Or don't. But make sure you leave feedback if you don't.

## Final Notes

16. HOPEFULLY you've set up your pipelines and all that good stuff to work off the main branch because that's where the releases will be. If not, you'll need to go back to your pipelines and edit them to work off main, instead of the branch.

# Troubleshooting