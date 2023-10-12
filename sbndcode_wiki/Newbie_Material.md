---
layout: page
title: Newbie Material
subtitle: Got To Start Somewhere
image: sbndcode_wiki/sbnd_logo.png
description: Place to start when you're new
toc: true
---




Newbie Material
==================================================

All of SBND\'s material can be found on the
[docDB](http://sbn-docdb.fnal.gov:8080/cgi-bin/DocumentDatabase).
It requires a password to access everything, just ask for it!

To be part of the SBND-software mailing list send an email to:
<listserv@fnal.gov> with the following information: SUBSCRIBE
SBND-SOFTWARE YOUR NAME. Here is a list of all the mailing lists
available: <https://listserv.fnal.gov/scripts/wa.exe?INDEX>. For more
information see: <http://listserv.fnal.gov/users.asp#subscribe>



Computing Access
----------------------------------------------------

See the [Computing resources](Computing_resources.html) page
to see a discussion about the computing privileges that SBND has.

To get a Fermilab computing account follow the instructions at [this
site.](https://fermi.servicenowservices.com/kb_view.do?sysparm_article=KB0010797)
More info are available at [this page](https://get-connected.fnal.gov/accessandbadging/access/).\
When required, as experiment choose "*SBND: SHORT-BASELINE NEAR DETECTOR*".

**Write down the initial Kerberos and Services Account password before
submitting**. This will be necessary once your accounts have been
created.

You will receive an email once this is complete which gives you your
Fermilab email account and username (you will need this for service
now).

In case you already have Fermilab Computing privileges with other experiments
and need to get SBND Computing privileges request SBND affiliation.\
On [ServiceNow](https://fermi.servicenowservices.com/wp/) search for
"**Update my Affiliation/Experiment/Collaboration membership Request**",\
file in the form, verify that your name and kerberos principal are correct,
In the *Additional Affiliations* section click on the `Add` button
and fill the text box with: "*SBND: SHORT-BASELINE NEAR DETECTOR*",
then click Submit.\
An SBND representative will review the request and eventually approve it.

Once you get SBND Computing privileges make your computer is ready to ssh to SBND nodes.\
Check that have the right ssh configuration, add the following
to your machine\'s `~/.ssh/config`.\
Create the file if it\'s not there. In some systems you might need to
reload the ssh agent. You also want to have this file in the gpvm
machine.

```shell
Host *.fnal.gov
  ForwardAgent yes
  ForwardX11 yes
  ForwardX11Trusted yes
  GSSAPIAuthentication yes
  GSSAPIDelegateCredentials yes
```

For MacOS users, in case they get the following message
```
Warning: No xauth data; using fake authentication data for X11 forwarding.
```
when logging in to SBND GPVM nodes, they need to add to the above also the line
```shell
  XAuthLocation /opt/X11/bin/xauth
```

Now you should be able to log on by typing:

```shell
kinit -f [yourusername]@FNAL.GOV
ssh -Y [yourusername]@sbndgpvm01.fnal.gov
```

MacOS users can\'t use kerberos tools from conda environment,
they need either disable conda environment,
or use system *kinit* running:
```shell
/usr/bin/kinit -f [yourusername]@FNAL.GOV` 
```

You can reset your Fermilab passwords for service-now
[here.](https://password-reset.fnal.gov/showLogin.cc)\
If you can\'t remember your password because you didn\'t write it down
then you will have contact the service desk.



Communication and Asking for Help
--------------------------------------------------------------------------------------

We use different technology to communicate, depending on the purpose and
type of communication.

-   Emails are used to send announcements, call for meetings or other
    events and, in general all important communication that shouldn\'t
    be missed goes through emails. Sign in to [SBND mailing
    lists](https://cdcvs.fnal.gov/redmine/projects/sbndcode/wiki/Computing_resources#Mailing-lists)
    by sending an email to <listserv@fnal.gov> with no subject and in
    the body put: **`SUBSCRIBE NAME-OF-MAILING-LIST Name Lastname`**,
    for example I would write: `SUBSCRIBE SBND-SOFTWARE Iker de Icaza`.


-   Slack is used for day to day communication, particularly useful if
    more than one could answer \--remember SBND collaborators span
    several time zones\-- or if the answer could benefit more people
    than just you. Once you have a FNAL account sign-in to [SBN
    Slack](https://shortbaseline.slack.com/signup) with you FNAL
    account.


-   [Zoom](http://zoom.us/) is used for meetings, you will
    need to have it installed on your computer. You don\'t need to make
    an account to use it, however if you open it with your FNAL email
    you can see Fermilab\'s rooms listed. **Pro Tip:** configure it to
    start meetings with no video and muted, also but less important, put
    your name as you would like it to appear to others.



New to Liquid Argon Technology/ Neutrino physics and SBND?
--------------------------------------------------------------------------------------------------------------------------------------

If you are new to Liquid Argon technology then here as some links you
might find useful:

Stolen straight from the 35 tonne page:

-   [Intro to LArTPCs - Stephen Pordes,
    2009](http://lartpc-docdb.fnal.gov/cgi-bin/RetrieveFile?docid=436&filename=forcdfstudents.pdf&version=1)
-   [Intro to LArTPC Reconstruction - Herb Greenlee,
    2013](https://indico.fnal.gov/getFile.py/access?contribId=35&sessionId=7&resId=0&materialId=slides&confId=6395)
-   [LArTPCs in the US - Tingjun Yang,
    2013](http://lartpc-docdb.fnal.gov/cgi-bin/RetrieveFile?docid=1056&filename=lartpcyang.pdf&version=2)

The SBN Proposal: [A Proposal for a Three Detector Short-Baseline
Neutrino Oscillation Program in the Fermilab Booster Neutrino
Beam](https://arxiv.org/pdf/1503.01520.pdf)

The [MicroBooNE](http://www-microboone.fnal.gov)

-   Public notes:
    <http://www-microboone.fnal.gov/publications/publicnotes/>
-   Publications:
    <http://www-microboone.fnal.gov/publications/index.html>

The [ICARUS](http://icarus.lngs.infn.it) publications:
<http://icarus.lngs.infn.it/publications.php>

Here is a list of publications/books that people have found useful.
Please add to the list!

-   [The Liquid Argon Time Projection Chamber: A New Concept for
    Neutrino
    Detectors](http://cds.cern.ch/record/117852/files/CERN-EP-INT-77-8.pdf)
    (This is a historical paper where the idea of LArTPCs were first
    considered)
-   [Studies with a Liquid Argon Time Projection
    Chamber](http://www.springer.com/us/book/9783658094294)
    (By Michael Schenk. It gives a nice overview of the
    theoretical/Design concepts of the technology)
-   [Light Sterile Neutrinos: A White
    Paper](https://arxiv.org/pdf/1204.5379.pdf) (It gives a
    good overview of the current status of eV sterile neutrinos. Also
    look at the references within)
-   [Combined νμ → νe & ν ̄μ → ν ̄e Oscillation Analysis of the
    MiniBooNE Excesses](https://arxiv.org/pdf/1207.4809.pdf)
    (The miniBooNE anomaly paper)
-   [Evidence for Neutrino Oscillations from the Observation of ν ̄e
    Appearance in a ν ̄μ
    Beam](https://arxiv.org/pdf/hep-ex/0104049.pdf) (The LSND
    anomaly paper)



New to the Software Surrounding SBND?
---------------------------------------------------------------------------------------------

To get started you need to have a basic knowledge of c++ and you need to
learn LArsoft. Root and Git are also useful.



### Art and LArsoft

Here is a few places to look at more information about Art and LArsoft.

-   LArsoft: [The SBND Guide to using
    LArSoft](The_SBND_Guide_to_using_LArSoft.html) (A useful
    page of links and examples)


-   LArsoft: [How to setup your directory and launch your first
    job](How_to_setup_your_directory_and_launch_your_first_job.html)
    (This is an SBND wiki page to help set up your first job, it is the
    first thing you should try at )


-   LArsoft: [Training
    sessions](https://cdcvs.fnal.gov/redmine/projects/art-larsoft-course/wiki/Instructions_for_Each_Session#Friday)
    (This a link to some useful presentations introducing LArsoft).


-   LArsoft: [Helpful tips for
    LArsoft](Helpful_tips_for_Larsoft_building.html) (This
    is a useful list of tips to help you along when editing your build)


-   LArsoft doxygen: <http://nusoft.fnal.gov/larsoft/doxsvn/html/> (This
    is the go to place to find out about the code. Some
    functions\\algorithms\\classes are better documented than others)


-   LArsoft redmine wiki:
    <https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/LArSoftWiki>
    (Gives a nice overview)


-   Basic Concepts:
    <https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/Using_art_in_LArSoft>
    (A Good link to start off with. It introduces some common features.)


-   The Art Workbook: <http://art.fnal.gov/art-workbook/> (It is big,
    and explains things fairly well. **Don\'t** do the examples last
    time I tried they didn\'t work)


-   The Analysis Examples: This is a package that can be downloaded into
    your local library. Follow the same procedure as in: [How to setup
    your directory and launch your first
    job](How_to_setup_your_directory_and_launch_your_first_job.html)
    but instead of mrb g sbndcode do mrs g larexamples . You can
    download the package with these steps:

```shell
mrb g sbndcode 
```
Do
```shell
mrb g larexamples 
```

The `g` is short for gitCheckout.

-   The mrb reference guide:
    <https://cdcvs.fnal.gov/redmine/projects/mrb/wiki/MrbRefereceGuide>


-   The LArsoft coding codeines:
    <https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/The_rules_and_guidelines>


-   The Art Wiki: <https://cdcvs.fnal.gov/redmine/projects/art/wiki>



### C++

There are a multitude of resources for c++. There are several books. The
one I learnt form was [Accelerated
C++](http://irpp.org/wp-content/uploads/sites/2/2014/04/Andrew-Koening-and-Barbara-E.-Moo-Accelerated-C++.pdf)

For online resources [Stack
Exchange](https://stackoverflow.com/questions/tagged/c%2B%2B)
is useful so is
[cppreference](http://en.cppreference.com/w/cpp/container/vector).
If you have a good c++ tutorial/documentation add it to the list!

-   Accelerated C++:
    <http://irpp.org/wp-content/uploads/sites/2/2014/04/Andrew-Koening-and-Barbara-E.-Moo-Accelerated-C++.pdf>


-   Stack Exchange: <https://stackoverflow.com/questions/tagged/c%2B%2B>


-   cppreference: <http://en.cppreference.com/w/cpp/container/vector>



### ROOT

[ROOT](https://root.cern.ch/doc/v608/) is also useful to know
and it can be used within LArsoft. If you are new to ROOT and you have a
bit of time to learn it I recommend the [Nevis
tutorials](https://www.nevis.columbia.edu/~seligman/root-class/).
Given, is an estimated time to complete each section so you have a good
idea how much time the whole tutorial takes. The ROOT
[pages](https://root.cern.ch/doc/v608/modules.html) are
powered by doxygen and are useful for finding information about specific
functions or finding a function you need. Below is a few more places
that are useful when learning ROOT. Feel free to add to the list!

-   The Root Tutorials: <https://root.cern.ch/root/html/tutorials/> (A
    very good list of different example macros in root, there is less
    explanation of how things are working but it gives you something to
    work off)


-   The Root Tutorials:
    <https://root.cern.ch/doc/master/group__Tutorials.html> (Same
    Principle as above, slightly different selection)


-   The Root Userguide:
    <https://root.cern.ch/root/htmldoc/guides/users-guide/ROOTUsersGuide.html>
    (Big, detailed, good explanations, reading all of it is probably too
    much)


-   The Root Primer:
    <https://root.cern.ch/root/htmldoc/guides/primer/ROOTPrimer.pdf>
    (Quicker, detailed, jumps straight into it, another useful thing to
    go through at the beginning, a little bit less friendly than the
    Nevis Tutorials.


-   Nevis Root Tutorials:
    <https://www.nevis.columbia.edu/~seligman/root-class/> (Good
    Beginners guide, easy to work through for a complete beginner. A
    good variety of tasks but doesn\'t go into as much detail as some of
    the other links)



### Git

New to [Git](https://github.com)? if so do the quick
[tutorial](https://try.github.io/levels/1/challenges/1) to
get an idea of how it works. To see how it used in SBND see the [Working
on a feature branch (to easily share
code)](Working_on_a_feature_branch_(to_easily_share_code).html).

**Pro Tip:** Log into a gpvm node and do the following commands to setup
your git account:

```shell
git config --global user.name "Name Lastname" 
git config --global user.email "user@fnal.gov" 
```
With this you will have your commits signed by you and listed neatly on
your Redmine account. You CAN list another email other than your FNAL
one, but you need to change it accordingly on your [Redmine
account.](https://cdcvs.fnal.gov/redmine/my/account)
