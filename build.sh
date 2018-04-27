#!/bin/bash
sed -e 's/^LIBNEWT =/#&/' \
    -e '/install -m 644 $(LIBNEWT)/ s/^/#/' \
    -e 's/$(LIBNEWT)/$(LIBNEWTSONAME)/g' \
    -i Makefile.in &&
./configure --prefix=/usr \
            --with-gpm-support &&
make -j $SHED_NUMJOBS &&
make DESTDIR="$SHED_FAKEROOT" install
