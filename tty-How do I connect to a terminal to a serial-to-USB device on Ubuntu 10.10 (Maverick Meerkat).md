連結：https://stackoverflow.com/questions/5347962/how-do-i-connect-to-a-terminal-to-a-serial-to-usb-device-on-ubuntu-10-10-maveri

原英：
I am trying to connect minicom to a serial device that is connected via a USB-to-serial adapter.
This is a PL2303 and from everything I've read no additional drivers are required. 
The device is recognised as a PL2303.

I'm a beginner at minicom. 
Is this the correct command to execute? Or do I need to configure something?

翻中：




$ sudo minicom --device /dev/ttyUSB0
minicom: cannot open /dev/ttyUSB0: No such file or directory

$ sudo lsusb -v

Bus 002 Device 006: ID 067b:2303 Prolific Technology, Inc. PL2303 Serial Port
Device Descriptor:
  bLength                18
  bDescriptorType         1

$ tail /var/log/syslog  #then removed and attached the device.
Mar 13 23:31:49 ubuntu kernel: [807996.786805] usb 2-1: pl2303 converter now attached to ttyUSB0
Mar 13 23:34:44 ubuntu kernel: [808172.155129] usb 2-1: USB disconnect, address 7
Mar 13 23:34:44 ubuntu kernel: [808172.156321] pl2303 ttyUSB0: pl2303 converter now disconnected from ttyUSB0
Mar 13 23:34:44 ubuntu kernel: [808172.156374] pl2303 2-1:1.0: device disconnected
Mar 13 23:34:52 ubuntu kernel: [808179.497856] usb 2-1: new full speed USB device using uhci_hcd and address 8
Mar 13 23:34:52 ubuntu kernel: [808179.785845] pl2303 2-1:1.0: pl2303 converter detected
Mar 13 23:34:52 ubuntu kernel: [808179.872309] usb 2-1: pl2303 converter now attached to ttyUSB0



原英：
The output of lsusb is essentially useless here. Post the output in the system log when you plug the device in. 




