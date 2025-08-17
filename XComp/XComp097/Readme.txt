
       XComp/XPack: A freeware PE32-imagefile packer/rebuilder
              (c)2007 JoKo, Version 0.97 02/12/2007


-----------------
TABLE OF CONTENTS
-----------------
1.  Welcome
     - Rebuilder functionality
     - Packer functionality
     - Packer features
2.  Archive content
3.  Installation
4.  Specifications
     - Requirements
     - Limitations
5.  Contact


----------
1. Welcome
----------
  Thank you for trying XComp/XPack.
  XComp and XPack are PE32-imagefile ('.dll' or '.exe') packer and rebuilder.
  In using the software, the user agrees to indemnify and hold harmless the
  author and software from any damages incurred, whether real or imagined.
  No guarentees are given or implied the software will run under any circumstance
  and/or on any machine.

  - Rebuilder functionality
      - strip debug data
      - strip relocations
      - strip export information
      - change MZ-stubfile
      - change file alignment
      - change imagebase
      - merge sections
  - Packer functionality
      - two compression algorithms
      - resource packing
      - loader section naming
  - Packer features
      - a missing library produce a message like 'xyz.dll not found'.
      - a runnable MZ-exe stubfile.
      - possibility to use 'in place' compression.


------------------
2. Archive content
------------------
  The eXe Compressor XComp:
      - XCompc.exe - console version
      - XCompw.exe - gui version
  and the eXe Packer XPack:
      - XPackc.exe - console version
      - XPackw.exe - gui version


---------------
3. Installation
---------------
  - Copy the files ('*.exe') into a directory of your choice.
  - To start the executables use the explorer or a console window.
  - If you like create a link in the 'SendTo' directory.


-----------------
4. Specifications
-----------------
  - Requirements
     - These packers neads at least Win95 or NT4.
       The GUI version is best viewed with installed verdana fontset.
     - Needed RAM: Win95/98/ME  32 MByte
                   NT/2K/XP     64 MByte
     - Minimal screen resolution: 800 x 600 - GUI version
                                  640 x 480 - console version
  - Limitations
     - Maximal imagefilesize: 20 MByte
     - Packed files can't run on Win32s (running with NT/2K/XP and Win95/98/ME)
     - Static TLS with callbacks is not supported


----------
5. Contact
----------
  - inet: http://www.soft-lab.de/joko/ExePack.htm
  - mail: JoKo_Progs@soft-lab.de
