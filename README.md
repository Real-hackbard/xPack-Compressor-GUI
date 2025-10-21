# xPack-Compressor-GUI:

</br>

</br>

![Compiler](https://github.com/user-attachments/assets/a916143d-3f1b-4e1f-b1e0-1067ef9e0401) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ![10 Seattle](https://github.com/user-attachments/assets/c70b7f21-688a-4239-87c9-9a03a8ff25ab) ![10 1 Berlin](https://github.com/user-attachments/assets/bdcd48fc-9f09-4830-b82e-d38c20492362) ![10 2 Tokyo](https://github.com/user-attachments/assets/5bdb9f86-7f44-4f7e-aed2-dd08de170bd5) ![10 3 Rio](https://github.com/user-attachments/assets/e7d09817-54b6-4d71-a373-22ee179cd49c)   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![10 4 Sydney](https://github.com/user-attachments/assets/e75342ca-1e24-4a7e-8fe3-ce22f307d881) ![11 Alexandria](https://github.com/user-attachments/assets/64f150d0-286a-4edd-acab-9f77f92d68ad) ![12 Athens](https://github.com/user-attachments/assets/59700807-6abf-4e6d-9439-5dc70fc0ceca)  
![Components](https://github.com/user-attachments/assets/d6a7a7a4-f10e-4df1-9c4f-b4a1a8db7f0e) : ![None](https://github.com/user-attachments/assets/30ebe930-c928-4aaf-a8e1-5f68ec1ff349)  
![Discription](https://github.com/user-attachments/assets/4a778202-1072-463a-bfa3-842226e300af) &nbsp;&nbsp;: ![xPack Compressor GUI](https://github.com/user-attachments/assets/2713e36d-0e09-4866-8e66-8411e8c28dae)  
![Last Update](https://github.com/user-attachments/assets/e1d05f21-2a01-4ecf-94f3-b7bdff4d44dd) &nbsp;: ![102025](https://github.com/user-attachments/assets/62cea8cc-bd7d-49bd-b920-5590016735c0)  
![License](https://github.com/user-attachments/assets/ff71a38b-8813-4a79-8774-09a2f3893b48) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ![Freeware](https://github.com/user-attachments/assets/1fea2bbf-b296-4152-badd-e1cdae115c43)

</br>

XComp and XPack are compression tools for compressing 32-bit Windows executable files (usually with the '.exe' or '.dll' extension). This reduces the file size by an average of 50%. Ideally, the process should be completely transparent to both the compressed software and the user. So, everything remains the same. Try it yourself (it's a freeware product):

* Copy the files ('*.exe' and '*.dll') in the archive to a directory of your choice.
* To start the program, simply click on it in Explorer or use the console version.
* It is possible to create a link in the 'SendTo' folder.

</br>

![xPack Compressor GUI](https://github.com/user-attachments/assets/e48a0fe2-97e2-471d-b251-4c17a37732f8)

</br>

### Packing an executable file:
Select the file you want to compress and confirm with OK - the compression process begins.

First, the resources are reorganized - due to my poor code, this may be a slow process. The progress is visualized by a progress bar.
Then, compression begins - also visible via a progress bar.

If you haven't changed the default settings, a backup copy of the original will be located next to the compressed file on your hard drive...
In principle, any executable 32-bit Windows file, referred to as PE32 files, can be compressed. However, executability is not always retained.

In general, I recommend leaving the default compression options untouched unless special circumstances (or a desire to experiment) dictate otherwise.

Be careful when compressing DLLs - it's best to use XComp. XPack consumes a considerable amount of stack memory during initialization (i.e., loading and subsequent unpacking).

If you do this, you can safely package PE32 files with multiple code sections. This was certainly possible under older versions of NT due to the transition from Win16 to Win32. Or try old Borland C++ 4.00 files.

```
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
```

</br>

### Rebuilding an executable file:
To remove or replace only certain information from a file without compressing the contents, you must set the Mode radio button in the Special section (at the very bottom of the dialog box) to Rebuild.

* Packers with 'in place' compression: XComp, PECompact, UPX, PETITE
* Packers without 'in place' packing:  XPack, UPack, MEW11, FSG
* It looked paradox - smaller filesize but greater imagesize...

</br>

''' Filesize:
  (ERR) - not a usable imagefile (can't run or crashes)
  
```

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
```

</br>

### Parameters :
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


### Specifications:

```
  - Requirements
     - These packers neads at least Win95 or NT4.
       The GUI version is best viewed with installed verdana fontset.
     - Needed RAM: Windows  64 MByte
                   NT/2K/XP/7/8    128 MByte (swapfilesize >= 384 MByte)
     - Minimal screen resolution: 800 x 600 - GUI version
                                  640 x 480 - console version
  - Limitations
     - Maximal imagefilesize: 20 MByte
     - Packed files can't run on Win32s (running with all Windows Versions)
     - Static TLS with callbacks is not supported
```

</br>

### Change image base:
* ype the new imagebase into the text field provided.
* Use hexadecimal notation.
* Deselect all other rebuild options.
* Click the OK button.

Note that under Win9X/ME, the imagebase must be greater than or equal to 4 MB to create a PE32 executable file!
For technical (understandable) reasons, changing the base address is only possible if your file contains relocation information.

</br>

### Imagesize:
```
  XComp and XPack are nearly identical, but XComp uses a 'in place' packing.
  The compressed data is placed at there original location. XPack concatenates
  this data at the end of the newly created packed file. This exceeds the filesize
  in memory (Imagesize).
```

</br>

```
                | <-------------------- LZMA Compression --------------------> | <-------------------- LZSS Compression --------------------> |
                | imagesize | XComp 0.98 | XPack 0.98 | UPack 0.39 |  PEC 2.78 | MEW11 1.2 | XComp 0.98 | XPack 0.98 |   UPX 2.0 | PETITE 2.3 |   FSG 2.0 |
  ---------------------------------------------------------------------------------------------------------------------------------------------------------
  ResHacker 3.4 |   905 216 |    909 312 |  1 200 128 |  1 245 184 |   917 504 | 1 282 048 |    909 312 |  1 236 992 |   925 696 |    909 312 | 1 298 432 |

  FILESIZE                  | <-------------------- LZMA Compression --------------------> | <-------------------- LZSS Compression --------------------> |
                |  filesize | XComp 0.98 | XPack 0.98 | UPack 0.39 |  PEC 2.78 | MEW11 1.2 | XComp 0.98 | XPack 0.98 |   UPX 2.0 | PETITE 2.3 |   FSG 2.0 |
  --------------------------------------------------------------------------------------------------------------------------------------------------------|
  ResHacker 3.4 |   881 664 |    302 344 |    302 200 |    297 356 |   305 664 |   307 759 |    336 760 |    336 648 |   328 192 |    341 767 |   387 749 |

```

</br>

### Notes:
It can happen that XComp/XPack automatically changes a file's imagebase:

If a PE32 file with relocations and an imagebase under 4 MB is packed, and you have also selected 'Delete relocations', the base address will be increased to 4 MB. This is done for Windows compatibility.

### Remove relocations:
* Confirm the 'Delete relocations' checkbox.
* Deselect all other rebuild options.
* Click the OK button.

For dynamically loaded PE32 files (.DLLs), keep in mind that loading to the preferred location is not always possible. You may also need to modify the image base.
This allows you to create executable DLLs (on your system) without relocations.

### Exchange MZ stub file:
To replace the stub file (an executable MZ file that displays text on the console screen, e.g., 'This is a Win32 file'),
you must first select a new stub file. This can be an MZ, NE, or PE file. Only the MZ part is always used.

### Contact and outlook:
The reasons for this program development are aesthetic. Years of viewing executable files with a hex viewer have given rise to a completely new kind of quality characteristic. I call it 'binary aesthetics.' A file can create a pleasing visual impression by maximizing disorder (minimal redundancy) within a clearly defined structure (PE file format). A file can be beautiful! XComp/XPack is simply intended to create beautiful files.

Download:
* [XComp/XPack 0.97](http://www.soft-lab.de/JoKo/XComp097.zip) mit LZSS und LZRW Kompression - 109679 Byte (107 kByte)
* [XComp/XPack 0.98](http://www.soft-lab.de/JoKo/XComp098.zip) mit LZMA and LZSS Kompression - 141033 Byte (137 kByte)

If the link doesn't work, right mouse button "Save target as".

</br>

### Archive content:
```
  The eXe Compressor XComp:
      - XCompc.exe - console version
      - XCompw.exe - gui version
  and the eXe Packer XPack:
      - XPackc.exe - console version
      - XPackw.exe - gui version

  both packers use the compression-DLLs:
      - Xlzma.dll - LZMA compression
      - Xlzss.dll - LZSS compression
```

</br>

  ### Summary:
  
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

