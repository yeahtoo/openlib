PACKAGE_DIR := $(shell pwd)
PACKAGE_NAME := libimobiledevice-1.2.1
PACKAGE_TAR := $(PACKAGE_NAME).tar.gz
PREFIX ?= $(PACKAGE_DIR)/install
CROSS_TOOL ?= aarch64-himix100-linux

# git clone git@github.com:libimobiledevice/libimobiledevice.git

all:
	@-rm -rf $(PACKAGE_DIR)/$(PACKAGE_NAME);
	@-rm -rf $(PACKAGE_DIR)/install;
	@tar -xzf $(PACKAGE_TAR);
	@pushd $(PACKAGE_DIR)/$(PACKAGE_NAME)/; \
		echo -e "\e[32;1m""[1] configure""\033[0m"; \
		patch -p1 < $(PACKAGE_DIR)/package.patch; \
		./autogen.sh --host=$(CROSS_TOOL) \
		--prefix=$(PREFIX) \
		--without-cython \
		--disable-largefile \
		libplist_LIBS="-L$(PREFIX)/lib" \
		libplist_CFLAGS="-I$(PREFIX)/include" \
		libusbmuxd_LIBS="-L$(PREFIX)/lib" \
		libusbmuxd_CFLAGS="-I$(PREFIX)/include" \
		openssl_LIBS="-L$(PREFIX)/lib" \
		openssl_CFLAGS="-I$(PREFIX)/include" \
		LDFLAGS="$(PREFIX)/lib/libplist.so $(PREFIX)/lib/libusbmuxd.so $(PREFIX)/lib/libssl.so $(PREFIX)/lib/libcrypto.so"; \
		echo -e "\e[32;1m""[2] make""\033[0m"; \
		make -j 20; \
		echo -e "\e[32;1m""[3] install""\033[0m"; \
		make install; \
		echo -e "\e[32;1m""$(PACKAGE_NAME) down!""\033[0m" \
	popd

.PHONY: clean
clean:
	@-pushd $(PACKAGE_DIR)/$(PACKAGE_NAME)/ &&\
	make -C $(PACKAGE_DIR)/$(PACKAGE_NAME)/ clean && \
	popd

.PHONY: distclean
distclean:
	-rm -rf $(PACKAGE_DIR)/$(PACKAGE_NAME);
#	-rm -rf $(PREFIX);
	-rm -rf install;
