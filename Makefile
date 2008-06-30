#
# safe_iop - Makefile
#
# Author:: Will Drewry <redpig@dataspill.org>
# Copyright 2007,2008 redpig@dataspill.org
# Some portions copyright 2008 Google Inc.
#
# Unless required by applicable law or agreed to in writing, software
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS
# OF ANY KIND, either express or implied.
#

CC = gcc
VERSION = 0.3
TESTNAME = safe_iop_test
# For sparc64, _only_ use -O1 or -O0
# -fno-strict-aliasing is needed for more recent GCCs when compiling the
# tests or the library.  It is _NOT_ needed forusing the header only.
CFLAGS   = -Wall -O2 -Iinclude -fno-strict-aliasing
SOURCES = src/safe_iop.c

all: $(TESTNAME) $(TESTNAME)_speed

# This may be built as a library or directly included in source.
# Unless support for safe_iopf is needed, header inclusion is enough.

# Later, look at moving towards gcc 4.3 where they;ve fixed the
# type-limit warnings. (-Wno-type-limits)
$(TESTNAME): src/safe_iop.c include/safe_iop.h
	$(CC) $(CFLAGS) -DNDEBUG=1 -DSAFE_IOP_TEST=1 $(SOURCES) -o $@

$(TESTNAME)_speed: src/safe_iop.c include/safe_iop.h
	$(CC) $(CFLAGS) -DSAFE_IOP_SPEED_TEST=1 -DNDEBUG=1 -DSAFE_IOP_TEST=1 $(SOURCES) -o $@



askme: examples/askme.c include/safe_iop.h
	$(CC) $(CFLAGS) examples/askme.c -o $@

so: src/safe_iop.c include/safe_iop.h
	$(CC) -shared -Wl,-soname,libsafe_iop.so.$(VERSION) $(CFLAGS) $(SOURCES) -o libsafe_iop.so.$(VERSION) 

dylib: src/safe_iop.c include/safe_iop.h
	$(CC) -dynamiclib -Wl,-headerpad_max_install_names,-undefined,dynamic_lookup,-compatibility_version,$(VERSION),-current_version,$(VERSION),-install_name,/usr/local/lib/libsafe_iop.$(VERSION).dylib $(CFLAGS) $(SOURCES) -o libsafe_iop.$(VERSION).dylib


test: $(TESTNAME)
	@./$(TESTNAME)
	@rm $(TESTNAME)

clean:  
	rm $(TESTNAME)
