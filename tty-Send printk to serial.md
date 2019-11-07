連結：https://stackoverflow.com/questions/36649176/send-printk-to-serial

原英：
I am trying to debug a module for the Linux kernel.
I heard that it is possible to send the console output to a serial port.
I'm running Ubuntu on vmware and want to send printk message to the host.
I have managed to set up a serial Connection and can send an echo to the host by typing echo > simething /dev/ttyS1 
But I can't figure out how to send the output on the console to ttyS1.

My main problem is that when the module/kernel crashes the last printk-messages are lost and not even displayed,
it just buffers.

翻中：
我正在嘗試去除錯Linux內核的模塊。 
我聽說是可以發送控制台輸出到串行端口。 
我在vmware上運行Ubuntu並想將printk消息發送給主機。
我有設法建立連續的連接並可以通過鍵入以下內容能夠發送一個echo給主機
echo > simething /dev/ttyS1
但是我不能了解如何將控制台上的輸出發送到ttyS1。
我的主要問題是當模塊/內核崩潰最後printk的消息丟失而且甚至不顯示，
就只是緩衝區。



原英：
Try booting your kernel with the command line 'console=ttyS1,<baud>',
where <baud> is the baud rate you configured for that port in the VM settings. 
The kernel will then use /dev/ttyS1 as the main console, 
and that's where printk will send all of its output to.

翻中：
嘗試開機你的核心與命令行'console = ttyS1，<baud>'，
哪裡是<baud>的baud rate 您在虛擬機配置了那個port。
內核將使用/ dev / ttyS1作為主控制台，
然後其所有輸出發送到printk將要去的地方。



原英：
I added GRUB_CMDLINE_LINUX="console=ttyS1,
115200n8" to /etc/default/grub and then ran update-grub and rebooted. 
However nothing is going to the serial port. 
I did check cmdline.txt to see if console=ttyS1 was added and it was. 
I dont know if the baud rate is wrong or something. 

翻中：
我加了GRUB_CMDLINE_LINUX =“ console = ttyS1,115200n8”至
/ etc / default / grub 然後運行update-grub並重新啟動。
然而沒有任何東西進入串行端口。
我確實檢查了cmdline.txt 看看是否添加了console = ttyS1。
我不知道是baud rate 錯誤還是其他原因。



原英：
On Guest Linux Kernel

$ sudo vim /etc/default/grub  
$ GRUB_CMDLINE_LINUX="console=ttyS1,115200n8 console=tty0  ignore_loglevel"
$ sudo update-grub

NOTE:- kernel parameter "ignore_loglevel" will print all kernel messages to the console. Useful for debugging.

Now Enable getty On Console ttyS1
For Upstart System

1) Create a file called /etc/init/ttyS1.conf containing the following:

# ttyS0 - getty
#
# This service maintains a getty on ttyS1 from the point the system is
# started until it is shut down again.

start on stopped rc RUNLEVEL=[12345]
stop on runlevel [!12345]

respawn
exec /sbin/getty -L 115200 ttyS1 vt102  

2) Ask upstart to start the getty

$ sudo start ttyS1  

For Systemd Systems

$ sudo systemctl enable serial-getty@ttyS1.service
$ sudo systemctl start serial-getty@ttyS1.service
$ sudo systemctl daemon-reload

翻中：
Linux Kernel的遊客

$ sudo vim /etc/default/grub  
$ GRUB_CMDLINE_LINUX="console=ttyS1,115200n8 console=tty0 ignore_loglevel"
$ sudo update-grub  

注意：
- kernel 參數“ ignore_loglevel”將打印所有內核消息到控制台。
這對於除錯很有用。

現在在控制台ttyS1上啟用getty
對於Upstart 系統

1）創建一個名為/etc/init/ttyS1.conf的文件，其中包含以下內容：

# ttyS0 - getty
#
# This service maintains a getty on ttyS1 from the point the system is
# started until it is shut down again.

start on stopped rc RUNLEVEL=[12345]
stop on runlevel [!12345]

respawn
exec /sbin/getty -L 115200 ttyS1 vt102  

2）要求upstart 去開始getty

$ sudo start ttyS1  

對於Systemd系統

$ sudo systemctl enable serial-getty@ttyS1.service
$ sudo systemctl start serial-getty@ttyS1.service
$ sudo systemctl daemon-reload
