PACKAGE_DIR := $(shell pwd)
PACKAGE_NAME := usbmuxd-1.1.1
PACKAGE_TAR := $(PACKAGE_NAME).tar.gz
PREFIX ?= $(PACKAGE_DIR)/install
CROSS_TOOL ?= aarch64-himix100-linux

# git clone git@github.com:libimobiledevice/usbmuxd.git

.PHONY: configure
configure:
	@-rm -rf $(PACKAGE_DIR)/install;
ifeq ($(wildcard $(PACKAGE_DIR)/$(PACKAGE_NAME)/.*), )
	tar -xzf $(PACKAGE_TAR)
	@pushd $(PACKAGE_DIR)/$(PACKAGE_NAME)/; \
		echo -e "\e[32;1m""[1] configure""\033[0m"; \
		./autogen.sh --host=$(CROSS_TOOL) \
		--prefix=$(PREFIX) \
		--with-udevrulesdir="$(PREFIX)" \
		--with-systemdsystemunitdir="$(PREFIX)" \
		libusb_LIBS="-L$(PREFIX)/lib" \
		libusb_CFLAGS="-I$(PREFIX)/include" \
		libplist_LIBS="-L$(PREFIX)/lib" \
		libplist_CFLAGS="-I$(PREFIX)/include" \
		libimobiledevice_LIBS="-L$(PREFIX)/lib" \
		libimobiledevice_CFLAGS="-I$(PREFIX)/include" \
		LDFLAGS="$(PREFIX)/lib/libusb-1.0.so $(PREFIX)/lib/libssl.so $(PREFIX)/lib/libcrypto.so $(PREFIX)/lib/libplist.so $(PREFIX)/lib/libusbmuxd.so $(PREFIX)/lib/libimobiledevice.so"; \
		patch -p1 < $(PACKAGE_DIR)/package.patch; \
	popd
endif

all: configure
	@pushd $(PACKAGE_DIR)/$(PACKAGE_NAME)/; \
		echo -e "\e[32;1m""[2] make""\033[0m"; \
		make -j 20; \
		echo -e "\e[32;1m""[3] install""\033[0m"; \
		make install; \
		echo -e "\e[32;1m""$(PACKAGE_NAME) down!""\033[0m"; \
	popd

.PHONY: clean
clean:
	make -C $(PACKAGE_DIR)/$(PACKAGE_NAME)/ clean;

.PHONY: distclean
distclean:
	-rm -rf $(PACKAGE_DIR)/$(PACKAGE_NAME);
#	-rm -rf $(PREFIX);
	-rm -rf install;

