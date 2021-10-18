#Colors

 blue=$(tput setaf 4)
 green=$(tput setaf 2)
 yellow=$(tput setaf 3)
 cyan=$(tput setaf 6)
 white=$(tput setaf 7)
 red=$(tput setaf 1)
 normal=$(tput sgr0)

#Design

 column=${cyan}$(printf "|-*-|")
 fullline=${cyan}$(printf "|-*-                                                             |-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*- |-*-|")${normal}


 #Monitoring variables

 host=${red}$(uname -a | awk '{print $2}')
 archi=${green}$(uname -srvmo | grep Linux)
 pcpu=${green}$(grep -wc 'processor' "/proc/cpuinfo")
 vcpu=${green}$(nproc)
 memu=${green}$(free -m | awk 'NR==2{print $3}')
 memavail=${green}$(free -m | awk 'NR==2{print $2}')
 memp=${green}$(free -m | awk 'NR==2{memu=$3} {mema=$2} END {printf "%.2f", memu/mema *     100}')
 dskbu=${green}$(df -m | grep '/boot' | awk '{print $3}')
 dskbavail=${green}$(df -m | grep '/boot' | awk '{print $4}')
 dskbp=${green}$(df -m | grep '/boot' | awk '{dsku=$3} {dska=$4} END {printf "%.2f", dsku/  dska * 100}')
 dsklu=${green}$(df -m | grep 'LVM' | awk '{dsku+=$3} END {print dsku}')
 dsklavail=${green}$(df -m | grep 'LVM' | awk '{dska+=$4} END {print dska}')
 dsklp=${green}$(df -m | grep 'LVM' | awk '{dsku+=$3} {dska+=4} END {printf "%.2f" , dska/  dsku * 100}')
 dsktu=${green}$(df -k | grep 'tmpfs'| awk '{dsku+=$3} END {print dsku}')
 dsktavail=${green}$(df -m | grep 'tmpfs' | awk '{dska+=$4} END {print dska}')
 dsktp=${green}$(df -m | grep 'tmpfs' | awk FLOAT'{dsku+=$3} {dska+=4} END {printf "%.2f",  dsku/dska * 100}')
 dsktotu=${green}$(df -m | awk '{dsku+=$3} END {print dsku}')
 dsktotavail=${green}$(df -m | awk '{dska+=$4} END {print dska}')
 dsktotp=${green}$(df -m | awk '{dsku+=$3} {dska+=$4} END {printf "%.2f", dsku/dska *       100}')
 cpuload=${green}$(mpstat | grep all | awk '{print 100 - $13}')
 lastboot=${green}$(who -b | awk '{print $3" "$4}')
 lvmcheck=$(df | grep LVM | wc -l)
 lvmanswer=${green}$(if [ ${lvmcheck} -eq 0 ]; then echo "No"; else echo "Yes";fi)
 tcpact=${green}$(netstat -s | grep "active" | awk '{print $1" "$2" "$3}')
 tcpestab=${green}$(netstat -s | grep "established" | awk '{print $1" "$2" "$3}')
 usrlognb=${green}$(who | wc -l)
 usrlog=${green}$(who | awk '{ORS=", "}{print $1}' | sed 's/.$//' | sed 's/.$//')
 ip=${green}$(hostname -I)
 mac=${green}$(ifconfig -a | grep "ether" | awk '{print $2}')
 sudo=${green}$(grep "USER" '/var/log/sudo/sudolog' | wc -l)


 #script

printf "${fullline}\n"
 printf "${column}\t\t\t\t\t\t\t\t\t\t\t      ${column}\n"
 printf "${column}\t\t\t\t\t${red}MONITORING SCREEN\t\t\t\t      ${column}\n"
 printf "${column}\t\t\t\t\t\t\t\t\t\t\t      ${column}\n"
 printf "${column}\t\t\t\t\t       ${red}FOR\t\t\t\t\t      ${column}\n"
 printf "${column}\t\t\t\t\t\t\t\t\t\t\t      ${column}\n"
 printf "${column}\t\t\t\t           %s\t\t\t\t\t      ${column}\n" "${host}"

 printf "${column}\t\t\t\t\t\t\t\t\t\t\t      ${column}\n"
 printf "${column} ${yellow}Architecture: %s${column}\n" "${archi}"
 printf "${column} ${yellow}CPU Physical: %s\t\t\t\t\t\t\t\t\t      ${column}\n" "${pcpu}"
 printf "${column} ${yellow}vCPU: %s\t\t\t\t\t\t\t\t\t\t      ${column}\n" "${vcpu}"
 printf "${column} ${yellow}Memory usage: %s/%s MB (%s %%)\t\t\t\t\t\t\t                   ${column}\n" "${memu}" "${memavail}" "${memp}"
 printf "${column} ${yellow}Disk Usage: Boot: %s MB/%s MB (% s %%)\t\t\t\t\t\t             ${column}\n" "${dskbu}" "${dskbavail}" "${dskbp}"
 printf "${column}\t\t  ${yellow}LVM: %s MB/%s MB (%s %%)\t\t\t\t\t      ${column}\n"      "${dsklu}" "${dsklavail}" "${dsklp}"
 printf "${column}\t\t  ${yellow}tmpfs: %s kB/%s MB (%s %%)\t\t\t\t\t      ${column}\n"    "${dsktu}" "${dsktavail}" "${dsktp}"
 printf "${column}\t\t  ${yellow}Total: %s MB/%s MB (%s %%)\t\t\t\t\t      ${column}\n"    "${dsktotu}" "${dsktotavail}" "${dsktotp}"
 printf "${column} ${yellow}CPU Load: %s %%\t\t\t\t\t\t\t\t\t      ${column}\n" "${cpuload}"
 printf "${column} ${yellow}Last Boot: %s\t\t\t\t\t\t\t      ${column}\n" "${lastboot}"
 printf "${column} ${yellow}LVM Use: %s\t\t\t\t\t\t\t\t\t      ${column}\n" "${lvmanswer}"
 printf "${column} ${yellow}Connexions TCP: Active: %s\t\t\t\t\t      ${column}\n"         "${tcpact}"
 printf "${column}\t\t      ${yellow}Established: %s\t\t\t\t      ${column}\n"             "${tcpestab}"
 printf "${column} ${yellow}User log: Nb of accounts looged: %s\t\t\t\t\t\t                ${column}\n" "${usrlognb}"
 printf "${column}\t        ${yellow}Logins: %s\t\t\t\t\t\t\t      ${column}\n"            "${usrlog}"
 printf "${column} ${yellow}Network: IP: %s\t\t\t\t\t\t\t      ${column}\n" "${ip}"
 printf "${column}\t       ${yellow}MAC: %s\t\t\t\t\t\t\t      ${column}\n" "${mac}"
 printf "${column} ${yellow}Nb of sudo commands: %s commands\t\t\t\t\t\t\t                 ${column}\n" "${sudo}"
 printf "${column}\t\t\t\t\t\t\t\t\t\t\t      ${column}\n"
 printf "${fullline}\n"

