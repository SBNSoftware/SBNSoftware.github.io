---
layout: page
title: Git & GitHub
---

[https://github.com/](https://github.com/)

SBN Software github repository: [https://github.com/SBNSoftware/](https://github.com/SBNSoftware/)

## Git Overview
Tutorial on github website: [https://docs.github.com/en/get-started/start-your-journey/hello-world](https://docs.github.com/en/get-started/start-your-journey/hello-world)
Fun Github tutorial: [https://www.youtube.com/watch?v=mJ-qvsxPHpY](https://www.youtube.com/watch?v=mJ-qvsxPHpY)

Git is a software tool to track and manage changes to your code. Github is a website to host your code, including the different versions and changes. SBND and ICARUS store their code in the SBN Software Github repository.

### Repository and Branches
A **repository** is a space where code is stored, like a folder. **Remote repositories** are stored online, and multiple people can access them. **Local repositories** are stored on your local computer. Most of the time, you will make changes to a remote repository by first developing and testing those changes in a local copy of the repository. The repository can hold multiple **branches**, which are different working areas that modify a base version of the code. For example, a feature branch is used to create, develop, and test new features for code. There is typically one branch, called "master" or "develop", which represents the current version of the code used in production. People will base their feature branches off the master branch.

Git **commits** are saved versions of your code along the way. Each branch has its own commit history. If something goes wrong, you can revert back to a previous commit and work from there.

## Common Git Functions
In the terminal, if you are in your local git repository,
* `git status`: Tells you which local branch you are working on and which files you have modified or staged for commit.
* `git add <file>`: Stages a file for commit.
* `git commit`: Creates a new Git commit.
* `git log`: Show a log of your commits.
* `git pull <repository> <branch_name>` e.g. `git pull origin master`: Merge the committed changes in the given branch on the remote repository with your local working branch.
* `git push <repository> <branch_name>` e.g. `git push origin master`: Merge the committed changes in the current branch on your local repository with the specified branch on the remote repository.
* `git checkout <branch_name>`: Switch your working local branch to branch_name.
* `git branch <branch_name>` or `git checkout -b <branch_name>`: Create a new branch and switch your local working branch to that new branch.
* `git diff`: Allows you to compare two files - specifically your local changes to the last commit.
* `git stash`: Stash your local (uncommitted) changes before pulling from the remote repo.
* `git stash pop`: Bring back your local changes after pulling from the remote repo.

## Common Workflow

### Clone an Online Repository
To work locally on a Github repository, get the URL from the Github site for the remote repository. In your desired directory, type
`git clone <URL>`.

### Creating a git branch
You'll want to work on your own local feature branch: `git branch feature/your_feature_branch_name`. You can see that you are working on a new branch by typing `git status`.
Once you have created and tested your local changes, you'll want to commit them and push them to the remote repository.

### Adding, Committing changes
* Check `git status` to see the files you have changed (and to verify that you are working on the correct local branch).
* `git add -A` Adds all existing changes. Or you can type `git add <your_file>`.
* `git commit -m "Your documentation message"` Commits changes to your repository.

### Pushing and Pulling
Before you push your changes to the remote repository, it is good practice to pull from the branch you would like to push to in order to resolve potential conflicts with changes that other people have made to that remote branch. Then push your local branch onto the remote repository and then merge it with the desired branch in what is known as a "pull request."

#### Pulling from the Remote Repository
`git pull <repo> <branch>`. For example, if you plan on later merging your changes to the master branch, you would type `git pull origin master`.

#### Push Changes to Remote Repository
Push your new local branch to the upstream repository: `git push -u origin <your_branch>`. The -u is short for --set-upstream
If your local branch already exists on the remote repository, you can just type `git push origin <your_branch>`.
On the Github website for the repository, you should be able to see your branch.

### Pull request
On the Github website, you can create a Pull Request to merge your branch with `master` or whatever other branch you would like to merge with. You can add other people to review this Pull Request before you do it, which is recommended for larger repositories which lots of people use.

## Personal Access Token (PAT)
Sometimes, when pushing code to a shared remote repository, you will be prompted for your Github username and password. For your username, use your Github username. For the password, don't use the password which you use to log into the Github website. Instead, you should use your Personal Access Token (PAT). To get your Github PAT, visit this link: [https://docs.github.com/en/authentication/keeping-your-account-and-data-
secure/managing-your-personal-access-tokens](https://docs.github.com/en/authentication/keeping-your-account-and-data-
secure/managing-your-personal-access-tokens).
