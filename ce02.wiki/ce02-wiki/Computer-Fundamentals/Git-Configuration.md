# Git Configuration 
[[_TOC_]]

## Set-up

```
git config --global init.defaultBranch main
git config --global user.name "FIRST_NAME LAST_NAME"
git config --global user.email "MY_NAME@kubrickgroup.com"
```

## Day to Day usage


1.  As me … I want a copy of <repo/branch> in my current working directory

    > Command

     ```git clone```

    > Example

    ```git clone https://kubrick-training@dev.azure.com/kubrick-training/de24/_git/hugo_nem01 -b README```


1. I want to send my updated local repo in my current working folder to <repo/branch>

    > Command

     ```git push```

    > Example

     ``` git push```

1. I want to update my local repo in my current working folder with the latest from <repo/branch>
    > Command

     ```git pull```

    > Example

     ```git pull```

1.  I want to merge my local repo in my current working folder with the latest from <repo/branch>
    > Command

    ```git merge```

    >  Example

    ```git merge origin/main```



## Day to Day Pattern

::: mermaid
sequenceDiagram
    participant LocalDirectory
    LocalDirectory->>Developer: Local Copy of Code
    loop DayToDay
        Developer->>Developer: Make code changes
        Developer->>Developer: Add files to repo
        Note right of Developer: run `git add`
        Developer->>Developer: Commit files to repo
        Note right of Developer: run `git commit`
    end
:::


## Working with an existing remote repo



::: mermaid
sequenceDiagram
    participant RemoteRepo
    participant LocalDirectory
    Developer->>RemoteRepo: Get copy of code
    Note right of Developer: run `git clone`
    RemoteRepo-->>LocalDirectory: clone whole git repository locally
    loop DayToDay
        Developer->>Developer: Make code changes
    end
    Developer->>RemoteRepo: Get any remote changes
    Developer->>Developer: run `git pull`
    RemoteRepo-->>LocalDirectory: update local directory
    Note right of Developer: May need to merge changes too!
    Developer->>RemoteRepo: Send my changes 
    Developer->>Developer: run `git push`
    LocalDirectory-->>RemoteRepo: Update remote repository

:::
--- 

## Git Submodules

To `expand` the submodules from a repo run the following command:

```
git submodule update --init
```
### Git Cheatsheet

Switch to a new remote repo to push your local code to a new remote location
```
git remote set-url origin <url>
```