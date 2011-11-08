README
======

SWG:ANH Client Installer
------------------------

The SWG:ANH Client Installer uses the [NSIS scripting language][1] to create an 
easy-to-use method of installation for the SWG:ANH Client.

Compiling
---------

To compile the client installer the base NSIS package needs to be installed 
along with the following plugins:

[MD5dll][2]

Once downloaded copy the md5dll/ANSI/md5dll.dll file to your NSIS/plugins
directory (usually found within Program Files).

[Inetc][3]

Once downloaded copy the contents of the zip file to your NSIS directory 
(usually found within Program Files).

Next, obtain the client executable files and place them within a directory
called "client_files" inside the client installer project main directory. Right 
click on the clientinstaller.nsi file and choose the Compile NSIS Script 
(Choose Compressor) option, then select the LZMA (solid) compression and hit OK.

External Links
--------------

[1]: http://nsis.sourceforge.net/
[2]: http://nsis.sourceforge.net/MD5_plugin
[3]: http://nsis.sourceforge.net/Inetc_plug-in
