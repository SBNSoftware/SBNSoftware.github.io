---
layout: page
title: Git & GitHub
---

# Introduction to Code Development

Just getting started with setting up your code workspace? Here are a few common  and IDEs used by SBN members.
editors
- [Introduction to Code Development](#introduction-to-code-development)
  - [Code Editors](#code-editors)
    - [emacs](#emacs)
    - [vim](#vim)
    - [Visual Studio Code](#visual-studio-code)
      - [Super Helpful VSCode extensions](#super-helpful-vscode-extensions)
  - [Terminals](#terminals)
    - [tmux](#tmux)

## Code Editors

### emacs

### vim

### Visual Studio Code

[Visual Studio Code](https://code.visualstudio.com/), also commonly referred to as VS Code, is a source-code editor with features and support for debugging, syntax highlighting, intelligent code completion, embedded Git, and more. Extensions for VSCode are open source, so there are a ton of useful features and it's super personalizable. You can also port keymaps from emacs or vim if you're looking to make the transition! For new coders, VSCode is relatively easy to pick up. It also has lots of [themes](https://vscodethemes.com/) and icons, so you can make your workspace look very nice.

Particularly useful features for SBN-ers:

- **SSH remote editing!** Easily SSH into the gpvms and edit any kind of file remotely: LArsoft modules, ROOT macros, Python scripts, Jupyter notebooks, etc.
- **Syntax highlighting for everything!** There are extensions for syntax highlighting C++, Python, Markdown, LaTeX, FHiCL, json, yaml, etc. You can also customize the syntax highlighting for any file type.
- **Git integration!!** Commit, push, pull, branch, merge, etc. all from within VS Code. It's important to learn how to use Git from the command line, but there are lots of features and extensions to help build your intuition and make your life easier.
- **Port Forwarding!!** If you're working on a remote machine, you can easily forward ports to your local machine to view plots, Jupyter notebooks, etc.

#### Super Helpful VSCode extensions

- [ROOT File Viewer](https://marketplace.visualstudio.com/items?itemName=albertopdrf.root-file-viewer): open ROOT TTrees without ROOT!!! You can also view and save histograms/plots as images, format plots on-the-fly, and more. Be careful to not open _artROOT_ files with this extension though, as it will try to open the file as a TTree and will crash.
- [FHiCL support](https://marketplace.visualstudio.com/items?itemName=robertosoleti.fcl): Syntax highlighting for .fcl files!
- [Github Copilot](https://marketplace.visualstudio.com/items?itemName=GitHub.copilot): AI pair programming assistant. As a student (or someone with an .edu or fnal.gov email), you get a free CoPilot subscription!! Big time saver if you are writing any repetitive code (such as plotting), need simple code suggestions, or are **writing documentation**. There is also an integrated Copilot chat; you can ask Copilot coding questions or ask it to perform simple tasks. FYI: you should **always** double check what Copilot suggests, do not rely on it to completely write your code for you.
- [GitLens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens): Git supercharged! Toggle git blame, view git history, view git diffs, and more. Easily view who committed what when, and what changes were made.
- [Jupyter](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter): Jupyter notebook support! See the Python page for more details on how to use Python and Jupyer on the gpvms.
- [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack): This extension pack includes three extensions: Remote - SSH, Remote - Containers, and Remote - WSL. These extensions enable you to open any folder in a container, on a remote machine, or in the Windows Subsystem for Linux (WSL) and take advantage of VS Code's full feature set.

## Terminals

### tmux

tmux is an open-source terminal multiplexer, which allows you to run multiple terminal sessions within a single window. It's super useful for running multiple processes at once, and you can easily detach and reattach to sessions. You can also split windows and panes, and customize your tmux environment.

If you ever have to run a command that takes longer than a couple minutes, you can run it in a tmux session, detach, and reattach later to check on the process. 
tmux is natively installed on the gpvms, and you can also install it on your local machine.
