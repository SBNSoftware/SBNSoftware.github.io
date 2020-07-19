---
lang: en
title: SBN DAQ Development
hero_height: is-small
---

We, like LArSoft, generally follow a _gitflow_-like development model[^gitflow] for working on changes in the DAQ software. The nature of our developments, however is that we are typically trying to work with the latest and greatest code all the time, so you want to make sure that generally your code works well off of the latest software.

That means:
* The default branch for most work is `develop`. The `develop` branch is for code that should be part of the next tagged/versioned release, and won't break things for other people. Usually, you should base your code off of this branch, and try to stay up to date with it.

* The `master` branch is kept at the latest tag/version: if you need something you know is very stable for development, base code of off this branch.

* All tags/versions get tags in the git repositories as well. Do `git tag --list` to see all tags.

* You should almost always do new development work from a _feature_ branch. We typically name such branches `feature/<username>_<description>`. For example: `feature/wketchum_TPCInhibits`. To create a branch based on develop do:
```bash
git checkout -b feature/<username>_<description> develop
```
You should not be afraid to push feature branches to the remote repository so that they are saved, and so others can work from them.
```bash
git push origin feature/<username>_<description>
```

* When you are ready to merge in changes, you should first make sure that it is up-to-date with the `develop` branch by mergining in or rebasing against develop:
```bash
git pull origin develop
```
Then, you should let people know you have a branch ready to merge. This can be done by [issuing a pull request on the github repository](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request) and sending an email to Wes, Gennadiy, and/or Bill, or reporting it in an SBN DAQ meeting. In rare cases should you directly merge to develop yourself (e.g. if you are working on configurations in `sbndaq`, those can probably be directly merged into develop).

[^gitflow]: See [here](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) and [here](https://nvie.com/posts/a-successful-git-branching-model/).
