---
layout: page
title: Git & GitHub
---

# Intro to Python on the GPVMs

The easiest way to reliably use python on the gpvms is to create a virtual environment. A virtual environment allows you to install packages and dependencies without affecting other users on the gpvms. You can set up and delete a virtual environment easily.

## Setting up a virtual environment

After calling the relevant setup script for your experiment from cvfms, list the available python versions with:

```bash
ups list -aK+ python
```

You should see something like:

```
...
"python" "v3_8_3b" "Linux64bit+3.10-2.17" "" "" 
"python" "v3_9_2" "Linux64bit+3.10-2.17" "" "" 
"python" "v3_9_9" "Linux64bit+3.10-2.17" "" "" 
"python" "v3_9_13" "Linux64bit+3.10-2.17" "" "" 
"python" "v3_9_15" "Linux64bit+3.10-2.17" "" "" 
...
```

This is similar to setting up any ups products. Choose your desired version of python and set it up with:

```bash
setup python v3_9_15
```

To check if you have correctly setup your desired version, you can use the command: `which python` or `python --version`.

To create, activate, install packages in, and deactivate the virtual environment:

```bash
python -m venv <path/to/venv> # creates a virtual env named "venv"
source <path/to/venv>/bin/activate # activates the virtual env
# now you are in the virtual env
pip install <package> # installs a package inside the virtual env
deactivate # deactivates the virtual environment
```

Now you can create virtual environments for whichever projects you want! You can have multiple virtual environments with different versions of python and different packages installed.
