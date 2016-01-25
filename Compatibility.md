# Introduction #

safe\_iop was written with portability in mind. It has only been tested (thus far) with GNU's GCC, but it does not contain any architecture-specific logic or instructions.

# Compatibility Matrix #


| Architecture | Operating System | Compiler       | Notes    | Tested |
|:-------------|:-----------------|:---------------|:---------|:-------|
| x86          | OS X Leopard     | GNU GCC 4.0.1  | -O3      | [r3](https://code.google.com/p/safe-iop/source/detail?r=3)     |
| x86          | OS X Tiger       | GNU GCC 4.0.1  | -O3      | [r3](https://code.google.com/p/safe-iop/source/detail?r=3)     |
| x86          | GNU/Linux        | GNU GCC 4.0.3  | -O3      | [r3](https://code.google.com/p/safe-iop/source/detail?r=3)     |
| x86\_64       | GNU/Linux        | GNU GCC 4.0.3  | -O3      | [r3](https://code.google.com/p/safe-iop/source/detail?r=3)     |
| alpha        | OpenBSD          | GNU GCC 3.3.5  | -O3      | [r3](https://code.google.com/p/safe-iop/source/detail?r=3)     |
| macppc       | OpenBSD          | GNU GCC 3.3.5  | -O3      | [r3](https://code.google.com/p/safe-iop/source/detail?r=3)     |
| arm          | OpenBSD          | GNU GCC 3.3.5  | -O3      | [r3](https://code.google.com/p/safe-iop/source/detail?r=3)     |
| vax          | OpenBSD          | GNU GCC 2.95.3 | -O3      | [r3](https://code.google.com/p/safe-iop/source/detail?r=3)     |
| sparc        | OpenBSD          | GNU GCC 2.95.3 | -O3      | [r3](https://code.google.com/p/safe-iop/source/detail?r=3)     |
| sparc64      | OpenBSD          | GNU GCC 3.3.5  | -O1 (1)  | [r3](https://code.google.com/p/safe-iop/source/detail?r=3)     |


# Notes #

(1) For sparc64, there is an optimization bug which causes tests to fail if -O

&lt;level&gt;

 exceeds 1.