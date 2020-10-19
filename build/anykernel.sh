# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers
# Changes for SkyDragon by HolyAngel @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=HolyDragon Kernel for Sunfish
do.devicecheck=1
do.modules=0
do.systemless=0
do.cleanup=1
do.cleanuponabort=0
device.name1=Sunfish
device.name2=sunfish
device.name3=
device.name4=
device.name5=
device.name6=
device.name7=
device.name8=
supported.versions=
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=1;
ramdisk_compression=auto;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
chmod -R 750 $ramdisk/*;
chown -R root:root $ramdisk/*;

## AnyKernel install
dump_boot;

# begin ramdisk changes

if [ -d $ramdisk/.backup ]; then
  patch_cmdline "skip_override" "skip_override";
else
  patch_cmdline "skip_override" "";
fi;

# end ramdisk changes

write_boot;
## end install

