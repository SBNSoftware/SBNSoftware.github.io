---
layout: page
title: Git & GitHub
---

So you want to be a developer for our wonderful suite of software at SBN. Beginners need look no further. This page goes over the basics of Git/GitHub to get started developing your own additions to SBNSoftware GitHub repositories!

### Some Generally Helpful Links
[GitHub Homepage](https://github.com/)  
The [SBN Software GitHub Organization](https://github.com/SBNSoftware/) owns all of the GitHub repositories we use on SBN experiments.  
The [Git Docs](https://git-scm.com/docs) are essential for any developer using Git, especially those who want to leverage Git's full capabilities.

## Common Git Functions
Like all good tools, Git is well-documented. Below, we list a handful of commonly used commands and what they do. But for an extensive look at all the functionality Git has, please see the [Git Docs](https://git-scm.com/docs).  

In the terminal, if you are in your local git repository, you can execute the following commands:

* `git status`: Tells you which local branch you are working on and which files you have modified or staged for a commit.
* `git add <file>`: Stages a file for commit.
* `git commit`: Creates a new Git commit. This is often paired with the `-m "Description of commit."` flag for good record-keeping purposes. 
* `git log`: Shows the history of commits made to the current branch. These commits are identified by their commit hashes.
* `git show <commit_hash>`: Shows more details about a given commit.
* `git pull <repository> <branch>` (e.g. `git pull origin master`): Grabs (i.e. "fetches") the specified <branch> from the given <repository> and merges the changes with your local working branch.
* `git push <repository> <branch>` (e.g. `git push origin master`): Merge the committed changes from your current local branch into the specified <branch> on the given <repository>.
* `git checkout <branch>`: Switch your working local area to <branch>.
* `git diff <file1 OR branch1 OR commit1> <file2 OR branch2 OR commit2>`: Allows you to compare two files, branches, commits, etc. (the world is your oyster here!).
* `git stash`: Temporarily save any uncommitted local changes. This is often done after doing work on a local branch and needing to pull down any conflicting changes from a remote branch.
* `git stash pop`: Bring back your local changes after pulling previously conflicting changes from the remote branch.

There are SO MANY more git commands, and the Git ecosystem is always overflowing with new ideas. Don't be discouraged when you first start learning Git/GitHub. The learning curve is steep, but the payoffs are incredible.  

## Git Overview

If you are unfamiliar with Git/GitHub, you can follow [this tutorial on the GitHub website](https://docs.github.com/en/get-started/start-your-journey/hello-world)!
You can also follow [this more fun GitHub tutorial on YouTube](https://www.youtube.com/watch?v=mJ-qvsxPHpY).

Git is a tool that tracks changes to your code and allows you to effectively manage a software package. GitHub is a website that uses Git to host your code, including the different versions and branches of your software package. SBND and ICARUS store their code in the SBN Software GitHub parent organization. Having your GitHub username added to the SBNSoftware organization enables you to develop your own code and have people to tag you in issues and code reviews.

; the [instructions to be added are here](../AnalysisInfrastructure/github-migration-to-do-list.md).

A **repository**–typically just called a repo–is a space where code is stored, much like a folder. **Remote repositories** are stored online, and multiple people can access them. Conversely, **local repositories** are stored on your local computer. Most of the time, you will make changes to a remote repository by first developing and testing those changes in a local copy of the repository. Then you will "commit" and "push" these changes to the remote repository (more on this later!).  

A repository can hold multiple **branches**, which are different working areas that modify a base version of the code. For example, a feature branch is used to create, develop, and test new features for our codebase. Within SBNSoftware, we tend to follow the syntax `feature/<username>_myFeature` when naming such branches. For every (SBNSoftware) repository, there is a "primary" branch that is often called `develop`. This is the branch that developers like you will develop your code against. However, the `develop` branch is not to be confused with the `main` branch, which acts as a history for all of the major versions of a specific SBNSoftware codebase. Developers will often base their feature branches on `develop` by first creating a copy of `develop` and naming the copy according to the work they are doing (e.g. `feature/<username>_myFeature`).

A **commit** is a saved version of your code. It is useful–both to your future self and your fellow collaborators–to make commits often and to give each commit a useful and succinct description. Each branch in a repository has its own commit history. So be mindful of the branch on which you are developing code! If something goes wrong, you can always reset to a previous commit with `git reset`. You can do this by referencing the commit hash you want to which you want to reset (often obtained from the output of `git log`) or you can roll back N many commits from where your branch currently sits by doing `git reset HEAD~<N>`.


## Common Workflow for Git/GitHub within SBNSoftware

### Clone an Online Repository
To work locally on a GitHub repository, first obtain the URL from the applicable GitHub repository's site. You can then clone the remote repository into your desired directory by typing
`git clone <URL>`. This copies the remote repository onto your machine and allows you to develop code locally!

### Creating a Git Branch
You'll want to work on your own local feature branch as detailed above. You can create such a branch by doing `git branch feature/<username>_myFeature`. You can see that you are working on this new branch (or you can verify the branch you are currently on) by typing `git status`. Once you have created and tested your local changes, don't forget to commit them and push them to the remote repository.

### Adding and Committing Changes
First, check `git status` to see the files you have changed (and to verify that you are working on the correct local branch).  

Next, stage your changes with `git add -A` or `git add <path/to/your/file>`. What's the difference between these two commands? Look no further than the [git-add documentation page](https://git-scm.com/docs/git-add)! 

----------

<details>
<summary>SPOILER: What does the <code>-A</code> option do?</summary>  


The -A flag stages **all** changes made relative to the last commit for the branch that's currently checked out. This is quite useful if you don't want to add each file by doing <code>git add <path/to/your/file></code> for each file. But sometimes you may want more fine-grained control to break up your contributions into distinct commits, each with their own useful description.

</details>

----------

Finally, commit your changes to your local copy of the repository with `git commit -m "Description of commit."`.

### ~~Pushing and Pulling~~ Pulling *and then* Pushing
Before you **push** (e.g. `git push origin feature/<username>_myFeature`) your changes to the remote copy of your local branch, it is good practice to **pull** (e.g. `git pull origin feature/<username>_myFeature`) from the remote branch to which you would like to push. This is done to resolve any potential conflicts with changes that other collaborators/developers may have made to the given remote branch. While this is likely not necessary when you are developing solo on your own feature branch, it is imperative when you work together with collaborators on the same feature branch. After you have pulled down changes from your remote branch, push your local branch to the remote repository. Then, you will want to merge your feature branch with the desired target branch in what is known as a "pull request." 

### Drafting a Pull Request (PR)
A Pull Request or "PR" is how developers merge their changes from their branch into one of the main branches of the repository. This is most easily done via the GitHub webpage for the applicable repository (see the screenshot below). After filling out the relevant information for your PR, it is recommended that you assign other collaborators to review the changes you're proposing to make. These reviewers should be people from the applicable working group who know the scope of the changes you're seeking to make. If you have doubts on who to assign as a reviewer, you can always reach out to the software package's release manager.


## Personal Access Token (PAT)
Sometimes, when pushing code to a shared remote repository, you will be prompted for your GitHub username and password. For your username, use your GitHub username. For the password, don't use the password which you use to log into the Github website–this will not work. Instead, you will have to create/use a Personal Access Token (PAT). To get your GitHub PAT, visit [this link](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens) and ensure you select the minimum level of access needed to make your requested changes to the given repository.
