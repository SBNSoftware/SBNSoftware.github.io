---
lang: en
title: Standalone Bern Readout Instructions
---

[]{#Standalone-Bern-Readout-Instructions}

Standalone Bern Readout Instructions[¶](#Standalone-Bern-Readout-Instructions){.wiki-anchor}
============================================================================================

[]{#Getting-ready-to-run-the-code}

Getting ready to run the code[¶](#Getting-ready-to-run-the-code){.wiki-anchor}
------------------------------------------------------------------------------

In order to run the readout code, you first need to run the up-to-date
febdrv software. Therefore, make sure your sbnddaq-readout repository is
up to date. Under sbnddaq-readout/projects/bern/, you should find the
three relevant files to running the febdrv software. Make sure you run
the \'makeall\' script so that all the other scripts are properly made,
then you can begin.

[]{#Febdrv-febconf-and-febctl}

Febdrv, febconf, and febctl[¶](#Febdrv-febconf-and-febctl){.wiki-anchor}
------------------------------------------------------------------------

[]{#febdrv}

### febdrv[¶](#febdrv){.wiki-anchor}

For each board chain that you want to run, you need a terminal that is
running febdrv. febdrv requires three arguments. The first is the name
of the ethernet port that the board is hooked up to. The second is the
minimum polling time that the software should use to ask the front end
board for data. The third is the first of four local TCP socket numbers
to be used by the software to listen, publish, and give
statistics/binary statistics on the data. For example, the input:

    ./febdrv enp4s0 300 5555

tells febdrv to connect to the board hooked up to the ethernet socket
with the name enp4s0, to use a 300 ms poll time with that board chain,
and to set the responder, publisher, statistics, and binary statistics
ZeroMQ sockets to tcp://localhost:5555, tcp://localhost:5556,
tcp://localhost:5557, and tcp://localhost:5558 respectively. Once
correctly initialized, the terminal running febdrv should display a
confirmation that the board(s) on the chain are connected, along with
their MAC5 addresses. The MAC5 addresses of the boards are important, as
they are needed to use febconf and febctl. Below is an example of
terminal output when running febdrv, the line most helpful for the next
sections is the one that says \'Newly connected FEB\...\'.

![](/redmine/attachments/download/51266/febdrv_output.png)

[]{#febconf}

### febconf[¶](#febconf){.wiki-anchor}

febconf requires an instance of febdrv to communicate with, along with
3-4 arguments that specify which TCP port to connect to (i.e. the port
specified for the given instance of febdrv you wish to communicate with,
written as tcp://localhost:\#\#\#\#), two configuration files (which
should be in your CONF/ directory in projects/bern/), and what it calls
the \'FEB S/N\', which is the last bit of the given mac5 address by
febdrv, converted from hex in the febdrv output to decimal for
febconf\'s (and, later, febctl\'s) input. If a given mac5 is not given,
it will broadcast for all mac5 addresses on the chain, so if all boards
need the same config, then no need to enter an address. Below is an
example of what the script will tell you to enter if your code is
compiled correctly.

![](/redmine/attachments/download/51267/febconf.png)

**Note:** sometimes febconf can be finicky, so if you\'re using correct
syntax but getting an error from febdrv, try switching to a different
config file first and then back to the one you want. If that doesn\'t
work, also try doing a DAQ_BEG command with febctl (described below),
and then a DAQ_END, then running febconf with the files you want.

[]{#febctl}

### febctl[¶](#febctl){.wiki-anchor}

febctl requires 2-3 arguments, as well as an active instance of febdrv
to communicate with. The first argument requires is the first TCP port
being used by the instance of febdrv you wish to communicate to (just
like in febconf). The second is the command you want to use. See the
below image for a list of available commands, as well as the output of
febctl when not given any arguments:

![](/redmine/attachments/download/51268/febctl.png)

DAQ_BEG and DAQ_END begin and end the data collection process,
respectively. You should make sure that the board is in a DAQ_END state
when doing hardware changes with the boards, or changing the
configuration with febconf. The BIAS_ON and BIAS_OFF commands turn the
bias voltage of the boards on and off, i.e. the voltages between the
signal and bias pins on the front end board. It is **crucial** that you
not have the board in a state of BIAS_ON unless it has a SiPM board that
is not in danger of being flashed with a lot of light, or if an
electrical bridge is between the pins, and generally whenever you\'re
not explicitly taking data with SiPMs. Once the board is in a state of
DAQ_BEG, you can begin to use the analysis code.

[]{#The-Analysis-Code}

The Analysis Code[¶](#The-Analysis-Code){.wiki-anchor}
------------------------------------------------------

The analysis code can be found either attached to this wiki page, or in
my (Tyler Boone\'s) personal sbn account, under the name
\'ttree_get_FEB_data.cc\', in the directory
/home/nfs/tboone/data_repository/. The compilation instructions can be
found in the file named \'new_code_compilation_line.txt\' in the same
directory. Please contact me (<tboone0042@gmail.com>) if you have any
issues accessing it. Running the code is fairly straightforward: once
you have the code compiled, run the output file with three arguments.
The first is the number of the *publisher* TCP socket being used by the
instance of febdrv you wish to communicate with. That means if the
specified tcp range is 5555-5558, you should specify 5556 (don\'t use
tcp://localhost:, my code assumes this is what is being used, you only
need the four digit number). The second is the number of events you\'d
like to collect. The third is the mac5 of the board you wish to take
data from. This last argument is less to specify for the networking code
than it is to filter out \'garbage\' events given by the FEB, reducing
file size. Therefore, an example line to run the code would look like:

    ./output_name 5556 1000 92

[]{#Looking-at-your-ROOT-file}

Looking at your ROOT file[¶](#Looking-at-your-ROOT-file){.wiki-anchor}
----------------------------------------------------------------------

Once you\'ve run the analysis code and it\'s collected the events it was
asked to, you should have a ROOT file called myfile_port\_\#\#\#\#.root
with a TTree called \'charge_data_tree\' that will have the following
data:\
\#1 The mac5 of the board that recorded the event\
[\#2](/redmine/issues/2 "Bug: Self signed cert on website (Closed)"){.issue
.tracker-1 .status-5 .priority-4 .priority-default .closed} The position
of each event at the time the buffer was read out to the file, as well
as the message number in the series of data points taken in a given run\
[\#3](/redmine/issues/3 "Feature: Connect to Database with kerberos authentication (Rejected)"){.issue
.tracker-2 .status-6 .priority-4 .priority-default .closed} The charge
of all 32 channels on the FEB in DAC counts\
[\#4](/redmine/issues/4 "Feature: Postgres database  (Closed)"){.issue
.tracker-2 .status-5 .priority-4 .priority-default .closed} The
timestamps ts0 and ts1 of each event\
[\#5](/redmine/issues/5 "Feature: NIMROD extended to Accelerator Division (New)"){.issue
.tracker-2 .status-1 .priority-4 .priority-default .overdue} The number
lost by the CPU and the FPGA\
[\#6](/redmine/issues/6 "Feature: Non-KCA Remediation (New)"){.issue
.tracker-2 .status-1 .priority-4 .priority-default .overdue} The
\'last\' event ts1 and ts2, used to determine the time it took to read
out the buffer

Below are the branch names that correspond to these variables.

![](/redmine/attachments/download/51271/branchnames.png)

The tree in the file can be directly drawn from using the branches
above, using the Draw command:

    charge_data_tree->Draw("branch_name")

This page may be edited with more detail in the future. Please contact
me if you have any comments/questions about what I\'ve put here!
