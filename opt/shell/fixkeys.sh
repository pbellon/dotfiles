# fixes issues with strange tty shortcuts
# took from https://unix.stackexchange.com/questions/146060/how-to-disable-alt-arrow-switching-of-virtual-consoles#186016
sudo sh -c 'dumpkeys -k|grep -v Incr_Console|grep -v Decr_Console|grep -v Last_Console|loadkeys'
