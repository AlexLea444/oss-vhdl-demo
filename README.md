## build.sh
Alex Lea

This demo program and script were created to assist others in utilizing the default oss-cad-suite build to program an UPduino. The below requirements demonstrate the steps required for me to get the programs working on my machine, but your experience may differ.
I have made some minor modifications, but the build script itself was largely copied from Tufts alumnus Lucas Polidori.

Please feel free to contact me at alexlea444@gmail.com.

>[!NOTE]
>For people coming from Lattice Radiant, note that HSOSC is replaced with SB\_HFOSC for the 48MHz internal clock. Other adjustments might also require conversion.

>[!NOTE]
>To add other files/modules, simply use these components as normal. This should build properly as long as the top module is properly named and all files use the ```.vhd``` extension.


Here are the requirements for one to use this script:

0. Requires oss-cad-suite.
1. The top module should have the name ```top```.
2. The program name should be consistent across the ```.vhd``` and ```.pcf``` file.
3. The script must be run in the same directory as the ```.vhd``` files, but the name of the directory does not matter.
4. This script uses ```.vhd``` for vhdl files, not ```.vhdl```.
5. The script should be run as ```bash build.sh [program name]```.

>[!NOTE]
>The following steps pertain to usage of iceprog on a Linux (Debian) device. If you are using macOS, different steps may be required to run iceprog on your device.
6. To improve long-term QoL, set a udev rule to allow access to the UPduino.

To verify IDs, use usb-devices. For me, this is the rule as follows:
```bash
$ cat /etc/udev/rules.d/53-lattice-ftdi.rules 
ACTION=="add", ATTR{idVendor}=="0403", ATTR{idProduct}=="6014", MODE:="666"
```

To add this udev rule, you could use:
```bash
$ echo 'ACTION=="add", ATTR{idVendor}=="0403", ATTR{idProduct}=="6014", MODE:="666"' > 53-lattice-ftdi.rules
$ sudo mv 53-lattice-ftdi.rules /etc/udev/rules.d/.
```
>[!CAUTION]
>This will overwrite a previous file called ```53-lattice-ftdi.rules``` if it exists. I hope that you are able to edit this file if you were able to construct it at some point independently.
