connect -url tcp:127.0.0.1:3121
source D:/Programlar/ZyboProjeler/DualCore/system_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zybo Z7 210351A81A96A"} -index 0
loadhw -hw D:/Programlar/ZyboProjeler/DualCore/system_hw_platform_0/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zybo Z7 210351A81A96A"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zybo Z7 210351A81A96A"} -index 0
dow D:/Programlar/ZyboProjeler/DualCore/Core0/Debug/Core0.elf
targets -set -nocase -filter {name =~ "ARM*#1" && jtag_cable_name =~ "Digilent Zybo Z7 210351A81A96A"} -index 0
dow D:/Programlar/ZyboProjeler/DualCore/Core1/Debug/Core1.elf
configparams force-mem-access 0
bpadd -addr &main
