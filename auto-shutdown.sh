#!/bin/bash
TRAFF_TOTAL=900 #�ĳ��Լ���Ԥ����ȣ�������СЩ����λGB��
TRAFF_USED=$(vnstat --oneline b | awk -F';' '{print $11}')
CHANGE_TO_GB=$(expr $TRAFF_USED / 1073741824)

if [ $CHANGE_TO_GB -gt $TRAFF_TOTAL ]; then
    init 0
fi

vnstat > /root/1.txt
cat <<EOF >> /root/1.txt
------------------
#Used traffic#
------------------
EOF
echo $CHANGE_TO_GB >> /root/1.txt