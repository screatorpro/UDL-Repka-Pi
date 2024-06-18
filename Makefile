
KERNEL_VER:=$(shell uname -r)
KERNEL_DIR:=/lib/modules/$(KERNEL_VER)/build
INSTALL_DIR_udlfb:=/lib/modules/$(KERNEL_VER)/kernel/drivers/video/fbdev
INSTALL_DIR_udl:=/lib/modules/$(KERNEL_VER)/kernel/drivers/gpu/drm/udl

obj-y				+= drivers/


all:
	$(MAKE) modules -C $(KERNEL_DIR) M=$(shell pwd)

install: all
	install -D -m 644 drivers/video/fbdev/udlfb.ko $(INSTALL_DIR_udlfb)/udlfb.ko
	install -D -m 644 drivers/gpu/drm/udl/udl.ko $(INSTALL_DIR_udl)/udl.ko
	/sbin/depmod -a
	modprobe udl
	modprobe udlfb


