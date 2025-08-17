
       XComp/XPack: A freeware PE32-imagefile packer/rebuilder
              (c)2007 JoKo, Version 0.98 02/18/2007


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
5.  Compression results
     - Imagesize
       - Comments
     - Filesize
       - Used parameters
       - Comments
       - Summary
6.  Contact


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

  both packers use the compression-DLLs:
      - Xlzma.dll - LZMA compression
      - Xlzss.dll - LZSS compression


---------------
3. Installation
---------------
  - Copy the files ('*.exe' and '*.dll') into a directory of your choice.
  - To start the executables use the explorer or a console window.
  - If you like create a link in the 'SendTo' directory.


-----------------
4. Specifications
-----------------
  - Requirements
     - These packers neads at least Win95 or NT4.
       The GUI version is best viewed with installed verdana fontset.
     - Needed RAM: Win95/98/ME  64 MByte
                   NT/2K/XP    128 MByte (swapfilesize >= 384 MByte)
     - Minimal screen resolution: 800 x 600 - GUI version
                                  640 x 480 - console version
  - Limitations
     - Maximal imagefilesize: 20 MByte
     - Packed files can't run on Win32s (running with NT/2K/XP and Win95/98/ME)
     - Static TLS with callbacks is not supported


----------------------
5. Compression results
----------------------

Imagesize:
----------
  XComp and XPack are nearly identical, but XComp uses a 'in place' packing.
  The compressed data is placed at there original location. XPack concatenates
  this data at the end of the newly created packed file. This exceeds the filesize
  in memory (Imagesize).

  IMAGESIZE                 | <-------------------- LZMA Compression --------------------> | <-------------------- LZSS Compression --------------------> |
                | imagesize | XComp 0.98 | XPack 0.98 | UPack 0.39 |  PEC 2.78 | MEW11 1.2 | XComp 0.98 | XPack 0.98 |   UPX 2.0 | PETITE 2.3 |   FSG 2.0 |
  ---------------------------------------------------------------------------------------------------------------------------------------------------------
  Firefox 1.07  | 6 729 728 |  6 733 824 |  9 146 368 |  9 273 344 | 6 766 592 | 9 383 936 |  6 733 824 |  9 572 352 | 6 823 936 |  6 762 496 | 9 990 144 |
  ResHacker 3.4 |   905 216 |    909 312 |  1 200 128 |  1 245 184 |   917 504 | 1 282 048 |    909 312 |  1 236 992 |   925 696 |    909 312 | 1 298 432 |

  FILESIZE                  | <-------------------- LZMA Compression --------------------> | <-------------------- LZSS Compression --------------------> |
                |  filesize | XComp 0.98 | XPack 0.98 | UPack 0.39 |  PEC 2.78 | MEW11 1.2 | XComp 0.98 | XPack 0.98 |   UPX 2.0 | PETITE 2.3 |   FSG 2.0 |
  --------------------------------------------------------------------------------------------------------------------------------------------------------|
  Firefox 1.07  | 6 637 161 |  2 444 470 |  2 444 698 |  2 456 420 | 2 467 840 | 2 536 301 |  2 872 102 |  2 872 220 | 2 798 592 |  2 981 119 | 3 254 381 |
  ResHacker 3.4 |   881 664 |    302 344 |    302 200 |    297 356 |   305 664 |   307 759 |    336 760 |    336 648 |   328 192 |    341 767 |   387 749 |

  Comments:
  ---------
    - Packers with 'in place' compression: XComp, PECompact, UPX, PETITE
    - Packers without 'in place' packing:  XPack, UPack, MEW11, FSG
    - It looked paradox - smaller filesize but greater imagesize...

