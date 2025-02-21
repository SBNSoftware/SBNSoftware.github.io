These pages are all written in **markdown.**

I believe you have to be an author/member of SBNSoftware in order to be able to edit the site. You can ask one of the site owners for permission.

You should also have a Github username and Personal Access Token (PAT). You can create a PAT here:
https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens

## Directly
Direct edits work best when editing a single page
1. Go here:
	1. https://sbnsoftware.github.io/
2. Go to the page you want to edit
3. Click on "improve this page" at the top
4. This will take you to the github repository where you can directly edit and commit to the master branch.

## On own working branch
Creating a working branch works best when editing or creating multiple pages.

1. Go to the github repository for our website:
	1. https://github.com/SBNSoftware/SBNSoftware.github.io
2. Copy the url to clone the repo
3. On your own local computer or a Fermilab computer, clone the repository:
	1. `git clone <url>`
4. Create your own local working branch: `git checkout -b <your_branch>`
5. Make your local changes. Unfortunately, there does not seem to be an easy way to test these local changes on a development version of the website. If anyone wants to dig into the Jekyll framework and add instructions, that would be great.
6. Push your new local branch to the upstream repository: `git push -u origin <your_branch>`
	1. The `-u` is short for `--set-upstream`
7. You may have to enter your Github username and PAT when it prompts you.
8. On the repo https://github.com/SBNSoftware/SBNSoftware.github.io, PR your branch with the master branch
9. In about 5 minutes, you should see your edits live on the site.



