#!/bin/bash

jobs=$(ls -d -1 /var/lib/jenkins/workspace/*/* | grep -v @tmp) 
#jobs=$(/usr/bin/git --git-dir=/var/lib/jenkins/workspace/$i/*/.git -c --work-tree=/var/lib/jenkins/workspace/$i/./*)
#jobs='PARKING_ERP_BE PARKING_ERP_FE test-pipeline'


for i in ${jobs[@]}
do

        Build=$(echo $i | cut -d'/' -f7- )
        echo $Build
        GIT='git --git-dir='$i'/.git --work-tree='$i''
        cd -- "$i"
        $GIT fetch
        status="$($GIT status)"
        status1=$(echo $status | grep -o behind)
        echo $status

        #/usr/bin/git -C $i/.git status
        #/usr/bin/git -C /var/lib/jenkins/workspace/$i/*/.git
        #/usr/bin/git --work-tree=/var/lib/jenkins/workspace/$i/./* status | grep -o behind

        #status1=$(/usr/bin/git --git-dir=/var/lib/jenkins/workspace/*/*/ -c --work-tree=/var/lib/jenkins/workspace/*/* -c status | grep -o behind)

        if [[ $status1 = 'behind' ]]
                then
                        Build=$(echo $i | cut -d'/' -f7- )
                        echo shoaib
                        /usr/bin/ssh -l shoaib -p 2249 192.168.122.84 build $Build
                fi


done
