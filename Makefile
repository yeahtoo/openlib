WORK_DIR:=$(shell pwd)
CROSS_TOOL:=aarch64-himix100-linux
export CROSS_TOOL
export PREFIX=$(WORK_DIR)/install

export ac_cv_func_realloc_0_nonnull=yes
export ac_cv_func_malloc_0_nonnull=yes

# ifeq ($(CROSS_TOOL), )
# $(error you must set CROSS_TOOL first!)
# endif

LIBUSB_VER:=1.0.22
OPENSSL_VER:=1.1.1d
LIBPLIST_VER:=2.1.0
LIBUSBMUXD_VER:=2.0.2
LIBIMOBILELIST_VER:=1.2.1
USBMUXD_VER:=1.1.1

packages := libusb openssl libplist libusbmuxd libimobiledevice usbmuxd

.PHONY : $(packages)
all: $(packages)
	@echo -e "\e[33;1m""---------make all done!!---------""\033[00m";
clean: $(foreach n, $(packages), $(n)_clean)
distclean: $(foreach n, $(packages), $(n)_distclean)
#	-rm -rf $(PREFIX)

libusb:
	@echo -e "\e[33;1m""---------task [1] build libusb---------""\033[00m";
	make -C $(WORK_DIR)/libusb
libusb_clean:
	@echo -e "\e[33;1m""---------task [1] clean libusb---------""\033[00m";
	make -C $(WORK_DIR)/libusb clean;
libusb_distclean:
	@echo -e "\e[33;1m""---------task [1] distclean libusb---------""\033[00m";
	make -C $(WORK_DIR)/libusb distclean;

openssl:
	@echo -e "\e[33;1m""---------task [2] build openssl---------""\033[00m";
	make -C $(WORK_DIR)/openssl
openssl_clean:
	@echo -e "\e[33;1m""---------task [2] clean openssl---------""\033[00m";
	make -C $(WORK_DIR)/openssl clean;
openssl_distclean:
	@echo -e "\e[33;1m""---------task [2] distclean openssl---------""\033[00m";
	make -C $(WORK_DIR)/openssl distclean;

libplist:
	@echo -e "\e[33;1m""---------task [3] build libplist---------""\033[00m";
	make -C $(WORK_DIR)/libplist
libplist_clean:
	@echo -e "\e[33;1m""---------task [3] clean libplist---------""\033[00m";
	make -C $(WORK_DIR)/libplist clean;
libplist_distclean:
	@echo -e "\e[33;1m""---------task [3] distclean libplist---------""\033[00m";
	make -C $(WORK_DIR)/libplist distclean;

libusbmuxd:
	@echo -e "\e[33;1m""---------task [4] build libusbmuxd---------""\033[00m";
	make -C $(WORK_DIR)/libusbmuxd
libusbmuxd_clean:
	@echo -e "\e[33;1m""---------task [4] clean libusbmuxd---------""\033[00m";
	make -C $(WORK_DIR)/libusbmuxd clean;
libusbmuxd_distclean:
	@echo -e "\e[33;1m""---------task [4] distclean libusbmuxd---------""\033[00m";
	make -C $(WORK_DIR)/libusbmuxd distclean;

libimobiledevice:
	@echo -e "\e[33;1m""---------task [5] build libimobiledevice---------""\033[00m";
	make -C $(WORK_DIR)/libimobiledevice
libimobiledevice_clean:
	@echo -e "\e[33;1m""---------task [5] clean libimobiledevice---------""\033[00m";
	make -C $(WORK_DIR)/libimobiledevice clean;
libimobiledevice_distclean:
	@echo -e "\e[33;1m""---------task [5] distclean libimobiledevice---------""\033[00m";
	make -C $(WORK_DIR)/libimobiledevice distclean;

usbmuxd:
	@echo -e "\e[33;1m""---------task [6] build usbmuxd---------""\033[00m";
	make -C $(WORK_DIR)/usbmuxd
usbmuxd_clean:
	@echo -e "\e[33;1m""---------task [6] clean usbmuxd---------""\033[00m";
	make -C $(WORK_DIR)/usbmuxd clean;
usbmuxd_distclean:
	@echo -e "\e[33;1m""---------task [6] distclean usbmuxd---------""\033[00m";
	make -C $(WORK_DIR)/usbmuxd distclean;

