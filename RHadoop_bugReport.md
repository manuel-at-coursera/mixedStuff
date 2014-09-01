RHadoop_bugReport
==========

The software versions are:

Cluster Stack Version: HDP-2.1
# Service   Version

HDFS	2.4.0.2.1
YARN + MapReduce2	2.4.0.2.1
Tez	0.4.0.2.1
Nagios	3.5.0
Ganglia	3.5.0
Hive	0.13.0.2.1
Pig	0.12.1.2.1
Sqoop	1.4.4.2.1
Oozie	4.0.0.2.1
ZooKeeper	3.4.5.2.1
Falcon	0.5.0.2.1


Repositories: 2.1
# OS
# Base URL

redhat5	http://public-repo-1.hortonworks.com/HDP/centos5/2.x/updates/2.1.3.0
redhat6	http://public-repo-1.hortonworks.com/HDP/centos6/2.x/updates/2.1.4.0
suse11	http://public-repo-1.hortonworks.com/HDP/suse11/2.x/updates/2.1.3.0

___________________________________________________


The components installed on each node are:

centos1

App Timeline Server
Falcon Server
Ganglia Monitor
HDFS Client
History Server
Hive Client
Hive Metastore
HiveServer2
MySQL Server
Oozie Server
ResourceManager
SNameNode
Tez Client
WebHCat Server
YARN Client
ZooKeeper Client
ZooKeeper Server


centos2

Ganglia Monitor
Ganglia Server
HCat
Nagios Server
NameNode
Oozie Client
Tez Client
YARN Client
ZooKeeper Server


centos3

DataNode
Falcon Client
Ganglia Monitor
HCat
HDFS Client
Hive Client
MapReduce2 Client
NodeManager
Oozie Client
Pig
Sqoop
Tez Client
YARN Client
ZooKeeper Client
ZooKeeper Server


centos4

DataNode
Falcon Client
Ganglia Monitor
HCat
HDFS Client
Hive Client
MapReduce2 Client
NodeManager
Oozie Client
Pig
Sqoop
Tez Client
YARN Client
ZooKeeper Client


centos5

DataNode
Falcon Client
Ganglia Monitor
HCat
HDFS Client
Hive Client
MapReduce2 Client
NodeManager
Oozie Client
Pig
Sqoop
Tez Client
YARN Client
ZooKeeper Client

___________________________________________________


"top" command for each of the five nodes:
* After a complete cluster shut-down and restart
* Including ambari-server / -agent restart


centos1

top - 17:28:35 up 4 days,  2:25,  1 user,  load average: 0.13, 0.97, 0.81
Tasks: 151 total,   1 running, 150 sleeping,   0 stopped,   0 zombie
Cpu(s):  2.7%us,  1.3%sy,  0.0%ni, 96.0%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Mem:   8062808k total,  3874752k used,  4188056k free,   256076k buffers
Swap:  8208376k total,        0k used,  8208376k free,  1586400k cached


centos2

top - 17:29:48 up 4 days,  2:27,  1 user,  load average: 0.15, 0.34, 0.24
Tasks: 144 total,   1 running, 143 sleeping,   0 stopped,   0 zombie
Cpu(s):  4.4%us,  3.4%sy,  0.0%ni, 92.3%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Mem:   8063004k total,  1775852k used,  6287152k free,   194616k buffers
Swap:  8208376k total,        0k used,  8208376k free,   711400k cached


centos3

top - 17:30:11 up 4 days,  2:21,  1 user,  load average: 0.00, 0.05, 0.05
Tasks: 129 total,   1 running, 128 sleeping,   0 stopped,   0 zombie
Cpu(s):  3.1%us,  1.0%sy,  0.0%ni, 95.9%id,  0.1%wa,  0.0%hi,  0.0%si,  0.0%st
Mem:   8063004k total,  1310588k used,  6752416k free,   196932k buffers
Swap:  8208376k total,        0k used,  8208376k free,   549112k cached


centos4

top - 17:30:32 up 4 days,  2:21,  1 user,  load average: 0.01, 0.03, 0.00
Tasks: 128 total,   1 running, 127 sleeping,   0 stopped,   0 zombie
Cpu(s):  2.9%us,  0.9%sy,  0.0%ni, 96.1%id,  0.1%wa,  0.0%hi,  0.0%si,  0.0%st
Mem:   8063004k total,  1338692k used,  6724312k free,   195128k buffers
Swap:  8208376k total,        0k used,  8208376k free,   596916k cached


centos5

top - 17:30:53 up 4 days,  2:21,  1 user,  load average: 0.01, 0.09, 0.08
Tasks: 127 total,   1 running, 126 sleeping,   0 stopped,   0 zombie
Cpu(s):  3.0%us,  0.9%sy,  0.0%ni, 96.0%id,  0.1%wa,  0.0%hi,  0.0%si,  0.0%st
Mem:   8063004k total,  1332576k used,  6730428k free,   195328k buffers
Swap:  8208376k total,        0k used,  8208376k free,   598012k cached

___________________________________________________

Yarn / MapReduce memory configuration:

Number of containers: 2			
RAM per container: 2048 MB			
			
Configuration Setting			Value Calculation		Value	Override

yarn.nodemanager.resource.memory-mb	= containers * RAM-p.-cont.	4096	no
yarn.scheduler.minimum-allocation-mb	= RAM-per-container		2048	no
yarn.scheduler.maximum-allocation-mb	= containers * RAM-p.-cont.	4096	no
mapreduce.map.memory.mb			= RAM-per-container		2048	no
mapreduce.reduce.memory.mb		= 2 * RAM-per-container		4096	no
mapreduce.map.java.opts			= 0.8 * RAM-per-container	1638,4	yes, set to 2048 MB
mapreduce.reduce.java.opts		= 0.8 * 2 * RAM-per-container	3276,8	yes, set to 4096 MB
yarn.app.mapreduce.am.resource.mb	= 2 * RAM-per-container		4096	no
yarn.app.mapreduce.am.command-opts	= 0.8 * 2 * RAM-per-container	3276,8	yes, set to 4096 MB

___________________________________________________


Shell output:


[root@centos1 ~]# R

R version 3.1.0 (2014-04-10) -- "Spring Dance"
Copyright (C) 2014 The R Foundation for Statistical Computing
Platform: x86_64-redhat-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> groups = rbinom(100, n = 500, prob = 0.5)
> tapply(groups, groups, length)
36 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62
 1  3  1  6  9 13 16 17 30 34 46 39 40 41 38 34 29 21 14 22 12  6 14  7  3  2
64
 2
> require('rmr2')
Loading required package: rmr2
> groups = rbinom(100, n = 500, prob = 0.5)
> groups = to.dfs(groups)
14/09/01 17:32:42 INFO zlib.ZlibFactory: Successfully loaded & initialized native-zlib library
14/09/01 17:32:42 INFO compress.CodecPool: Got brand-new compressor [.deflate]
> result = mapreduce(
+     input = groups,
+     map = function(k,v) keyval(v, 1),
+     reduce = function(k,vv) keyval(k, length(vv)))
packageJobJar: [] [/usr/lib/hadoop-mapreduce/hadoop-streaming-2.4.0.2.1.4.0-632.jar] /tmp/streamjob7414054980203160633.jar tmpDir=null
14/09/01 17:32:52 INFO impl.TimelineClientImpl: Timeline service address: http://centos1.local:8188/ws/v1/timeline/
14/09/01 17:32:52 INFO client.RMProxy: Connecting to ResourceManager at centos1.local/10.157.16.93:8050
14/09/01 17:32:53 INFO impl.TimelineClientImpl: Timeline service address: http://centos1.local:8188/ws/v1/timeline/
14/09/01 17:32:53 INFO client.RMProxy: Connecting to ResourceManager at centos1.local/10.157.16.93:8050
14/09/01 17:32:55 INFO mapred.FileInputFormat: Total input paths to process : 1
14/09/01 17:32:55 INFO mapreduce.JobSubmitter: number of splits:2
14/09/01 17:32:55 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1409584998239_0001
14/09/01 17:32:56 INFO impl.YarnClientImpl: Submitted application application_1409584998239_0001
14/09/01 17:32:56 INFO mapreduce.Job: The url to track the job: http://centos1.local:8088/proxy/application_1409584998239_0001/
14/09/01 17:32:56 INFO mapreduce.Job: Running job: job_1409584998239_0001
14/09/01 17:33:08 INFO mapreduce.Job: Job job_1409584998239_0001 running in uber mode : false
14/09/01 17:33:08 INFO mapreduce.Job:  map 0% reduce 0%
14/09/01 17:33:18 INFO mapreduce.Job: Task Id : attempt_1409584998239_0001_m_000001_0, Status : FAILED Error: Java heap space
14/09/01 17:33:18 INFO mapreduce.Job: Task Id : attempt_1409584998239_0001_m_000000_0, Status : FAILED Error: Java heap space
14/09/01 17:33:25 INFO mapreduce.Job: Task Id : attempt_1409584998239_0001_m_000001_1, Status : FAILED Error: Java heap space
14/09/01 17:33:26 INFO mapreduce.Job: Task Id : attempt_1409584998239_0001_m_000000_1, Status : FAILED Error: Java heap space
14/09/01 17:33:32 INFO mapreduce.Job: Task Id : attempt_1409584998239_0001_m_000001_2, Status : FAILED Error: Java heap space
14/09/01 17:33:32 INFO mapreduce.Job: Task Id : attempt_1409584998239_0001_m_000000_2, Status : FAILED Error: Java heap space
14/09/01 17:33:41 INFO mapreduce.Job:  map 100% reduce 100%
14/09/01 17:33:41 INFO mapreduce.Job: Job job_1409584998239_0001 failed with state FAILED due to: Task failed task_1409584998239_0001_m_000000 Job failed as tasks failed. failedMaps:1 failedReduces:0

14/09/01 17:33:41 INFO mapreduce.Job: Counters: 13
        Job Counters
                Failed map tasks=7
                Killed map tasks=1
                Launched map tasks=8
                Other local map tasks=6
                Data-local map tasks=2
                Total time spent by all maps in occupied slots (ms)=96292
                Total time spent by all reduces in occupied slots (ms)=0
                Total time spent by all map tasks (ms)=48146
                Total vcore-seconds taken by all map tasks=48146
                Total megabyte-seconds taken by all map tasks=197206016
        Map-Reduce Framework
                CPU time spent (ms)=0
                Physical memory (bytes) snapshot=0
                Virtual memory (bytes) snapshot=0
