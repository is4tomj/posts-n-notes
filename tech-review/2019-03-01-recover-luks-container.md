Recovering a LUKS Container
==============

I needed to recover a partition because I accidentally hit delete on a partition that was a LUKS container on an internal SSD. Thankfully, I did not try to make a new partition over it, so I hoped that the LUKS container was still intact. 

A LUKS container is a logical volume that can be decrypted and mounted using a master key stored in the header. The fist sixteen bytes of a LUKS container viewed in a hexdump will be as follows.

```shell
LUKS....AES.....
```

A LUKS device is a storage device where a LUKS container starts at zero, without any offset into the storage device and can easily be mounted on a Linux system. A LUKS container that begins at some offset into a storage device cannot be easily mounted. A partition table allows a system to mount a LUKS container stored on a storage device starting at some offset. I tried to use several tools to recover the partition table that claimed to work for LUKS containers, but nothing seemed to work. The following are steps to recover a LUKS container in this situation.

## Get the name of the device with LUKS container

```shell
$ sudo fdisk --list
```

In my case, `/dev/nvme0n1` is the name of the SSD with the LUKS container that I wanted to recover.

## Find the offset into the storage device where he LUKS container begins:

```shell
$ sudo hexdump -C /dev/nvme0n1 | grep LUKS
```

After running for around an hour, grep found a  match starting at `4c900000`, which is the offset of the header on my SSD device.

## Create a loop device

```shell
$ sudo losetup -o 0x4c900000 -r -f /dev/nvme0n1
```

The new loop device will be visible using the Disks application. You can also run the following command to see a list of the loop devices.

```shell
$ losetup -a
```

In my case, the loops device was `/dev/loop1`.

On some distributions of Linux, you must enter the master passphrase for the LUKS container with this command. On other distros, no password is required, but the container will not be open and you need to run the following command and enter your master passphrase when asked.

```shell
$ sudo cryptsetup luksOpen /dev/loop1 encrypted_device
```

## Create an image of the decrypted data

Mount an external SSD. Open `Disks`. Right-click on the loops device and select `Create image` and store the result on the external SSD.

This step is technically optional. But, I working on a copy is much safer.

## Mount the image

At this point, the image is an decrypted in LVM2. If you try to mount the image, then you will get an error about reading an LVM2. We need to use LVM tools to mount the image as a volume. To illustrate a clear example, assume that the image from the previous step is `recovered_data.img`.


