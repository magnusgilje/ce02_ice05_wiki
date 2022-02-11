# Azure Pipelines

Azure Pipelines automatically builds and tests code projects to make them available to others.

Implementing CI and CD pipelines help to ensure consistent and quality code that's readily available to users. And, Azure Pipelines provides a quick, easy, and safe way to automate building your projects and making them available to users.

[What is Azure Pipelines](https://docs.microsoft.com/en-us/azure/devops/pipelines/get-started/what-is-azure-pipelines?view=azure-devops#why-should-i-use-azure-pipelines)

Azure Pipelines essentially creates an automated workflow that a piece of work will move through, ensuring consistency in the delivery of workpieces.

[Classic release and artifacts variables](https://docs.microsoft.com/en-us/azure/devops/pipelines/release/variables?view=azure-devops&tabs=batch)

**Please note! If your pipeline does not work, always try testing it on your local host to see if it works there. This is quicker than using the website and can help you check if the problem is in your base code, rather than in the pipeline itself.**

So why pipelines? I'm running tests on my local machine already - why am I testing it again through a pipeline? A pipeline provides a uniform environment that decouples every local machine from the development pathway. It allows any developer, from any device, to make contributions in a standardised way. It also means other collaborators can be assured of the quality of the code being merged, to some extent, and that the code is passing through some standard route. However, this doesn't negate the importance of the local tests. Local tests are part of every developer's due diligence. You should test your own files before sending them up to the cloud because if they don't work on your local machine, odds are they won't work on any other machine.

[[_TOC_]]

# [Creating a new pipeline](/ce02-wiki/Using-Pipelines/Pipelines/Creating-a-New-Pipeline)
# [Creating a deployment Pipeline](/ce02-wiki/Using-Pipelines/Pipelines/Creating-a-Deployment-Pipeline)
# [Deploying Pipelines from Azure to AWS](/ce02-wiki/Using-Pipelines/Pipelines/Deploying-a-Pipeline-from-Azure-to-AWS)
# [Deploying Pipelines from Azure to GCP](/ce02-wiki/Using-Pipelines/Pipelines/Deploying-a-Pipeline-from-Azure-to-GCloud)
# [Variables and Repeatability](/ce02-wiki/Using-Pipelines/Pipelines/Variables-and-Repeatability)
# [Adding tags](/ce02-wiki/Using-Pipelines/Pipelines/Adding-tags)
# [Pipelines, Repos, and Pull Requests](/ce02-wiki/Using-Pipelines/Pipelines/Pipelines,-Repos,-and-Pull-Requests)