Filesize:
---------
  (ERR) - not a usable imagefile (can't run or crashes)

                    | WINWORD 10  |  MovieMaker 2.1 | OllyDebug 1.1 | MASM 7.0 | Calculator |    Touch 4.0 | Acrobat Reader 7.0 | Resource Compiler 5.1
  Filename          | WINWORD.EXE |  moviemk.exe    | OLLYDBG.EXE   | ML.EXE   | calc.exe   |    touch.exe | AcroRd32.dll       | rcdll.dll
  -----------------------------------------------------------------------------------------------------------------------------------------------------
  original filesize |  10 571 776 |       3 555 328 |     1 117 696 |  413 696 |    108 544 |       40 960 |          9 609 216 | 114 688
  -----------------------------------------------------------------------------------------------------------------------------------------------------
  XComp 0.98 (LZMA) |   4 157 266 |       1 149 622 |       489 736 |  166 582 |     48 310 |       19 630 |          2 979 079 |  47 021
  XPack 0.98 (LZMA) |   4 156 518 |       1 149 511 |       489 546 |  166 180 |     48 023 |       19 507 |          2 978 755 |  45 981
  UPack 0.399       |   4 276 228 | (ERR) 1 156 192 |       487 580 |  163 512 |     45 968 | (ERR) 17 880 |          2 971 465 |  44 450
  PECompact 2.78    |   4 236 800 |       1 168 384 |       496 128 |  167 936 |     50 176 |       21 504 |          3 021 216 |  48 640
  MEW11 1.2         |   4 402 355 | (ERR) 1 190 605 |       513 528 |  166 894 |     47 182 | (ERR) 19 109 |     can't pack DLL | can't pack DLL
  -----------------------------------------------------------------------------------------------------------------------------------------------------
  XComp 0.98 (LZSS) |   4 882 370 |       1 323 302 |       545 656 |  183 080 |     50 470 |       19 742 |          3 499 383 |  49 693
  XPack 0.98 (LZSS) |   4 881 942 |       1 322 889 |       545 246 |  182 595 |     49 928 |       19 449 |          3 499 015 |  49 185
  UPX 2.0           |  can't pack |       1 296 896 |       541 696 |  180 224 |     50 176 |       22 016 |          3 462 656 |  49 152
  PETITE 2.3        |  can't pack |      can't pack | (ERR) 962 315 |  183 989 |     51 524 |       20 816 |          3 557 725 |  50 530
  FSG 2.0           |   5 659 945 | (ERR) 1 525 821 | (ERR) 609 089 |  194 233 |     55 085 |       19 893 |     can't pack DLL | can't pack DLL
  -----------------------------------------------------------------------------------------------------------------------------------------------------
  XComp 0.97 (LZSS) |   5 176 950 |       1 354 200 |       552 490 |  185 304 |     50 648 |       19 920 |          3 639 339 |  50 385
  XPack 0.97 (LZSS) |   5 176 532 |       1 354 004 |       552 322 |  185 056 |     50 420 |       19 771 |          3 638 171 |  49 809
  XComp 0.97 (LZRW) |   6 052 216 |       1 526 498 |       609 070 |  210 140 |     55 004 |       22 740 |          4 201 263 |  56 789
  XPack 0.97 (LZRW) |   6 051 677 |       1 525 871 |       609 193 |  209 767 |     54 593 |       22 226 |          4 200 179 |  55 997

  Used parameters:
  ----------------
    XComp/XPack: exe -e, dll no params
    UPack:       exe -set -srt, dll no params
    PECompact:   exe /Cl:9 /Dt:Small /Asd:No /Sf:Yes /Ri:No /Ch:pec2codec_lzma2.dll /Lh:pec2ldr_reduced.dll
                 dll /Cl:9 /Dt:Small /Asd:No /Ri:No /Ch:pec2codec_lzma2.dll /Lh:pec2ldr_reduced.dll
    MEW11:       Delete unimportant resources, Win9x compatibility, Use LZMA algorithm too, 
                 Special LZMA (E8\E9), Strip relocs, Strip DELPHI resources
    UPX:         --best
    PETITE:      -9 -r** -v0
    FSG:         no params
    XC/XP 0.97:  exe -e -l:9, dll -l:9

  Comments:
  ---------
    - PETITE 2.3:
      - Problems with Borland CBuilder imagefiles (like OLLYDBG.EXE 1.1 or WinRAR.exe 3.42).
      - You need hours(!) to pack a 10 MByte - AMD64 3000, 1024 MByte RAM, 160 GByte HD.
    - UPack 0.399, MEW11 1.2:
      - Couldn't pack files with a section alignment <> 4 KByte (like TOUCH.EXE 4.0 or OLLYDBG.EXE 1.0).
    - UPack 0.399, MEW11 1.2, FSG 2.0:
      - VC++ 7.1/8.0 exception handling not supported (moviemk.exe)
      - A missing library results in a crashing program

  Summary:
  --------
    - LZMA compression:
      XComp/XPack 0.98 compared with UPack 0.399, PECompact 2.78, MEW11 1.2
      ---------------------------------------------------------------------
      filesize > 2000 KB - packing ratio nearly identical with UPack 0.399
                           and mostly better as PECompact 2.78 or MEW11 1.2.
          1. UPack 0.399 and XComp/XPack 0.98
          2. PECompact 2.78
          3. MEW11 1.2
      filesize 200 - 2000 KB - packing ratio between UPack 0.399 and MEW11 1.2
          1. UPack 0.399
          2. XComp/XPack 0.98
          3. PECompact 2.78 and MEW11 1.2
      filesize < 200 KB - packing ratio between MEW11 1.2 and PECompact 2.78
          1. UPack 0.399
          2. MEW11 1.2
          3. XComp/XPack 0.98
      after all i think it's true to say that the compression is not very good but good.

    - LZSS compression:
      XComp/XPack 0.98 compared with UPX 2.0, PETITE 2.3, FSG 2.0
      -----------------------------------------------------------
      filesize > 2000 KB - packing ratio between UPX 2.0 and PETITE 2.3
          1. UPX 2.0
          2. XComp/XPack 0.98
          3. PETITE 2.3
      filesize 200 - 2000 KB - packing ratio between UPX 2.0 and PETITE 2.3
          1. UPX 2.0
          2. XComp/XPack 0.98
          3. PETITE 2.3
      filesize < 200 KB      - packing ratio mostly better than UPX 2.0 and PETITE 2.3
          1. XComp/XPack 0.98
          2. UPX 2.0
          3. PETITE 2.3
      this is the same situation as with the LZMA compression - not very good but good.

    - Best packers:
      LZMA: PECompact 2.78 was the best exepacker with LZMA compression.
            + use 'in place' compression
            + good or very good compression ratio (LZMA)
            + it is difficult to find a incompressible imagefile.
            + fastest loading speed
      LZSS: UPX 2.0 was the best exepacker with LZSS compression.
            + if possible 'in place' compression
            + very good compression ratio (LZSS)
            + it is difficult to find a incompressible imagefile.


----------
6. Contact
----------
  - inet: http://www.soft-lab.de/joko/ExePack.htm
  - mail: JoKo_Progs@soft-lab.de

