PACKAGE_DIR := $(shell pwd)
PACKAGE_NAME := hostapd-2.9
PACKAGE_TAR := $(PACKAGE_NAME).tar.gz
PREFIX ?= $(PACKAGE_DIR)/install
CROSS_TOOL ?= aarch64-himix100-linux
export PREFIX
export CROSS_TOOL

# https://w1.fi/releases/hostapd-2.9.tar.gz

all: configure
	@pushd $(PACKAGE_DIR)/$(PACKAGE_NAME)/hostapd/; \
		echo -e "\e[32;1m""[2] make""\033[0m"; \
		make -j 20; \
		echo -e "\e[32;1m""[3] install""\033[0m"; \
		make install; \
		echo -e "\e[32;1m""$(PACKAGE_NAME) down!""\033[0m"; \
	popd

.PHONY: configure
configure:
	@echo -e "\e[32;1m""[1] configure""\033[0m";
	@-rm -rf $(PACKAGE_DIR)/install;
ifeq ($(wildcard $(PACKAGE_DIR)/$(PACKAGE_NAME)/.*), )
	tar -xzf $(PACKAGE_TAR)
	@pushd $(PACKAGE_DIR)/$(PACKAGE_NAME)/hostapd; \
		cp -rp defconfig .config; \
		patch -p1 < $(PACKAGE_DIR)/config.patch; \
		patch -p1 < $(PACKAGE_DIR)/package.patch; \
	popd
endif

.PHONY: clean
clean:
	make -C $(PACKAGE_DIR)/$(PACKAGE_NAME)/hostapd clean;

.PHONY: distclean
distclean:
	-rm -rf $(PACKAGE_DIR)/$(PACKAGE_NAME);
#	-rm -rf $(PREFIX);
	-rm -rf install;