14/09/01 17:33:41 ERROR streaming.StreamJob: Job not Successful!
Streaming Command Failed!
Error in mr(map = map, reduce = reduce, combine = combine, vectorized.reduce,  :
  hadoop streaming failed with error code 1

___________________________________________________


jobhistory:

Job Name: 	streamjob7414054980203160633.jar
User Name: 	root
Queue: 	default
State: 	FAILED
Uberized: 	false
Submitted: 	Mon Sep 01 17:32:56 CEST 2014
Started: 	Mon Sep 01 17:33:02 CEST 2014
Finished: 	Mon Sep 01 17:33:35 CEST 2014
Elapsed: 	32sec
Diagnostics: 	
Task failed task_1409584998239_0001_m_000000
Job failed as tasks failed. failedMaps:1 failedReduces:0 

___________________________________________________


NodeManager information:

Total Vmem allocated for Containers 	8.40 GB
Vmem enforcement enabled 	false
Total Pmem allocated for Container 	4 GB
Pmem enforcement enabled 	false
NodeHealthyStatus 	true
LastNodeHealthTime 	Mon Sep 01 17:35:36 CEST 2014
NodeHealthReport 	
Node Manager Version: 	2.4.0.2.1.4.0-632 from 5875a08eb52c3c2dc082b48eba7282be7dc8c6c2 by jenkins source checksum 3794ba3e940493c98b319b321b593 on 2014-07-29T21:57Z
Hadoop Version: 	2.4.0.2.1.4.0-632 from 5875a08eb52c3c2dc082b48eba7282be7dc8c6c2 by jenkins source checksum 30f74f836e24bea45b4883fec56f621c on 2014-07-29T21:56Z 

___________________________________________________


Log file:

 Log Type: syslog

Log Length: 77017

2014-09-01 17:32:56,348 INFO [main] org.apache.hadoop.mapreduce.v2.app.MRAppMaster: Created MRAppMaster for application appattempt_1409584998239_0001_000001
2014-09-01 17:32:57,404 INFO [main] org.apache.hadoop.mapreduce.v2.app.MRAppMaster: Executing with tokens:
2014-09-01 17:32:57,404 INFO [main] org.apache.hadoop.mapreduce.v2.app.MRAppMaster: Kind: YARN_AM_RM_TOKEN, Service: , Ident: (org.apache.hadoop.yarn.security.AMRMTokenIdentifier@6cf1f051)
2014-09-01 17:32:58,811 INFO [main] org.apache.hadoop.mapreduce.v2.app.MRAppMaster: OutputCommitter set in config null
2014-09-01 17:32:58,813 INFO [main] org.apache.hadoop.mapreduce.v2.app.MRAppMaster: OutputCommitter is org.apache.hadoop.mapred.FileOutputCommitter
2014-09-01 17:32:58,937 INFO [main] org.apache.hadoop.yarn.event.AsyncDispatcher: Registering class org.apache.hadoop.mapreduce.jobhistory.EventType for class org.apache.hadoop.mapreduce.jobhistory.JobHistoryEventHandler
2014-09-01 17:32:58,939 INFO [main] org.apache.hadoop.yarn.event.AsyncDispatcher: Registering class org.apache.hadoop.mapreduce.v2.app.job.event.JobEventType for class org.apache.hadoop.mapreduce.v2.app.MRAppMaster$JobEventDispatcher
2014-09-01 17:32:58,942 INFO [main] org.apache.hadoop.yarn.event.AsyncDispatcher: Registering class org.apache.hadoop.mapreduce.v2.app.job.event.TaskEventType for class org.apache.hadoop.mapreduce.v2.app.MRAppMaster$TaskEventDispatcher
2014-09-01 17:32:58,944 INFO [main] org.apache.hadoop.yarn.event.AsyncDispatcher: Registering class org.apache.hadoop.mapreduce.v2.app.job.event.TaskAttemptEventType for class org.apache.hadoop.mapreduce.v2.app.MRAppMaster$TaskAttemptEventDispatcher
2014-09-01 17:32:58,944 INFO [main] org.apache.hadoop.yarn.event.AsyncDispatcher: Registering class org.apache.hadoop.mapreduce.v2.app.commit.CommitterEventType for class org.apache.hadoop.mapreduce.v2.app.commit.CommitterEventHandler
2014-09-01 17:32:58,947 INFO [main] org.apache.hadoop.yarn.event.AsyncDispatcher: Registering class org.apache.hadoop.mapreduce.v2.app.speculate.Speculator$EventType for class org.apache.hadoop.mapreduce.v2.app.MRAppMaster$SpeculatorEventDispatcher
2014-09-01 17:32:58,948 INFO [main] org.apache.hadoop.yarn.event.AsyncDispatcher: Registering class org.apache.hadoop.mapreduce.v2.app.rm.ContainerAllocator$EventType for class org.apache.hadoop.mapreduce.v2.app.MRAppMaster$ContainerAllocatorRouter
2014-09-01 17:32:58,949 INFO [main] org.apache.hadoop.yarn.event.AsyncDispatcher: Registering class org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncher$EventType for class org.apache.hadoop.mapreduce.v2.app.MRAppMaster$ContainerLauncherRouter
2014-09-01 17:32:59,044 INFO [main] org.apache.hadoop.yarn.event.AsyncDispatcher: Registering class org.apache.hadoop.mapreduce.v2.app.job.event.JobFinishEvent$Type for class org.apache.hadoop.mapreduce.v2.app.MRAppMaster$JobFinishEventHandler
2014-09-01 17:32:59,331 INFO [main] org.apache.hadoop.metrics2.impl.MetricsConfig: loaded properties from hadoop-metrics2.properties
2014-09-01 17:32:59,469 INFO [main] org.apache.hadoop.metrics2.impl.MetricsSystemImpl: Scheduled snapshot period at 60 second(s).
2014-09-01 17:32:59,469 INFO [main] org.apache.hadoop.metrics2.impl.MetricsSystemImpl: MRAppMaster metrics system started
2014-09-01 17:32:59,479 INFO [main] org.apache.hadoop.mapreduce.v2.app.job.impl.JobImpl: Adding job token for job_1409584998239_0001 to jobTokenSecretManager
2014-09-01 17:32:59,757 INFO [main] org.apache.hadoop.mapreduce.v2.app.job.impl.JobImpl: Not uberizing job_1409584998239_0001 because: not enabled;
2014-09-01 17:32:59,828 INFO [main] org.apache.hadoop.mapreduce.v2.app.job.impl.JobImpl: Input size for job job_1409584998239_0001 = 908. Number of splits = 2
2014-09-01 17:32:59,830 INFO [main] org.apache.hadoop.mapreduce.v2.app.job.impl.JobImpl: Number of reduces for job job_1409584998239_0001 = 1
2014-09-01 17:32:59,830 INFO [main] org.apache.hadoop.mapreduce.v2.app.job.impl.JobImpl: job_1409584998239_0001Job Transitioned from NEW to INITED
2014-09-01 17:32:59,833 INFO [main] org.apache.hadoop.mapreduce.v2.app.MRAppMaster: MRAppMaster launching normal, non-uberized, multi-container job job_1409584998239_0001.
2014-09-01 17:32:59,927 INFO [main] org.apache.hadoop.ipc.CallQueueManager: Using callQueue class java.util.concurrent.LinkedBlockingQueue
2014-09-01 17:32:59,978 INFO [Socket Reader #1 for port 34988] org.apache.hadoop.ipc.Server: Starting Socket Reader #1 for port 34988
2014-09-01 17:33:00,049 INFO [main] org.apache.hadoop.yarn.factories.impl.pb.RpcServerFactoryPBImpl: Adding protocol org.apache.hadoop.mapreduce.v2.api.MRClientProtocolPB to the server
2014-09-01 17:33:00,053 INFO [IPC Server Responder] org.apache.hadoop.ipc.Server: IPC Server Responder: starting
2014-09-01 17:33:00,057 INFO [IPC Server listener on 34988] org.apache.hadoop.ipc.Server: IPC Server listener on 34988: starting
2014-09-01 17:33:00,059 INFO [main] org.apache.hadoop.mapreduce.v2.app.client.MRClientService: Instantiated MRClientService at centos3.local/10.157.16.95:34988
2014-09-01 17:33:00,262 INFO [main] org.mortbay.log: Logging to org.slf4j.impl.Log4jLoggerAdapter(org.mortbay.log) via org.mortbay.log.Slf4jLog
2014-09-01 17:33:00,276 INFO [main] org.apache.hadoop.http.HttpRequestLog: Http request log for http.requests.mapreduce is not defined
2014-09-01 17:33:00,309 INFO [main] org.apache.hadoop.http.HttpServer2: Added global filter 'safety' (class=org.apache.hadoop.http.HttpServer2$QuotingInputFilter)
2014-09-01 17:33:00,326 INFO [main] org.apache.hadoop.http.HttpServer2: Added filter AM_PROXY_FILTER (class=org.apache.hadoop.yarn.server.webproxy.amfilter.AmIpFilter) to context mapreduce
2014-09-01 17:33:00,328 INFO [main] org.apache.hadoop.http.HttpServer2: Added filter AM_PROXY_FILTER (class=org.apache.hadoop.yarn.server.webproxy.amfilter.AmIpFilter) to context static
2014-09-01 17:33:00,338 INFO [main] org.apache.hadoop.http.HttpServer2: adding path spec: /mapreduce/*
2014-09-01 17:33:00,338 INFO [main] org.apache.hadoop.http.HttpServer2: adding path spec: /ws/*
2014-09-01 17:33:00,378 INFO [main] org.apache.hadoop.http.HttpServer2: Jetty bound to port 54341
2014-09-01 17:33:00,378 INFO [main] org.mortbay.log: jetty-6.1.26
2014-09-01 17:33:00,611 INFO [main] org.mortbay.log: Extract jar:file:/usr/lib/hadoop-yarn/hadoop-yarn-common-2.4.0.2.1.4.0-632.jar!/webapps/mapreduce to /tmp/Jetty_0_0_0_0_54341_mapreduce____.qkcfbs/webapp
2014-09-01 17:33:01,271 INFO [main] org.mortbay.log: Started SelectChannelConnector@0.0.0.0:54341
2014-09-01 17:33:01,271 INFO [main] org.apache.hadoop.yarn.webapp.WebApps: Web app /mapreduce started at 54341
2014-09-01 17:33:02,147 INFO [main] org.apache.hadoop.yarn.webapp.WebApps: Registered webapp guice modules
2014-09-01 17:33:02,153 INFO [main] org.apache.hadoop.ipc.CallQueueManager: Using callQueue class java.util.concurrent.LinkedBlockingQueue
2014-09-01 17:33:02,155 INFO [Socket Reader #1 for port 55313] org.apache.hadoop.ipc.Server: Starting Socket Reader #1 for port 55313
2014-09-01 17:33:02,161 INFO [IPC Server Responder] org.apache.hadoop.ipc.Server: IPC Server Responder: starting
2014-09-01 17:33:02,161 INFO [IPC Server listener on 55313] org.apache.hadoop.ipc.Server: IPC Server listener on 55313: starting
2014-09-01 17:33:02,181 INFO [main] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerRequestor: nodeBlacklistingEnabled:true
2014-09-01 17:33:02,181 INFO [main] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerRequestor: maxTaskFailuresPerNode is 3
2014-09-01 17:33:02,181 INFO [main] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerRequestor: blacklistDisablePercent is 33
2014-09-01 17:33:02,301 INFO [main] org.apache.hadoop.yarn.client.RMProxy: Connecting to ResourceManager at centos1.local/10.157.16.93:8030
2014-09-01 17:33:02,674 INFO [main] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: maxContainerCapability: 4096
2014-09-01 17:33:02,674 INFO [main] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: queue: default
2014-09-01 17:33:02,683 INFO [main] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Upper limit on the thread pool size is 500
2014-09-01 17:33:02,686 INFO [main] org.apache.hadoop.yarn.client.api.impl.ContainerManagementProtocolProxy: yarn.client.max-nodemanagers-proxies : 500
2014-09-01 17:33:02,700 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.JobImpl: job_1409584998239_0001Job Transitioned from INITED to SETUP
2014-09-01 17:33:02,707 INFO [CommitterEvent Processor #0] org.apache.hadoop.mapreduce.v2.app.commit.CommitterEventHandler: Processing the event EventType: JOB_SETUP
2014-09-01 17:33:02,732 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.JobImpl: job_1409584998239_0001Job Transitioned from SETUP to RUNNING
2014-09-01 17:33:02,984 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved centos5.local to /default-rack
2014-09-01 17:33:02,988 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved centos3.local to /default-rack
2014-09-01 17:33:02,995 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved centos4.local to /default-rack
2014-09-01 17:33:03,040 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskImpl: task_1409584998239_0001_m_000000 Task Transitioned from NEW to SCHEDULED
2014-09-01 17:33:03,040 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved centos5.local to /default-rack
2014-09-01 17:33:03,040 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved centos3.local to /default-rack
2014-09-01 17:33:03,040 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved centos4.local to /default-rack
2014-09-01 17:33:03,042 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskImpl: task_1409584998239_0001_m_000001 Task Transitioned from NEW to SCHEDULED
2014-09-01 17:33:03,042 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskImpl: task_1409584998239_0001_r_000000 Task Transitioned from NEW to SCHEDULED
2014-09-01 17:33:03,043 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000000_0 TaskAttempt Transitioned from NEW to UNASSIGNED
2014-09-01 17:33:03,052 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000001_0 TaskAttempt Transitioned from NEW to UNASSIGNED
2014-09-01 17:33:03,052 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_r_000000_0 TaskAttempt Transitioned from NEW to UNASSIGNED
2014-09-01 17:33:03,054 INFO [Thread-51] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: mapResourceReqt:4096
2014-09-01 17:33:03,085 INFO [Thread-51] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: reduceResourceReqt:4096
2014-09-01 17:33:03,163 INFO [eventHandlingThread] org.apache.hadoop.mapreduce.jobhistory.JobHistoryEventHandler: Event Writer setup for JobId: job_1409584998239_0001, File: hdfs://centos2.local:8020/user/root/.staging/job_1409584998239_0001/job_1409584998239_0001_1.jhist
2014-09-01 17:33:03,687 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Before Scheduling: PendingReds:1 ScheduledMaps:2 ScheduledReds:0 AssignedMaps:0 AssignedReds:0 CompletedMaps:0 CompletedReds:0 ContAlloc:0 ContRel:0 HostLocal:0 RackLocal:0
2014-09-01 17:33:03,821 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerRequestor: getResources() for application_1409584998239_0001: ask=5 release= 0 newContainers=0 finishedContainers=0 resourcelimit=<memory:8192, vCores:0> knownNMs=3
2014-09-01 17:33:03,821 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Recalculating schedule, headroom=8192
2014-09-01 17:33:03,821 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Reduce slow start threshold not met. completedMapsForReduceSlowstart 1
2014-09-01 17:33:04,839 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Got allocated containers 2
2014-09-01 17:33:04,845 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Assigned container container_1409584998239_0001_01_000002 to attempt_1409584998239_0001_m_000000_0
2014-09-01 17:33:04,853 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Assigned container container_1409584998239_0001_01_000003 to attempt_1409584998239_0001_m_000001_0
2014-09-01 17:33:04,853 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Recalculating schedule, headroom=0
2014-09-01 17:33:04,853 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Reduce slow start threshold not met. completedMapsForReduceSlowstart 1
2014-09-01 17:33:04,853 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: After Scheduling: PendingReds:1 ScheduledMaps:0 ScheduledReds:0 AssignedMaps:2 AssignedReds:0 CompletedMaps:0 CompletedReds:0 ContAlloc:2 ContRel:0 HostLocal:2 RackLocal:0
2014-09-01 17:33:04,904 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved centos4.local to /default-rack
2014-09-01 17:33:04,919 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: The job-jar file on the remote FS is hdfs://centos2.local:8020/user/root/.staging/job_1409584998239_0001/job.jar
2014-09-01 17:33:04,922 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: The job-conf file on the remote FS is /user/root/.staging/job_1409584998239_0001/job.xml
2014-09-01 17:33:04,930 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: Adding #0 tokens and #1 secret keys for NM use for launching container
2014-09-01 17:33:04,930 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: Size of containertokens_dob is 1
2014-09-01 17:33:04,930 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: Putting shuffle token in serviceData
2014-09-01 17:33:04,954 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000000_0 TaskAttempt Transitioned from UNASSIGNED to ASSIGNED
2014-09-01 17:33:04,957 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved centos5.local to /default-rack
2014-09-01 17:33:04,957 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000001_0 TaskAttempt Transitioned from UNASSIGNED to ASSIGNED
2014-09-01 17:33:04,959 INFO [ContainerLauncher #0] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Processing the event EventType: CONTAINER_REMOTE_LAUNCH for container container_1409584998239_0001_01_000002 taskAttempt attempt_1409584998239_0001_m_000000_0
2014-09-01 17:33:04,961 INFO [ContainerLauncher #0] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Launching attempt_1409584998239_0001_m_000000_0
2014-09-01 17:33:04,961 INFO [ContainerLauncher #1] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Processing the event EventType: CONTAINER_REMOTE_LAUNCH for container container_1409584998239_0001_01_000003 taskAttempt attempt_1409584998239_0001_m_000001_0
2014-09-01 17:33:04,964 INFO [ContainerLauncher #1] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Launching attempt_1409584998239_0001_m_000001_0
2014-09-01 17:33:04,965 INFO [ContainerLauncher #0] org.apache.hadoop.yarn.client.api.impl.ContainerManagementProtocolProxy: Opening proxy : centos4.local:45454
2014-09-01 17:33:04,984 INFO [ContainerLauncher #1] org.apache.hadoop.yarn.client.api.impl.ContainerManagementProtocolProxy: Opening proxy : centos5.local:45454
2014-09-01 17:33:05,373 INFO [ContainerLauncher #0] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Shuffle port returned by ContainerManager for attempt_1409584998239_0001_m_000000_0 : 13562
2014-09-01 17:33:05,374 INFO [ContainerLauncher #1] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Shuffle port returned by ContainerManager for attempt_1409584998239_0001_m_000001_0 : 13562
2014-09-01 17:33:05,375 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: TaskAttempt: [attempt_1409584998239_0001_m_000000_0] using containerId: [container_1409584998239_0001_01_000002 on NM: [centos4.local:45454]
2014-09-01 17:33:05,378 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000000_0 TaskAttempt Transitioned from ASSIGNED to RUNNING
2014-09-01 17:33:05,378 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: TaskAttempt: [attempt_1409584998239_0001_m_000001_0] using containerId: [container_1409584998239_0001_01_000003 on NM: [centos5.local:45454]
2014-09-01 17:33:05,379 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000001_0 TaskAttempt Transitioned from ASSIGNED to RUNNING
2014-09-01 17:33:05,380 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskImpl: task_1409584998239_0001_m_000000 Task Transitioned from SCHEDULED to RUNNING
2014-09-01 17:33:05,381 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskImpl: task_1409584998239_0001_m_000001 Task Transitioned from SCHEDULED to RUNNING
2014-09-01 17:33:05,857 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerRequestor: getResources() for application_1409584998239_0001: ask=5 release= 0 newContainers=0 finishedContainers=0 resourcelimit=<memory:0, vCores:-2> knownNMs=3
2014-09-01 17:33:10,046 INFO [Socket Reader #1 for port 55313] SecurityLogger.org.apache.hadoop.ipc.Server: Auth successful for job_1409584998239_0001 (auth:SIMPLE)
2014-09-01 17:33:10,101 INFO [IPC Server handler 0 on 55313] org.apache.hadoop.mapred.TaskAttemptListenerImpl: JVM with ID : jvm_1409584998239_0001_m_000003 asked for a task
2014-09-01 17:33:10,101 INFO [IPC Server handler 0 on 55313] org.apache.hadoop.mapred.TaskAttemptListenerImpl: JVM with ID: jvm_1409584998239_0001_m_000003 given task: attempt_1409584998239_0001_m_000001_0
2014-09-01 17:33:10,197 INFO [Socket Reader #1 for port 55313] SecurityLogger.org.apache.hadoop.ipc.Server: Auth successful for job_1409584998239_0001 (auth:SIMPLE)
2014-09-01 17:33:10,240 INFO [IPC Server handler 0 on 55313] org.apache.hadoop.mapred.TaskAttemptListenerImpl: JVM with ID : jvm_1409584998239_0001_m_000002 asked for a task
2014-09-01 17:33:10,240 INFO [IPC Server handler 0 on 55313] org.apache.hadoop.mapred.TaskAttemptListenerImpl: JVM with ID: jvm_1409584998239_0001_m_000002 given task: attempt_1409584998239_0001_m_000000_0
2014-09-01 17:33:12,872 FATAL [IPC Server handler 1 on 55313] org.apache.hadoop.mapred.TaskAttemptListenerImpl: Task: attempt_1409584998239_0001_m_000001_0 - exited : Java heap space
2014-09-01 17:33:12,872 INFO [IPC Server handler 1 on 55313] org.apache.hadoop.mapred.TaskAttemptListenerImpl: Diagnostics report from attempt_1409584998239_0001_m_000001_0: Error: Java heap space
2014-09-01 17:33:12,874 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: Diagnostics report from attempt_1409584998239_0001_m_000001_0: Error: Java heap space
2014-09-01 17:33:12,880 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000001_0 TaskAttempt Transitioned from RUNNING to FAIL_CONTAINER_CLEANUP
2014-09-01 17:33:12,880 INFO [ContainerLauncher #2] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Processing the event EventType: CONTAINER_REMOTE_CLEANUP for container container_1409584998239_0001_01_000003 taskAttempt attempt_1409584998239_0001_m_000001_0
2014-09-01 17:33:12,881 INFO [ContainerLauncher #2] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: KILLING attempt_1409584998239_0001_m_000001_0
2014-09-01 17:33:12,906 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000001_0 TaskAttempt Transitioned from FAIL_CONTAINER_CLEANUP to FAIL_TASK_CLEANUP
2014-09-01 17:33:12,907 INFO [CommitterEvent Processor #1] org.apache.hadoop.mapreduce.v2.app.commit.CommitterEventHandler: Processing the event EventType: TASK_ABORT
2014-09-01 17:33:12,916 WARN [CommitterEvent Processor #1] org.apache.hadoop.mapreduce.lib.output.FileOutputCommitter: Could not delete hdfs://centos2.local:8020/tmp/file4edf2e90ca28/_temporary/1/_temporary/attempt_1409584998239_0001_m_000001_0
2014-09-01 17:33:12,917 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000001_0 TaskAttempt Transitioned from FAIL_TASK_CLEANUP to FAILED
2014-09-01 17:33:12,932 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved centos5.local to /default-rack
2014-09-01 17:33:12,933 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved centos3.local to /default-rack
2014-09-01 17:33:12,933 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved centos4.local to /default-rack
2014-09-01 17:33:12,934 INFO [Thread-51] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerRequestor: 1 failures on node centos5.local
2014-09-01 17:33:12,936 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000001_1 TaskAttempt Transitioned from NEW to UNASSIGNED
2014-09-01 17:33:12,936 INFO [Thread-51] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Added attempt_1409584998239_0001_m_000001_1 to list of failed maps
2014-09-01 17:33:13,062 FATAL [IPC Server handler 2 on 55313] org.apache.hadoop.mapred.TaskAttemptListenerImpl: Task: attempt_1409584998239_0001_m_000000_0 - exited : Java heap space
2014-09-01 17:33:13,062 INFO [IPC Server handler 2 on 55313] org.apache.hadoop.mapred.TaskAttemptListenerImpl: Diagnostics report from attempt_1409584998239_0001_m_000000_0: Error: Java heap space
2014-09-01 17:33:13,063 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: Diagnostics report from attempt_1409584998239_0001_m_000000_0: Error: Java heap space
2014-09-01 17:33:13,063 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000000_0 TaskAttempt Transitioned from RUNNING to FAIL_CONTAINER_CLEANUP
2014-09-01 17:33:13,064 INFO [ContainerLauncher #3] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Processing the event EventType: CONTAINER_REMOTE_CLEANUP for container container_1409584998239_0001_01_000002 taskAttempt attempt_1409584998239_0001_m_000000_0
2014-09-01 17:33:13,064 INFO [ContainerLauncher #3] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: KILLING attempt_1409584998239_0001_m_000000_0
2014-09-01 17:33:13,081 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000000_0 TaskAttempt Transitioned from FAIL_CONTAINER_CLEANUP to FAIL_TASK_CLEANUP
2014-09-01 17:33:13,081 INFO [CommitterEvent Processor #2] org.apache.hadoop.mapreduce.v2.app.commit.CommitterEventHandler: Processing the event EventType: TASK_ABORT
2014-09-01 17:33:13,083 WARN [CommitterEvent Processor #2] org.apache.hadoop.mapreduce.lib.output.FileOutputCommitter: Could not delete hdfs://centos2.local:8020/tmp/file4edf2e90ca28/_temporary/1/_temporary/attempt_1409584998239_0001_m_000000_0
2014-09-01 17:33:13,084 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000000_0 TaskAttempt Transitioned from FAIL_TASK_CLEANUP to FAILED
2014-09-01 17:33:13,084 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved centos5.local to /default-rack
2014-09-01 17:33:13,084 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved centos3.local to /default-rack
2014-09-01 17:33:13,084 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved centos4.local to /default-rack
2014-09-01 17:33:13,086 INFO [Thread-51] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerRequestor: 1 failures on node centos4.local
2014-09-01 17:33:13,086 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000000_1 TaskAttempt Transitioned from NEW to UNASSIGNED
2014-09-01 17:33:13,086 INFO [Thread-51] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Added attempt_1409584998239_0001_m_000000_1 to list of failed maps
2014-09-01 17:33:13,876 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Before Scheduling: PendingReds:1 ScheduledMaps:2 ScheduledReds:0 AssignedMaps:2 AssignedReds:0 CompletedMaps:0 CompletedReds:0 ContAlloc:2 ContRel:0 HostLocal:2 RackLocal:0
2014-09-01 17:33:13,878 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerRequestor: getResources() for application_1409584998239_0001: ask=1 release= 0 newContainers=0 finishedContainers=0 resourcelimit=<memory:0, vCores:-2> knownNMs=3
2014-09-01 17:33:13,878 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Recalculating schedule, headroom=0
2014-09-01 17:33:13,878 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Reduce slow start threshold not met. completedMapsForReduceSlowstart 1
2014-09-01 17:33:14,888 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Received completed container container_1409584998239_0001_01_000003
2014-09-01 17:33:14,888 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: Diagnostics report from attempt_1409584998239_0001_m_000001_0: Container killed by the ApplicationMaster.
Container killed on request. Exit code is 143
Container exited with a non-zero exit code 143

2014-09-01 17:33:14,889 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Received completed container container_1409584998239_0001_01_000002
2014-09-01 17:33:14,889 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: Diagnostics report from attempt_1409584998239_0001_m_000000_0: Container killed by the ApplicationMaster.
Container killed on request. Exit code is 143
Container exited with a non-zero exit code 143

2014-09-01 17:33:14,889 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Got allocated containers 2
2014-09-01 17:33:14,889 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Assigning container Container: [ContainerId: container_1409584998239_0001_01_000004, NodeId: centos5.local:45454, NodeHttpAddress: centos5.local:8042, Resource: <memory:4096, vCores:1>, Priority: 5, Token: Token { kind: ContainerToken, service: 10.157.16.97:45454 }, ] to fast fail map
2014-09-01 17:33:14,889 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Assigned from earlierFailedMaps
2014-09-01 17:33:14,890 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved centos5.local to /default-rack
2014-09-01 17:33:14,891 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000001_1 TaskAttempt Transitioned from UNASSIGNED to ASSIGNED
2014-09-01 17:33:14,891 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Assigned container container_1409584998239_0001_01_000004 to attempt_1409584998239_0001_m_000001_1
2014-09-01 17:33:14,891 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Assigning container Container: [ContainerId: container_1409584998239_0001_01_000005, NodeId: centos4.local:45454, NodeHttpAddress: centos4.local:8042, Resource: <memory:4096, vCores:1>, Priority: 5, Token: Token { kind: ContainerToken, service: 10.157.16.96:45454 }, ] to fast fail map
2014-09-01 17:33:14,891 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Assigned from earlierFailedMaps
2014-09-01 17:33:14,892 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved centos4.local to /default-rack
2014-09-01 17:33:14,892 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000000_1 TaskAttempt Transitioned from UNASSIGNED to ASSIGNED
2014-09-01 17:33:14,898 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Assigned container container_1409584998239_0001_01_000005 to attempt_1409584998239_0001_m_000000_1
2014-09-01 17:33:14,898 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Recalculating schedule, headroom=0
2014-09-01 17:33:14,898 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Reduce slow start threshold not met. completedMapsForReduceSlowstart 1
2014-09-01 17:33:14,898 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: After Scheduling: PendingReds:1 ScheduledMaps:0 ScheduledReds:0 AssignedMaps:2 AssignedReds:0 CompletedMaps:0 CompletedReds:0 ContAlloc:4 ContRel:0 HostLocal:2 RackLocal:0
2014-09-01 17:33:14,899 INFO [ContainerLauncher #4] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Processing the event EventType: CONTAINER_REMOTE_LAUNCH for container container_1409584998239_0001_01_000004 taskAttempt attempt_1409584998239_0001_m_000001_1
2014-09-01 17:33:14,899 INFO [ContainerLauncher #4] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Launching attempt_1409584998239_0001_m_000001_1
2014-09-01 17:33:14,903 INFO [ContainerLauncher #5] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Processing the event EventType: CONTAINER_REMOTE_LAUNCH for container container_1409584998239_0001_01_000005 taskAttempt attempt_1409584998239_0001_m_000000_1
2014-09-01 17:33:14,903 INFO [ContainerLauncher #5] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Launching attempt_1409584998239_0001_m_000000_1
2014-09-01 17:33:14,912 INFO [ContainerLauncher #4] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Shuffle port returned by ContainerManager for attempt_1409584998239_0001_m_000001_1 : 13562
2014-09-01 17:33:14,913 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: TaskAttempt: [attempt_1409584998239_0001_m_000001_1] using containerId: [container_1409584998239_0001_01_000004 on NM: [centos5.local:45454]
2014-09-01 17:33:14,913 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000001_1 TaskAttempt Transitioned from ASSIGNED to RUNNING
2014-09-01 17:33:14,916 INFO [ContainerLauncher #5] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Shuffle port returned by ContainerManager for attempt_1409584998239_0001_m_000000_1 : 13562
2014-09-01 17:33:14,916 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: TaskAttempt: [attempt_1409584998239_0001_m_000000_1] using containerId: [container_1409584998239_0001_01_000005 on NM: [centos4.local:45454]
2014-09-01 17:33:14,916 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000000_1 TaskAttempt Transitioned from ASSIGNED to RUNNING
2014-09-01 17:33:15,900 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerRequestor: getResources() for application_1409584998239_0001: ask=1 release= 0 newContainers=0 finishedContainers=0 resourcelimit=<memory:0, vCores:-2> knownNMs=3
2014-09-01 17:33:17,518 INFO [Socket Reader #1 for port 55313] SecurityLogger.org.apache.hadoop.ipc.Server: Auth successful for job_1409584998239_0001 (auth:SIMPLE)
2014-09-01 17:33:17,545 INFO [Socket Reader #1 for port 55313] SecurityLogger.org.apache.hadoop.ipc.Server: Auth successful for job_1409584998239_0001 (auth:SIMPLE)
2014-09-01 17:33:17,560 INFO [IPC Server handler 1 on 55313] org.apache.hadoop.mapred.TaskAttemptListenerImpl: JVM with ID : jvm_1409584998239_0001_m_000005 asked for a task
2014-09-01 17:33:17,560 INFO [IPC Server handler 1 on 55313] org.apache.hadoop.mapred.TaskAttemptListenerImpl: JVM with ID: jvm_1409584998239_0001_m_000005 given task: attempt_1409584998239_0001_m_000000_1
2014-09-01 17:33:17,585 INFO [IPC Server handler 2 on 55313] org.apache.hadoop.mapred.TaskAttemptListenerImpl: JVM with ID : jvm_1409584998239_0001_m_000004 asked for a task
2014-09-01 17:33:17,585 INFO [IPC Server handler 2 on 55313] org.apache.hadoop.mapred.TaskAttemptListenerImpl: JVM with ID: jvm_1409584998239_0001_m_000004 given task: attempt_1409584998239_0001_m_000001_1
2014-09-01 17:33:20,336 FATAL [IPC Server handler 1 on 55313] org.apache.hadoop.mapred.TaskAttemptListenerImpl: Task: attempt_1409584998239_0001_m_000001_1 - exited : Java heap space
2014-09-01 17:33:20,336 INFO [IPC Server handler 1 on 55313] org.apache.hadoop.mapred.TaskAttemptListenerImpl: Diagnostics report from attempt_1409584998239_0001_m_000001_1: Error: Java heap space
2014-09-01 17:33:20,337 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: Diagnostics report from attempt_1409584998239_0001_m_000001_1: Error: Java heap space
2014-09-01 17:33:20,337 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000001_1 TaskAttempt Transitioned from RUNNING to FAIL_CONTAINER_CLEANUP
2014-09-01 17:33:20,338 INFO [ContainerLauncher #6] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Processing the event EventType: CONTAINER_REMOTE_CLEANUP for container container_1409584998239_0001_01_000004 taskAttempt attempt_1409584998239_0001_m_000001_1
2014-09-01 17:33:20,338 INFO [ContainerLauncher #6] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: KILLING attempt_1409584998239_0001_m_000001_1
2014-09-01 17:33:20,341 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000001_1 TaskAttempt Transitioned from FAIL_CONTAINER_CLEANUP to FAIL_TASK_CLEANUP
2014-09-01 17:33:20,341 INFO [CommitterEvent Processor #3] org.apache.hadoop.mapreduce.v2.app.commit.CommitterEventHandler: Processing the event EventType: TASK_ABORT
2014-09-01 17:33:20,343 WARN [CommitterEvent Processor #3] org.apache.hadoop.mapreduce.lib.output.FileOutputCommitter: Could not delete hdfs://centos2.local:8020/tmp/file4edf2e90ca28/_temporary/1/_temporary/attempt_1409584998239_0001_m_000001_1
2014-09-01 17:33:20,344 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000001_1 TaskAttempt Transitioned from FAIL_TASK_CLEANUP to FAILED
2014-09-01 17:33:20,344 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved centos5.local to /default-rack
2014-09-01 17:33:20,344 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved centos3.local to /default-rack
2014-09-01 17:33:20,344 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved centos4.local to /default-rack
2014-09-01 17:33:20,346 INFO [Thread-51] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerRequestor: 2 failures on node centos5.local
2014-09-01 17:33:20,346 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000001_2 TaskAttempt Transitioned from NEW to UNASSIGNED
2014-09-01 17:33:20,346 INFO [Thread-51] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Added attempt_1409584998239_0001_m_000001_2 to list of failed maps
2014-09-01 17:33:20,572 FATAL [IPC Server handler 2 on 55313] org.apache.hadoop.mapred.TaskAttemptListenerImpl: Task: attempt_1409584998239_0001_m_000000_1 - exited : Java heap space
2014-09-01 17:33:20,572 INFO [IPC Server handler 2 on 55313] org.apache.hadoop.mapred.TaskAttemptListenerImpl: Diagnostics report from attempt_1409584998239_0001_m_000000_1: Error: Java heap space
2014-09-01 17:33:20,573 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: Diagnostics report from attempt_1409584998239_0001_m_000000_1: Error: Java heap space
2014-09-01 17:33:20,575 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000000_1 TaskAttempt Transitioned from RUNNING to FAIL_CONTAINER_CLEANUP
2014-09-01 17:33:20,575 INFO [ContainerLauncher #7] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Processing the event EventType: CONTAINER_REMOTE_CLEANUP for container container_1409584998239_0001_01_000005 taskAttempt attempt_1409584998239_0001_m_000000_1
2014-09-01 17:33:20,576 INFO [ContainerLauncher #7] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: KILLING attempt_1409584998239_0001_m_000000_1
2014-09-01 17:33:20,578 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000000_1 TaskAttempt Transitioned from FAIL_CONTAINER_CLEANUP to FAIL_TASK_CLEANUP
2014-09-01 17:33:20,578 INFO [CommitterEvent Processor #4] org.apache.hadoop.mapreduce.v2.app.commit.CommitterEventHandler: Processing the event EventType: TASK_ABORT
2014-09-01 17:33:20,580 WARN [CommitterEvent Processor #4] org.apache.hadoop.mapreduce.lib.output.FileOutputCommitter: Could not delete hdfs://centos2.local:8020/tmp/file4edf2e90ca28/_temporary/1/_temporary/attempt_1409584998239_0001_m_000000_1
2014-09-01 17:33:20,580 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000000_1 TaskAttempt Transitioned from FAIL_TASK_CLEANUP to FAILED
2014-09-01 17:33:20,581 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved centos5.local to /default-rack
2014-09-01 17:33:20,581 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved centos3.local to /default-rack
2014-09-01 17:33:20,581 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved centos4.local to /default-rack
2014-09-01 17:33:20,581 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000000_2 TaskAttempt Transitioned from NEW to UNASSIGNED
2014-09-01 17:33:20,582 INFO [Thread-51] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerRequestor: 2 failures on node centos4.local
2014-09-01 17:33:20,583 INFO [Thread-51] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Added attempt_1409584998239_0001_m_000000_2 to list of failed maps
2014-09-01 17:33:20,910 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Before Scheduling: PendingReds:1 ScheduledMaps:2 ScheduledReds:0 AssignedMaps:2 AssignedReds:0 CompletedMaps:0 CompletedReds:0 ContAlloc:4 ContRel:0 HostLocal:2 RackLocal:0
2014-09-01 17:33:20,913 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerRequestor: getResources() for application_1409584998239_0001: ask=1 release= 0 newContainers=0 finishedContainers=0 resourcelimit=<memory:0, vCores:-2> knownNMs=3
2014-09-01 17:33:20,913 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Recalculating schedule, headroom=0
2014-09-01 17:33:20,913 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Reduce slow start threshold not met. completedMapsForReduceSlowstart 1
2014-09-01 17:33:21,917 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Received completed container container_1409584998239_0001_01_000004
2014-09-01 17:33:21,917 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Received completed container container_1409584998239_0001_01_000005
2014-09-01 17:33:21,917 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Got allocated containers 2
2014-09-01 17:33:21,918 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Assigning container Container: [ContainerId: container_1409584998239_0001_01_000006, NodeId: centos5.local:45454, NodeHttpAddress: centos5.local:8042, Resource: <memory:4096, vCores:1>, Priority: 5, Token: Token { kind: ContainerToken, service: 10.157.16.97:45454 }, ] to fast fail map
2014-09-01 17:33:21,918 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Assigned from earlierFailedMaps
2014-09-01 17:33:21,918 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Assigned container container_1409584998239_0001_01_000006 to attempt_1409584998239_0001_m_000001_2
2014-09-01 17:33:21,918 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Assigning container Container: [ContainerId: container_1409584998239_0001_01_000007, NodeId: centos4.local:45454, NodeHttpAddress: centos4.local:8042, Resource: <memory:4096, vCores:1>, Priority: 5, Token: Token { kind: ContainerToken, service: 10.157.16.96:45454 }, ] to fast fail map
2014-09-01 17:33:21,918 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: Diagnostics report from attempt_1409584998239_0001_m_000001_1: Container killed by the ApplicationMaster.
Container killed on request. Exit code is 143
Container exited with a non-zero exit code 143

2014-09-01 17:33:21,918 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: Diagnostics report from attempt_1409584998239_0001_m_000000_1: Container killed by the ApplicationMaster.
Container killed on request. Exit code is 143
Container exited with a non-zero exit code 143

2014-09-01 17:33:21,919 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved centos5.local to /default-rack
2014-09-01 17:33:21,919 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000001_2 TaskAttempt Transitioned from UNASSIGNED to ASSIGNED
2014-09-01 17:33:21,920 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Assigned from earlierFailedMaps
2014-09-01 17:33:21,921 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Assigned container container_1409584998239_0001_01_000007 to attempt_1409584998239_0001_m_000000_2
2014-09-01 17:33:21,921 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Recalculating schedule, headroom=0
2014-09-01 17:33:21,921 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Reduce slow start threshold not met. completedMapsForReduceSlowstart 1
2014-09-01 17:33:21,921 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: After Scheduling: PendingReds:1 ScheduledMaps:0 ScheduledReds:0 AssignedMaps:2 AssignedReds:0 CompletedMaps:0 CompletedReds:0 ContAlloc:6 ContRel:0 HostLocal:2 RackLocal:0
2014-09-01 17:33:21,921 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved centos4.local to /default-rack
2014-09-01 17:33:21,922 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000000_2 TaskAttempt Transitioned from UNASSIGNED to ASSIGNED
2014-09-01 17:33:21,922 INFO [ContainerLauncher #8] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Processing the event EventType: CONTAINER_REMOTE_LAUNCH for container container_1409584998239_0001_01_000006 taskAttempt attempt_1409584998239_0001_m_000001_2
2014-09-01 17:33:21,922 INFO [ContainerLauncher #8] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Launching attempt_1409584998239_0001_m_000001_2
2014-09-01 17:33:21,925 INFO [ContainerLauncher #9] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Processing the event EventType: CONTAINER_REMOTE_LAUNCH for container container_1409584998239_0001_01_000007 taskAttempt attempt_1409584998239_0001_m_000000_2
2014-09-01 17:33:21,925 INFO [ContainerLauncher #9] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Launching attempt_1409584998239_0001_m_000000_2
2014-09-01 17:33:21,934 INFO [ContainerLauncher #8] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Shuffle port returned by ContainerManager for attempt_1409584998239_0001_m_000001_2 : 13562
2014-09-01 17:33:21,934 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: TaskAttempt: [attempt_1409584998239_0001_m_000001_2] using containerId: [container_1409584998239_0001_01_000006 on NM: [centos5.local:45454]
2014-09-01 17:33:21,935 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000001_2 TaskAttempt Transitioned from ASSIGNED to RUNNING
2014-09-01 17:33:21,936 INFO [ContainerLauncher #9] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Shuffle port returned by ContainerManager for attempt_1409584998239_0001_m_000000_2 : 13562
2014-09-01 17:33:21,936 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: TaskAttempt: [attempt_1409584998239_0001_m_000000_2] using containerId: [container_1409584998239_0001_01_000007 on NM: [centos4.local:45454]
2014-09-01 17:33:21,936 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000000_2 TaskAttempt Transitioned from ASSIGNED to RUNNING
2014-09-01 17:33:22,924 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerRequestor: getResources() for application_1409584998239_0001: ask=1 release= 0 newContainers=0 finishedContainers=0 resourcelimit=<memory:0, vCores:-2> knownNMs=3
2014-09-01 17:33:24,578 INFO [Socket Reader #1 for port 55313] SecurityLogger.org.apache.hadoop.ipc.Server: Auth successful for job_1409584998239_0001 (auth:SIMPLE)
2014-09-01 17:33:24,581 INFO [Socket Reader #1 for port 55313] SecurityLogger.org.apache.hadoop.ipc.Server: Auth successful for job_1409584998239_0001 (auth:SIMPLE)
2014-09-01 17:33:24,622 INFO [IPC Server handler 3 on 55313] org.apache.hadoop.mapred.TaskAttemptListenerImpl: JVM with ID : jvm_1409584998239_0001_m_000006 asked for a task
2014-09-01 17:33:24,622 INFO [IPC Server handler 3 on 55313] org.apache.hadoop.mapred.TaskAttemptListenerImpl: JVM with ID: jvm_1409584998239_0001_m_000006 given task: attempt_1409584998239_0001_m_000001_2
2014-09-01 17:33:24,623 INFO [IPC Server handler 4 on 55313] org.apache.hadoop.mapred.TaskAttemptListenerImpl: JVM with ID : jvm_1409584998239_0001_m_000007 asked for a task
2014-09-01 17:33:24,623 INFO [IPC Server handler 4 on 55313] org.apache.hadoop.mapred.TaskAttemptListenerImpl: JVM with ID: jvm_1409584998239_0001_m_000007 given task: attempt_1409584998239_0001_m_000000_2
2014-09-01 17:33:27,405 FATAL [IPC Server handler 2 on 55313] org.apache.hadoop.mapred.TaskAttemptListenerImpl: Task: attempt_1409584998239_0001_m_000001_2 - exited : Java heap space
2014-09-01 17:33:27,405 INFO [IPC Server handler 2 on 55313] org.apache.hadoop.mapred.TaskAttemptListenerImpl: Diagnostics report from attempt_1409584998239_0001_m_000001_2: Error: Java heap space
2014-09-01 17:33:27,407 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: Diagnostics report from attempt_1409584998239_0001_m_000001_2: Error: Java heap space
2014-09-01 17:33:27,407 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000001_2 TaskAttempt Transitioned from RUNNING to FAIL_CONTAINER_CLEANUP
2014-09-01 17:33:27,407 INFO [ContainerLauncher #1] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Processing the event EventType: CONTAINER_REMOTE_CLEANUP for container container_1409584998239_0001_01_000006 taskAttempt attempt_1409584998239_0001_m_000001_2
2014-09-01 17:33:27,408 INFO [ContainerLauncher #1] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: KILLING attempt_1409584998239_0001_m_000001_2
2014-09-01 17:33:27,410 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000001_2 TaskAttempt Transitioned from FAIL_CONTAINER_CLEANUP to FAIL_TASK_CLEANUP
2014-09-01 17:33:27,410 INFO [CommitterEvent Processor #0] org.apache.hadoop.mapreduce.v2.app.commit.CommitterEventHandler: Processing the event EventType: TASK_ABORT
2014-09-01 17:33:27,412 WARN [CommitterEvent Processor #0] org.apache.hadoop.mapreduce.lib.output.FileOutputCommitter: Could not delete hdfs://centos2.local:8020/tmp/file4edf2e90ca28/_temporary/1/_temporary/attempt_1409584998239_0001_m_000001_2
2014-09-01 17:33:27,412 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000001_2 TaskAttempt Transitioned from FAIL_TASK_CLEANUP to FAILED
2014-09-01 17:33:27,414 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved centos5.local to /default-rack
2014-09-01 17:33:27,414 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved centos3.local to /default-rack
2014-09-01 17:33:27,414 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved centos4.local to /default-rack
2014-09-01 17:33:27,415 INFO [Thread-51] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerRequestor: 3 failures on node centos5.local
2014-09-01 17:33:27,415 INFO [Thread-51] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerRequestor: Blacklisted host centos5.local
2014-09-01 17:33:27,415 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000001_3 TaskAttempt Transitioned from NEW to UNASSIGNED
2014-09-01 17:33:27,416 INFO [Thread-51] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Added attempt_1409584998239_0001_m_000001_3 to list of failed maps
2014-09-01 17:33:27,447 FATAL [IPC Server handler 3 on 55313] org.apache.hadoop.mapred.TaskAttemptListenerImpl: Task: attempt_1409584998239_0001_m_000000_2 - exited : Java heap space
2014-09-01 17:33:27,448 INFO [IPC Server handler 3 on 55313] org.apache.hadoop.mapred.TaskAttemptListenerImpl: Diagnostics report from attempt_1409584998239_0001_m_000000_2: Error: Java heap space
2014-09-01 17:33:27,449 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: Diagnostics report from attempt_1409584998239_0001_m_000000_2: Error: Java heap space
2014-09-01 17:33:27,450 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000000_2 TaskAttempt Transitioned from RUNNING to FAIL_CONTAINER_CLEANUP
2014-09-01 17:33:27,450 INFO [ContainerLauncher #0] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Processing the event EventType: CONTAINER_REMOTE_CLEANUP for container container_1409584998239_0001_01_000007 taskAttempt attempt_1409584998239_0001_m_000000_2
2014-09-01 17:33:27,450 INFO [ContainerLauncher #0] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: KILLING attempt_1409584998239_0001_m_000000_2
2014-09-01 17:33:27,452 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000000_2 TaskAttempt Transitioned from FAIL_CONTAINER_CLEANUP to FAIL_TASK_CLEANUP
2014-09-01 17:33:27,452 INFO [CommitterEvent Processor #1] org.apache.hadoop.mapreduce.v2.app.commit.CommitterEventHandler: Processing the event EventType: TASK_ABORT
2014-09-01 17:33:27,454 WARN [CommitterEvent Processor #1] org.apache.hadoop.mapreduce.lib.output.FileOutputCommitter: Could not delete hdfs://centos2.local:8020/tmp/file4edf2e90ca28/_temporary/1/_temporary/attempt_1409584998239_0001_m_000000_2
2014-09-01 17:33:27,455 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000000_2 TaskAttempt Transitioned from FAIL_TASK_CLEANUP to FAILED
2014-09-01 17:33:27,456 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved centos5.local to /default-rack
2014-09-01 17:33:27,457 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved centos3.local to /default-rack
2014-09-01 17:33:27,457 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved centos4.local to /default-rack
2014-09-01 17:33:27,457 INFO [Thread-51] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerRequestor: 3 failures on node centos4.local
2014-09-01 17:33:27,457 INFO [Thread-51] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerRequestor: Blacklisted host centos4.local
2014-09-01 17:33:27,458 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000000_3 TaskAttempt Transitioned from NEW to UNASSIGNED
2014-09-01 17:33:27,458 INFO [Thread-51] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Added attempt_1409584998239_0001_m_000000_3 to list of failed maps
2014-09-01 17:33:27,933 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Before Scheduling: PendingReds:1 ScheduledMaps:2 ScheduledReds:0 AssignedMaps:2 AssignedReds:0 CompletedMaps:0 CompletedReds:0 ContAlloc:6 ContRel:0 HostLocal:2 RackLocal:0
2014-09-01 17:33:27,936 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerRequestor: getResources() for application_1409584998239_0001: ask=1 release= 0 newContainers=0 finishedContainers=0 resourcelimit=<memory:0, vCores:-2> knownNMs=3
2014-09-01 17:33:27,936 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerRequestor: Update the blacklist for application_1409584998239_0001: blacklistAdditions=2 blacklistRemovals=0
2014-09-01 17:33:27,936 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerRequestor: Ignore blacklisting set to true. Known: 3, Blacklisted: 2, 66%
2014-09-01 17:33:27,936 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Recalculating schedule, headroom=0
2014-09-01 17:33:27,936 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Reduce slow start threshold not met. completedMapsForReduceSlowstart 1
2014-09-01 17:33:28,938 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerRequestor: Update the blacklist for application_1409584998239_0001: blacklistAdditions=0 blacklistRemovals=2
2014-09-01 17:33:28,939 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Received completed container container_1409584998239_0001_01_000006
2014-09-01 17:33:28,939 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Received completed container container_1409584998239_0001_01_000007
2014-09-01 17:33:28,939 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Ramping down all scheduled reduces:0
2014-09-01 17:33:28,939 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Going to preempt 0
2014-09-01 17:33:28,940 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: Diagnostics report from attempt_1409584998239_0001_m_000001_2: Container killed by the ApplicationMaster.
Container killed on request. Exit code is 143
Container exited with a non-zero exit code 143

2014-09-01 17:33:28,940 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: Diagnostics report from attempt_1409584998239_0001_m_000000_2: Container killed by the ApplicationMaster.
Container killed on request. Exit code is 143
Container exited with a non-zero exit code 143

2014-09-01 17:33:28,940 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Recalculating schedule, headroom=0
2014-09-01 17:33:28,940 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Reduce slow start threshold not met. completedMapsForReduceSlowstart 1
2014-09-01 17:33:28,940 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: After Scheduling: PendingReds:1 ScheduledMaps:2 ScheduledReds:0 AssignedMaps:0 AssignedReds:0 CompletedMaps:0 CompletedReds:0 ContAlloc:6 ContRel:0 HostLocal:2 RackLocal:0
2014-09-01 17:33:29,944 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Got allocated containers 2
2014-09-01 17:33:29,945 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Assigning container Container: [ContainerId: container_1409584998239_0001_01_000008, NodeId: centos5.local:45454, NodeHttpAddress: centos5.local:8042, Resource: <memory:4096, vCores:1>, Priority: 5, Token: Token { kind: ContainerToken, service: 10.157.16.97:45454 }, ] to fast fail map
2014-09-01 17:33:29,945 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Assigned from earlierFailedMaps
2014-09-01 17:33:29,945 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Assigned container container_1409584998239_0001_01_000008 to attempt_1409584998239_0001_m_000001_3
2014-09-01 17:33:29,945 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Assigning container Container: [ContainerId: container_1409584998239_0001_01_000009, NodeId: centos4.local:45454, NodeHttpAddress: centos4.local:8042, Resource: <memory:4096, vCores:1>, Priority: 5, Token: Token { kind: ContainerToken, service: 10.157.16.96:45454 }, ] to fast fail map
2014-09-01 17:33:29,945 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Assigned from earlierFailedMaps
2014-09-01 17:33:29,945 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Assigned container container_1409584998239_0001_01_000009 to attempt_1409584998239_0001_m_000000_3
2014-09-01 17:33:29,945 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Recalculating schedule, headroom=0
2014-09-01 17:33:29,945 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Reduce slow start threshold not met. completedMapsForReduceSlowstart 1
2014-09-01 17:33:29,945 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: After Scheduling: PendingReds:1 ScheduledMaps:0 ScheduledReds:0 AssignedMaps:2 AssignedReds:0 CompletedMaps:0 CompletedReds:0 ContAlloc:8 ContRel:0 HostLocal:2 RackLocal:0
2014-09-01 17:33:29,946 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved centos5.local to /default-rack
2014-09-01 17:33:29,946 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000001_3 TaskAttempt Transitioned from UNASSIGNED to ASSIGNED
2014-09-01 17:33:29,947 INFO [AsyncDispatcher event handler] org.apache.hadoop.yarn.util.RackResolver: Resolved centos4.local to /default-rack
2014-09-01 17:33:29,947 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000000_3 TaskAttempt Transitioned from UNASSIGNED to ASSIGNED
2014-09-01 17:33:29,947 INFO [ContainerLauncher #2] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Processing the event EventType: CONTAINER_REMOTE_LAUNCH for container container_1409584998239_0001_01_000008 taskAttempt attempt_1409584998239_0001_m_000001_3
2014-09-01 17:33:29,947 INFO [ContainerLauncher #2] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Launching attempt_1409584998239_0001_m_000001_3
2014-09-01 17:33:29,949 INFO [ContainerLauncher #3] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Processing the event EventType: CONTAINER_REMOTE_LAUNCH for container container_1409584998239_0001_01_000009 taskAttempt attempt_1409584998239_0001_m_000000_3
2014-09-01 17:33:29,949 INFO [ContainerLauncher #3] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Launching attempt_1409584998239_0001_m_000000_3
2014-09-01 17:33:29,954 INFO [ContainerLauncher #3] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Shuffle port returned by ContainerManager for attempt_1409584998239_0001_m_000000_3 : 13562
2014-09-01 17:33:29,955 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: TaskAttempt: [attempt_1409584998239_0001_m_000000_3] using containerId: [container_1409584998239_0001_01_000009 on NM: [centos4.local:45454]
2014-09-01 17:33:29,955 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000000_3 TaskAttempt Transitioned from ASSIGNED to RUNNING
2014-09-01 17:33:29,962 INFO [ContainerLauncher #2] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Shuffle port returned by ContainerManager for attempt_1409584998239_0001_m_000001_3 : 13562
2014-09-01 17:33:29,962 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: TaskAttempt: [attempt_1409584998239_0001_m_000001_3] using containerId: [container_1409584998239_0001_01_000008 on NM: [centos5.local:45454]
2014-09-01 17:33:29,962 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000001_3 TaskAttempt Transitioned from ASSIGNED to RUNNING
2014-09-01 17:33:30,948 INFO [RMCommunicator Allocator] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerRequestor: getResources() for application_1409584998239_0001: ask=1 release= 0 newContainers=0 finishedContainers=0 resourcelimit=<memory:0, vCores:-2> knownNMs=3
2014-09-01 17:33:32,567 INFO [Socket Reader #1 for port 55313] SecurityLogger.org.apache.hadoop.ipc.Server: Auth successful for job_1409584998239_0001 (auth:SIMPLE)
2014-09-01 17:33:32,590 INFO [Socket Reader #1 for port 55313] SecurityLogger.org.apache.hadoop.ipc.Server: Auth successful for job_1409584998239_0001 (auth:SIMPLE)
2014-09-01 17:33:32,609 INFO [IPC Server handler 4 on 55313] org.apache.hadoop.mapred.TaskAttemptListenerImpl: JVM with ID : jvm_1409584998239_0001_m_000009 asked for a task
2014-09-01 17:33:32,609 INFO [IPC Server handler 4 on 55313] org.apache.hadoop.mapred.TaskAttemptListenerImpl: JVM with ID: jvm_1409584998239_0001_m_000009 given task: attempt_1409584998239_0001_m_000000_3
2014-09-01 17:33:32,637 INFO [IPC Server handler 5 on 55313] org.apache.hadoop.mapred.TaskAttemptListenerImpl: JVM with ID : jvm_1409584998239_0001_m_000008 asked for a task
2014-09-01 17:33:32,637 INFO [IPC Server handler 5 on 55313] org.apache.hadoop.mapred.TaskAttemptListenerImpl: JVM with ID: jvm_1409584998239_0001_m_000008 given task: attempt_1409584998239_0001_m_000001_3
2014-09-01 17:33:35,345 FATAL [IPC Server handler 2 on 55313] org.apache.hadoop.mapred.TaskAttemptListenerImpl: Task: attempt_1409584998239_0001_m_000000_3 - exited : Java heap space
2014-09-01 17:33:35,346 INFO [IPC Server handler 2 on 55313] org.apache.hadoop.mapred.TaskAttemptListenerImpl: Diagnostics report from attempt_1409584998239_0001_m_000000_3: Error: Java heap space
2014-09-01 17:33:35,347 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: Diagnostics report from attempt_1409584998239_0001_m_000000_3: Error: Java heap space
2014-09-01 17:33:35,348 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000000_3 TaskAttempt Transitioned from RUNNING to FAIL_CONTAINER_CLEANUP
2014-09-01 17:33:35,348 INFO [ContainerLauncher #4] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Processing the event EventType: CONTAINER_REMOTE_CLEANUP for container container_1409584998239_0001_01_000009 taskAttempt attempt_1409584998239_0001_m_000000_3
2014-09-01 17:33:35,348 INFO [ContainerLauncher #4] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: KILLING attempt_1409584998239_0001_m_000000_3
2014-09-01 17:33:35,350 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000000_3 TaskAttempt Transitioned from FAIL_CONTAINER_CLEANUP to FAIL_TASK_CLEANUP
2014-09-01 17:33:35,350 INFO [CommitterEvent Processor #2] org.apache.hadoop.mapreduce.v2.app.commit.CommitterEventHandler: Processing the event EventType: TASK_ABORT
2014-09-01 17:33:35,352 WARN [CommitterEvent Processor #2] org.apache.hadoop.mapreduce.lib.output.FileOutputCommitter: Could not delete hdfs://centos2.local:8020/tmp/file4edf2e90ca28/_temporary/1/_temporary/attempt_1409584998239_0001_m_000000_3
2014-09-01 17:33:35,352 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000000_3 TaskAttempt Transitioned from FAIL_TASK_CLEANUP to FAILED
2014-09-01 17:33:35,356 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskImpl: task_1409584998239_0001_m_000000 Task Transitioned from RUNNING to FAILED
2014-09-01 17:33:35,359 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.JobImpl: Num completed Tasks: 1
2014-09-01 17:33:35,360 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.JobImpl: Job failed as tasks failed. failedMaps:1 failedReduces:0
2014-09-01 17:33:35,361 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.JobImpl: job_1409584998239_0001Job Transitioned from RUNNING to FAIL_WAIT
2014-09-01 17:33:35,361 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskImpl: task_1409584998239_0001_m_000001 Task Transitioned from RUNNING to KILL_WAIT
2014-09-01 17:33:35,361 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskImpl: task_1409584998239_0001_r_000000 Task Transitioned from SCHEDULED to KILL_WAIT
2014-09-01 17:33:35,361 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000001_3 TaskAttempt Transitioned from RUNNING to KILL_CONTAINER_CLEANUP
2014-09-01 17:33:35,362 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_r_000000_0 TaskAttempt Transitioned from UNASSIGNED to KILLED
2014-09-01 17:33:35,362 INFO [ContainerLauncher #5] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: Processing the event EventType: CONTAINER_REMOTE_CLEANUP for container container_1409584998239_0001_01_000008 taskAttempt attempt_1409584998239_0001_m_000001_3
2014-09-01 17:33:35,363 INFO [ContainerLauncher #5] org.apache.hadoop.mapreduce.v2.app.launcher.ContainerLauncherImpl: KILLING attempt_1409584998239_0001_m_000001_3
2014-09-01 17:33:35,363 INFO [Thread-51] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Processing the event EventType: CONTAINER_DEALLOCATE
2014-09-01 17:33:35,363 ERROR [Thread-51] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Could not deallocate container for task attemptId attempt_1409584998239_0001_r_000000_0
2014-09-01 17:33:35,364 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskImpl: task_1409584998239_0001_r_000000 Task Transitioned from KILL_WAIT to KILLED
2014-09-01 17:33:35,368 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000001_3 TaskAttempt Transitioned from KILL_CONTAINER_CLEANUP to KILL_TASK_CLEANUP
2014-09-01 17:33:35,369 INFO [CommitterEvent Processor #3] org.apache.hadoop.mapreduce.v2.app.commit.CommitterEventHandler: Processing the event EventType: TASK_ABORT
2014-09-01 17:33:35,372 WARN [CommitterEvent Processor #3] org.apache.hadoop.mapreduce.lib.output.FileOutputCommitter: Could not delete hdfs://centos2.local:8020/tmp/file4edf2e90ca28/_temporary/1/_temporary/attempt_1409584998239_0001_m_000001_3
2014-09-01 17:33:35,372 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: attempt_1409584998239_0001_m_000001_3 TaskAttempt Transitioned from KILL_TASK_CLEANUP to KILLED
2014-09-01 17:33:35,374 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskImpl: task_1409584998239_0001_m_000001 Task Transitioned from KILL_WAIT to KILLED
2014-09-01 17:33:35,377 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.JobImpl: job_1409584998239_0001Job Transitioned from FAIL_WAIT to FAIL_ABORT
2014-09-01 17:33:35,377 INFO [CommitterEvent Processor #4] org.apache.hadoop.mapreduce.v2.app.commit.CommitterEventHandler: Processing the event EventType: JOB_ABORT
2014-09-01 17:33:35,386 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.JobImpl: job_1409584998239_0001Job Transitioned from FAIL_ABORT to FAILED
2014-09-01 17:33:35,387 INFO [Thread-63] org.apache.hadoop.mapreduce.v2.app.MRAppMaster: We are finishing cleanly so this is the last retry
2014-09-01 17:33:35,387 INFO [Thread-63] org.apache.hadoop.mapreduce.v2.app.MRAppMaster: Notify RMCommunicator isAMLastRetry: true
2014-09-01 17:33:35,387 INFO [Thread-63] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: RMCommunicator notified that shouldUnregistered is: true
2014-09-01 17:33:35,387 INFO [Thread-63] org.apache.hadoop.mapreduce.v2.app.MRAppMaster: Notify JHEH isAMLastRetry: true
2014-09-01 17:33:35,387 INFO [Thread-63] org.apache.hadoop.mapreduce.jobhistory.JobHistoryEventHandler: JobHistoryEventHandler notified that forceJobCompletion is true
2014-09-01 17:33:35,387 INFO [Thread-63] org.apache.hadoop.mapreduce.v2.app.MRAppMaster: Calling stop for all the services
2014-09-01 17:33:35,389 INFO [Thread-63] org.apache.hadoop.mapreduce.jobhistory.JobHistoryEventHandler: Stopping JobHistoryEventHandler. Size of the outstanding queue size is 0
2014-09-01 17:33:35,461 INFO [eventHandlingThread] org.apache.hadoop.mapreduce.jobhistory.JobHistoryEventHandler: Copying hdfs://centos2.local:8020/user/root/.staging/job_1409584998239_0001/job_1409584998239_0001_1.jhist to hdfs://centos2.local:8020/mr-history/tmp/root/job_1409584998239_0001-1409585576222-root-streamjob7414054980203160633.jar-1409585615360-0-0-FAILED-default-1409585582692.jhist_tmp
2014-09-01 17:33:35,485 FATAL [IPC Server handler 4 on 55313] org.apache.hadoop.mapred.TaskAttemptListenerImpl: Task: attempt_1409584998239_0001_m_000001_3 - exited : Java heap space
2014-09-01 17:33:35,485 INFO [IPC Server handler 4 on 55313] org.apache.hadoop.mapred.TaskAttemptListenerImpl: Diagnostics report from attempt_1409584998239_0001_m_000001_3: Error: Java heap space
2014-09-01 17:33:35,486 INFO [AsyncDispatcher event handler] org.apache.hadoop.mapreduce.v2.app.job.impl.TaskAttemptImpl: Diagnostics report from attempt_1409584998239_0001_m_000001_3: Error: Java heap space
2014-09-01 17:33:35,505 INFO [eventHandlingThread] org.apache.hadoop.mapreduce.jobhistory.JobHistoryEventHandler: Copied to done location: hdfs://centos2.local:8020/mr-history/tmp/root/job_1409584998239_0001-1409585576222-root-streamjob7414054980203160633.jar-1409585615360-0-0-FAILED-default-1409585582692.jhist_tmp
2014-09-01 17:33:35,508 INFO [eventHandlingThread] org.apache.hadoop.mapreduce.jobhistory.JobHistoryEventHandler: Copying hdfs://centos2.local:8020/user/root/.staging/job_1409584998239_0001/job_1409584998239_0001_1_conf.xml to hdfs://centos2.local:8020/mr-history/tmp/root/job_1409584998239_0001_conf.xml_tmp
2014-09-01 17:33:35,539 INFO [eventHandlingThread] org.apache.hadoop.mapreduce.jobhistory.JobHistoryEventHandler: Copied to done location: hdfs://centos2.local:8020/mr-history/tmp/root/job_1409584998239_0001_conf.xml_tmp
2014-09-01 17:33:35,550 INFO [eventHandlingThread] org.apache.hadoop.mapreduce.jobhistory.JobHistoryEventHandler: Moved tmp to done: hdfs://centos2.local:8020/mr-history/tmp/root/job_1409584998239_0001.summary_tmp to hdfs://centos2.local:8020/mr-history/tmp/root/job_1409584998239_0001.summary
2014-09-01 17:33:35,552 INFO [eventHandlingThread] org.apache.hadoop.mapreduce.jobhistory.JobHistoryEventHandler: Moved tmp to done: hdfs://centos2.local:8020/mr-history/tmp/root/job_1409584998239_0001_conf.xml_tmp to hdfs://centos2.local:8020/mr-history/tmp/root/job_1409584998239_0001_conf.xml
2014-09-01 17:33:35,557 INFO [eventHandlingThread] org.apache.hadoop.mapreduce.jobhistory.JobHistoryEventHandler: Moved tmp to done: hdfs://centos2.local:8020/mr-history/tmp/root/job_1409584998239_0001-1409585576222-root-streamjob7414054980203160633.jar-1409585615360-0-0-FAILED-default-1409585582692.jhist_tmp to hdfs://centos2.local:8020/mr-history/tmp/root/job_1409584998239_0001-1409585576222-root-streamjob7414054980203160633.jar-1409585615360-0-0-FAILED-default-1409585582692.jhist
2014-09-01 17:33:35,558 INFO [Thread-63] org.apache.hadoop.mapreduce.jobhistory.JobHistoryEventHandler: Stopped JobHistoryEventHandler. super.stop()
2014-09-01 17:33:35,560 INFO [Thread-63] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Setting job diagnostics to Task failed task_1409584998239_0001_m_000000
Job failed as tasks failed. failedMaps:1 failedReduces:0

2014-09-01 17:33:35,561 INFO [Thread-63] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: History url is http://centos1.local:19888/jobhistory/job/job_1409584998239_0001
2014-09-01 17:33:35,588 INFO [Thread-63] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Waiting for application to be successfully unregistered.
2014-09-01 17:33:36,590 INFO [Thread-63] org.apache.hadoop.mapreduce.v2.app.rm.RMContainerAllocator: Final Stats: PendingReds:1 ScheduledMaps:0 ScheduledReds:0 AssignedMaps:2 AssignedReds:0 CompletedMaps:0 CompletedReds:0 ContAlloc:8 ContRel:0 HostLocal:2 RackLocal:0
2014-09-01 17:33:36,591 INFO [Thread-63] org.apache.hadoop.mapreduce.v2.app.MRAppMaster: Deleting staging directory hdfs://centos2.local:8020 /user/root/.staging/job_1409584998239_0001
2014-09-01 17:33:36,595 INFO [Thread-63] org.apache.hadoop.ipc.Server: Stopping server on 55313
2014-09-01 17:33:36,598 INFO [IPC Server listener on 55313] org.apache.hadoop.ipc.Server: Stopping IPC Server listener on 55313
2014-09-01 17:33:36,598 INFO [IPC Server Responder] org.apache.hadoop.ipc.Server: Stopping IPC Server Responder
2014-09-01 17:33:36,598 INFO [TaskHeartbeatHandler PingChecker] org.apache.hadoop.mapreduce.v2.app.TaskHeartbeatHandler: TaskHeartbeatHandler thread interrupted

