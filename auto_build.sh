#!/bin/bash

jobs=$(ls /var/lib/jenkins/workspace/ | grep -v @tmp)
#jobs='PARKING_ERP_BE PARKING_ERP_FE test-pipeline'


for i in ${jobs[@]}:
do
	echo $i

	/usr/bin/git --git-dir=/var/lib/jenkins/workspace/$i/*/.git --work-tree=/var/lib/jenkins/workspace/$i/./* fetch origin dev
	status1=$(/usr/bin/git --git-dir=/var/lib/jenkins/workspace/$i/*/.git --work-tree=/var/lib/jenkins/workspace/$i/./* status | grep -o beh>

	if [[ $status1 = 'behind' ]]
		then
        		/usr/bin/ssh -l admin -p 2244 192.168.123.14 build PARKING_ERP_BE
		fi


done

#/usr/bin/git --git-dir=/var/lib/jenkins/workspace/PARKING_ERP_BE/parking_erp_java_be_v1/.git --work-tree=/var/lib/jenkins/workspace/PARKING_ERP_BE/./parking_erp_java_be_v1 fetch origin dev
#status1=$(/usr/bin/git --git-dir=/var/lib/jenkins/workspace/PARKING_ERP_BE/parking_erp_java_be_v1/.git --work-tree=/var/lib/jenkins/workspace/PARKING_ERP_BE/./parking_erp_java_be_v1 status | grep -o behind)

#if [[ $status1 = 'behind' ]]
#then
#	/usr/bin/ssh -l admin -p 2244 192.168.123.14 build PARKING_ERP_BE
#fi


#/usr/bin/git --git-dir=/var/lib/jenkins/workspace/PARKING_ERP_FE/parking_erp_angular_fe_v1/.git --work-tree=/var/lib/jenkins/workspace/PARKING_ERP_FE/./parking_erp_angular_fe_v1 fetch origin dev
#status2=$(/usr/bin/git --git-dir=/var/lib/jenkins/workspace/PARKING_ERP_FE/parking_erp_angular_fe_v1/.git --work-tree=/var/lib/jenkins/workspace/PARKING_ERP_FE/./parking_erp_angular_fe_v1 status | grep -o behind)

#if [[ $status2 = 'behind' ]]
#then
#	/usr/bin/ssh -l admin -p 2244 192.168.123.14 build PARKING_ERP_FE
#fi
