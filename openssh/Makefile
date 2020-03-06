PACKAGE_DIR := $(shell pwd)
PACKAGE_NAME := openssh-8.2p1
PACKAGE_TAR := $(PACKAGE_NAME).tar.gz
PREFIX ?= $(PACKAGE_DIR)/install
CROSS_TOOL ?= aarch64-himix100-linux

#http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-8.2p1.tar.gz
# --with-pid-dir=$(PREFIX) \
# --disable-etc-default-login \

.PHONY: configure
configure:
	@echo -e "\e[32;1m""[1] configure""\033[0m";
	@-rm -rf $(PACKAGE_DIR)/install;
ifeq ($(wildcard $(PACKAGE_DIR)/$(PACKAGE_NAME)/.*), )
	tar -xzf $(PACKAGE_TAR)
	@pushd $(PACKAGE_DIR)/$(PACKAGE_NAME)/; \
		./configure --host=$(CROSS_TOOL) \
		--prefix=$(PREFIX) \
		--with-zlib=$(PREFIX) \
		--with-ssl-dir=$(PREFIX) \
		--with-privsep-path=$(PREFIX) \
		--disable-strip; \
	popd
endif

all: configure
	@pushd $(PACKAGE_DIR)/$(PACKAGE_NAME)/; \
		echo -e "\e[32;1m""[2] make""\033[0m"; \
		make -j 20; \
		echo -e "\e[32;1m""[3] install""\033[0m"; \
		make install-nokeys; \
		echo -e "\e[32;1m""$(PACKAGE_NAME) down!""\033[0m"; \
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

