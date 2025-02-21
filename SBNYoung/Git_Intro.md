---
layout: page
title: Git & GitHub
---

[https://github.com/](https://github.com/)

SBN Software github repository: [https://github.com/SBNSoftware/](https://github.com/SBNSoftware/)

## Git Overview
Tutorial on github website: [https://docs.github.com/en/get-started/start-your-journey/hello-world](https://docs.github.com/en/get-started/start-your-journey/hello-world)
Fun Github tutorial: [https://www.youtube.com/watch?v=mJ-qvsxPHpY](https://www.youtube.com/watch?v=mJ-qvsxPHpY)

Git is a version control tool useful for many different applications, primarily used for software projects. SBND and ICARUS store their code in the SBN Software github repository.

### Repository and Branches
A **repository** is a space where a code base is stored. The repository can hold multiple **branches**, which are different working areas which are modifications to a code base. For example, a feature branch is used to create, develop, and test new features for code. Therehttps://www.youtube.com/watch?v=mJ-qvsxPHpY  is typically one branch, called "master" or "develop", which represents the current version of the code used in production. People will base their feature branches off the master branch.

Git **commits** are saved versions of your code along the way. Each branch has its own commit history. If something goes wrong, you can revert back to a previous commit and work from there.

## Common Git Functions
In the terminal, if you are in your local git repository,
* `git status`: Tells you which local branch you are working on and which files you have modified or staged for commit.
* `git add <file>`: Stages a file for commit.
* `git commit`: Creates a new Git commit.
* 'git pull <repository> <branch_name>` e.g. `git pull origin master`: Merge the committed changes in the given branch on the remote repository with your local working branch.
* 'git push <repository> <branch_name>` e.g. `git push origin master`: Merge the committed changes in the current branch on your local repository with the specified branch on the remote repository.
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
You'll want to work on your own local feature branch: `git branch feature/your_feature_branch_name`.
Once you have created and tested your local changes, you'll want to commit them and push them to the remote repository.

### Adding, Committing changes
`git add -A` Adds all existing changes. Or you can type `git add <your_file>`.
`git commit -m "Your documentation message"` Commits changes to your repository.

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
