---
lang: en
title: Checking multicast request sendingreceiving
---

[]{#Checking-multicast-request-sending-and-receiving}

Checking multicast request sending and receiving[¶](#Checking-multicast-request-sending-and-receiving){.wiki-anchor}
====================================================================================================================

[]{#The-basics-and-configuration}

The basics\... and configuration.[¶](#The-basics-and-configuration){.wiki-anchor}
---------------------------------------------------------------------------------

Multicast sending and receiving can be checked by using the
requestSender and requestReceiver programs that are a part of artdaq.\
With the environment setup, these commands should be available via the
PATH environment variable.\
For example:\

    [icarus@icarus-crt01 DAQInterface]$ which requestSender
    /daq/software/products_dev/artdaq/v3_07_02CHede526/slf7.x86_64.e19.py2.s94.prof/bin/requestSender
    [icarus@icarus-crt01 DAQInterface]$ 

\
The programs need valid fhicl configuration files. Currently, the
requestSender file should not have any containing fhicl\
table, but the requestReceiver should. Because of this potential
confusion and additionally because an invalid requestSender
configuration is basically silently ignore, it is important to learn
what output distinguishes valid form invalid configuration.

Output from **invalid** requestSender configuration will look like:\

    [icarus@icarus-crt01 DAQInterface]$ requestSender -c ~/sendRequest.fcl
    %MSG-i configureMessageFacility:  Early 16-Apr-2020 02:32:39 CDT pre-events configureMessageFacility.cc:290
    Message Facility Application RequestSender configured with: destinations:{console:{threshold:"INFO" type:"cout"}}
    %MSG
    %MSG-i _RequestSender:  DAQ 16-Apr-2020 02:32:39 CDT Booted RequestSender.cc:49
    Shutting down RequestSender: Waiting for 0 requests to be sent
    %MSG
    %MSG-i _RequestSender:  DAQ 16-Apr-2020 02:32:39 CDT Booted RequestSender.cc:61
    Shutting down RequestSender: request_socket_: -1, token_socket_: -1
    %MSG
    [icarus@icarus-crt01 DAQInterface]$ 

The absences of \_TCPConnect message from the above should be noted and
contrasted with the following:

    [icarus@icarus-crt01 DAQInterface]$ requestSender -c ~/sendRequest.fcl
    %MSG-i configureMessageFacility:  Early 16-Apr-2020 02:36:15 CDT pre-events configureMessageFacility.cc:290
    Message Facility Application RequestSender configured with: destinations:{console:{threshold:"INFO" type:"cout"}}
    %MSG
    %MSG-i _TCPConnect:  DAQ 16-Apr-2020 02:36:15 CDT Booted TCPConnect.cc:334
    Resolving host 227.128.12.35, on port 3501
    %MSG
    %MSG-i _TCPConnect:  DAQ 16-Apr-2020 02:36:15 CDT Booted TCPConnect.cc:241
    Resolving ip 192.168.191.20
    %MSG
    %MSG-i _TCPConnect:  DAQ 16-Apr-2020 02:36:15 CDT Booted TCPConnect.cc:276
    Using interface daq
    %MSG
    %MSG-i _RequestSender:  DAQ 16-Apr-2020 02:36:15 CDT Booted RequestSender.cc:135
    Successfully determined the multicast network interface for 192.168.191.20: 192.168.191.34
    %MSG
    %MSG-i _RequestSender:  DAQ 16-Apr-2020 02:36:15 CDT Booted RequestSender.cc:49
    Shutting down RequestSender: Waiting for 1 requests to be sent
    %MSG
    %MSG-i _RequestSender:  DAQ 16-Apr-2020 02:36:15 CDT Booted RequestSender.cc:61
    Shutting down RequestSender: request_socket_: 3, token_socket_: -1
    %MSG
    [icarus@icarus-crt01 DAQInterface]$ 

The sendRequest.fcl file use in the above example is:\

          ## Enable sending Data Request messages
          send_requests: true

          ## Multicast address to send DataRequests to
          request_address: "227.128.12.35" 

          ## Port to send DataRequests on
          request_port: 3501

          ## Use this hostname for multicast output(to assign to the proper NIC)
          #multicast_interface_ip: "0.0.0.0"  # default
          multicast_interface_ip: "192.168.191.0" 

          ## Whether to request acknowledgments for requests sent
          request_acknowledgements: false  # default

          ## Amount of time to wait between each request message
          request_sending_delay: 1000000

          ## Number of requests to send
          num_requests: 10

          ## Sequence ID of first request
          starting_sequence_id: 11  # default

          ## Amount to increment Sequence ID for each request
          sequence_id_scale: 1  # default

          ## Timestamp of first request
          starting_timestamp: 1  # default

          ## Amount to increment timestamp for each request
          timestamp_scale: 1  # default

          ## Rank of the requestSender app
          request_sender_app_rank: -1  # default

The \"request_address,\" \"request_port,\" and
\"multicast_interface_ip\" are the crucial parameters.\
It should be noted that for the multicast_interface_ip, a subnet can be
used. This allows the value\
for this parameter to be the same for the sender and the receiver.

For the requestReceiver program\'s configuration, the following is
currently valid:\

       request_receiver: {

          ## Port to listen for request messages on
          request_port: 3501

          ## Multicast address to listen for request messages on
          request_address: "227.128.12.35" 

          ## Use this hostname for multicast (to assign to the proper NIC)
          #multicast_interface_ip: "0.0.0.0"  # default
          multicast_interface_ip: "192.168.191.0" 

          ## Expected increment of sequence ID between each request
          request_increment: 1  # default

          ## Rank of this requestReceiver app
          request_receiver_app_rank: -1  # default

          ## Number of requests to receive before exiting. -1 to go forever.
          request_count: -1  # default
       }

[]{#Running-the-programs}

Running the programs.[¶](#Running-the-programs){.wiki-anchor}
-------------------------------------------------------------

Once you believe you have your environment set and valid configuration
files, first start the requestReceiver program.\
As a starting point, you may wish to try running the requestReceiver on
the same host/node as you will run the requestSender on.\
You can, of course, run the requestReceiver program on multiple nodes as
long as they have access to the same subnet that the\
requestSender will be sending the requests on.

So:

1.  Start the requestReceiver(s)
2.  Execute the requestSender
3.  Look back at the requestReceiver program for additional output that
    should have resulted from the previous step.

NOTE: the requestReceiver program will ignore duplicate requests which
it will receive if the requestSender is rerun without restarting the\
requestReceiver program(s).

Initial requestReceiver output will look like:\

    [icarus@icarus-crt01 DAQInterface]$ requestReceiver -c ~/receiveRequest.fcl
    %MSG-i configureMessageFacility:  Early 16-Apr-2020 03:12:21 CDT pre-events configureMessageFacility.cc:290
    Message Facility Application requestReceiver configured with: destinations:{console:{threshold:"INFO" type:"cout"}}
    %MSG
    %MSG-i _RequestReceiver:  DAQ 16-Apr-2020 03:12:21 CDT Booted RequestReceiver.cc:75
    Setting up request listen socket, rank=-1, address=227.128.12.35:3501, multicast interface=192.168.191.0
    %MSG
    %MSG-i _TCPConnect:  DAQ 16-Apr-2020 03:12:21 CDT Booted TCPConnect.cc:56
    Resolving host 227.128.12.35
    %MSG
    %MSG-i _TCPConnect:  DAQ 16-Apr-2020 03:12:21 CDT Booted TCPConnect.cc:241
    Resolving ip 192.168.191.0
    %MSG
    %MSG-i _TCPConnect:  DAQ 16-Apr-2020 03:12:21 CDT Booted TCPConnect.cc:276
    Using interface daq
    %MSG
    %MSG-i _RequestReceiver:  DAQ 16-Apr-2020 03:12:21 CDT Booted RequestReceiver.cc:119
    Successfully determined the multicast network interface for 192.168.191.0: 192.168.191.34 (RequestReceiver)
    %MSG
    %MSG-i _RequestReceiver:  DAQ 16-Apr-2020 03:12:21 CDT Booted RequestReceiver.cc:126
    Done setting up request socket, rank=-1
    %MSG
    %MSG-i _RequestReceiver:  DAQ 16-Apr-2020 03:12:21 CDT Booted RequestReceiver.cc:179
    Starting Request Reception Thread
    %MSG

The requestSender output is as indicated above.\
The additional requestReceiver output should look like:\

    %MSG-i requestReceiver:  DAQ 16-Apr-2020 03:13:47 CDT Booted requestReceiver.cc:36
    Received Request for Sequence ID 11, timestamp 1
    %MSG
    %MSG-i requestReceiver:  DAQ 16-Apr-2020 03:13:47 CDT Booted requestReceiver.cc:36
    Received Request for Sequence ID 12, timestamp 2
    %MSG
    %MSG-i requestReceiver:  DAQ 16-Apr-2020 03:13:47 CDT Booted requestReceiver.cc:36
    Received Request for Sequence ID 13, timestamp 3
    %MSG
    %MSG-i requestReceiver:  DAQ 16-Apr-2020 03:13:47 CDT Booted requestReceiver.cc:36
    Received Request for Sequence ID 14, timestamp 4
    %MSG
    %MSG-i requestReceiver:  DAQ 16-Apr-2020 03:13:47 CDT Booted requestReceiver.cc:36
    Received Request for Sequence ID 15, timestamp 5
    %MSG
    %MSG-i requestReceiver:  DAQ 16-Apr-2020 03:13:47 CDT Booted requestReceiver.cc:36
    Received Request for Sequence ID 16, timestamp 6
    %MSG
    %MSG-i requestReceiver:  DAQ 16-Apr-2020 03:13:47 CDT Booted requestReceiver.cc:36
    Received Request for Sequence ID 17, timestamp 7
    %MSG
    %MSG-i requestReceiver:  DAQ 16-Apr-2020 03:13:47 CDT Booted requestReceiver.cc:36
    Received Request for Sequence ID 18, timestamp 8
    %MSG
    %MSG-i requestReceiver:  DAQ 16-Apr-2020 03:13:47 CDT Booted requestReceiver.cc:36
    Received Request for Sequence ID 19, timestamp 9
    %MSG
    %MSG-i requestReceiver:  DAQ 16-Apr-2020 03:13:47 CDT Booted requestReceiver.cc:36
    [RATE LIMIT] Received Request for Sequence ID 20, timestamp 10
    %MSG
