#!/bin/bash
sed -e 's/^LIBNEWT =/#&/' \
    -e '/install -m 644 $(LIBNEWT)/ s/^/#/' \
    -e 's/$(LIBNEWT)/$(LIBNEWTSONAME)/g' \
    -i Makefile.in &&
./configure --prefix=/usr \
            --with-gpm-support &&
make -j $SHED_NUM_JOBS &&
make DESTDIR="$SHED_FAKE_ROOT" install
