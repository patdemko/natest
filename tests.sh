#!/bin/bash
iperf_port="port #"
iperf_streams="#streams"
iperf_server="server IP"
second_server="another server IP to ping"
location="City Name"
header="Test Time,Device IP,iPerf Server,iPerf port,Download Speed,Upload Speed,rtt min,rtt avg,rtt max,rtt mdev,rtt min-G DNS,rtt avg-G DNS,rtt max-G DNS,rtt mdev-G DNS"
test_date=$(echo `date +%m-%d-%Y`)
test_time=$(echo `date +%m-%d-%Y_%H:%M`)
filename="/home/$USER/natest/data/"$location"_"$test_date".csv"
error_filename="/home/$USER/natest/data/"$location"_"$test_date"_error.csv"

#Testing Starts
public_ip=$(dig +short myip.opendns.com @resolver1.opendns.com)
down_speed_full=$(iperf3 -c $iperf_server -R -p $iperf_port -P $iperf_streams)
down_speed=$(echo "$down_speed_full"|tail -3 |grep -o -P '\S+\s+Mbits/sec'|grep -o -P '^\S+')
if [ $down_speed = ""]; then
    echo "$test_time" >> $error_filename
    echo "$down_speed_full" >> $error_filename
    echo "" >> $error_filename
    echo "" >> $error_filename
fi
up_speed_full=$(iperf3 -c $iperf_server -p $iperf_port -P $iperf_streams)
up_speed=$(echo "$up_speed_full"|tail -3|grep -o -P '\S+\s+Mbits/sec'|grep -o -P '^\S+')
if [ $up_speed = ""]; then
    echo "$test_time" >> $error_filename
    echo "$up_speed_full" >> $error_filename
    echo "" >> $error_filename
    echo "" >> $error_filename
fi
ping_results_full=$(ping $iperf_server -c 15)
ping_results=$(echo "$ping_results_full"|tail -1|grep -o -P '\S+\sms'|grep -o -P '^\S+'|tr / ,)
if [ $ping_results = ""]; then
    echo "$test_time" >> $error_filename
    echo "$ping_results_full" >> $error_filename
    echo "" >> $error_filename
    echo "" >> $error_filename
fi
gping_results_full=$(ping $second_server -c 15)
gping_results=$(echo "$gping_results_full"|tail -1|grep -o -P '\S+\sms'|grep -o -P '^\S+'|tr / ,)
if [ $gping_results = ""]; then
    echo "$test_time" >> $error_filename
    echo "$gping_results_full" >> $error_filename
    echo "" >> $error_filename
    echo "" >> $error_filename
fi
#End Tests

output=$test_time","$public_ip","$iperf_server","$iperf_port","$down_speed","$up_speed","$ping_results","$gping_results

if [ ! -f $filename ]; then
    echo "$header" >> $filename
fi

echo "$output" >> $filename
