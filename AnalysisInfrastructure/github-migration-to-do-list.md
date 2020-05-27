# Github Migration To Do List

Please follow these instructions to make the migration of code repositories to Github go smoothly:


#### 1. Get added to the SBNSoftware organization.
  - Fill out [this form](https://docs.google.com/forms/d/e/1FAIpQLSf_jrYDbaC3_WoLDzBappZkEpPpyD7tSt7UWF59TUyUEAjaSA/viewform?usp=sf_link)
  - If any issues, please email Wes or Joseph. [Wes Ketchum and Joseph Zennamo](mailto:wketchum@fnal.gov,jaz8600@fnal.gov).


#### 2. Make sure your latest code gets migrated

 - Commit and push any changes in code you are working on before EOB May 15.

All active branches will be migrated, but any un-committed code will not be carried over in the migration.

*The migration will take place between EOB on Friday May 15 to the morning of Monday May 18. During this period any development should just be kept locally, but we recommend holding further development until the migration is completed.*

You will see the repository complete with your branches and latest commits appear on the Github page by the morning of May 18. If you do not see your branch or you have any issues, please contact [Fernanda Psihas](mailto:psihas@fnal.gov)



#### 3. Get working and pushing to Github

After the migration (the morning of May 18) go to your local working directories. If you want to continue using them, you will need to replace your local repositories.

```rm -r src/<sbncode, sbndcode, icaruscode>```

In order to get the correct repos, mrb will need the Github address.

```mrb g https://github.com/SBNSoftware/<sbncode, sbndcode, icaruscode>```

#### 4. Clean working area from previous installs and buils

At this moment the best to get going again is to completely remove your localProducts and build directory, and create them from scratch.

```
rm -rf build_*/  
rm -rf localProducts_*/
mrb newDev -v vXX_XX_XX -q QQ:QQ # replace with the needed version and quals, along with any other relevant options
```

#### 5. Verify credentials and configs

Before you commit and push to the github repository please verify your credentials. The following command should display the email address on your Github account.

```git config --global user.email ```


For more information about Github accounts and email can be found [here](https://help.github.com/en/github/setting-up-and-managing-your-github-user-account/setting-your-commit-email-address)


#### Troubleshooting

One user reported issues when running `mrbsetenv`:

```
ERROR:
ERROR: exceeded loop limit (200) attempting to resolve qualifiers for packages.
ERROR: Unresolved packages:
ERROR:
```

*Solution* 
- under `srcs` folder remove the dot files: `.mrb*` 
- verify that CMakeLists.txt doesn't contain duplicated entries and that it only lists the repositories that you've cloned.
