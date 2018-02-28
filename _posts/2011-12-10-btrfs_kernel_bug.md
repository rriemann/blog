---
title: btrfs Kernel Bug
tags:
- linux
- btrfs
- kernel
comments: true
lang: en
---

## Prolog

When updating my only productive computer system to the latest [opensuse][opensuse]
version 12.1, I decided to give the feature rich, shiny new filesystem
[btrfs][btrfs] a try. It's not yet so stable, but it is already delivered by
all main distribution. Fedora actually wants to use it as default.

Up to now I have to evaluate this disission to be more risky than lucky. After
something like two month, I experienced two filesystem corruptions. The first
one hit my root-filesystem. I had to setup my system from scratch, because every
write attempt on the partition ended with a kernel failure, most probably caused
by the btrfs driver. Mounting the partition in read-only mode while using a
Live-CD was the only way to do a late backup.

Yesterday I ran into btrfs problems again. I copied some photos to my hard disk.
In the next moment, I got some weird kernel sys messages, that didn't help me at
all.

    Message from syslogd@theta at Dec 9 17:45:00 ...
    [Freitag, 9. Dezember 2011] [17:45:10] <saLOUt> kernel:[ 454.807770] Code: e9 8c fe ff ff 66 0f 1f 44 00 00 b8 ea ff ff ff e9 cf fe ff ff 48 89 de 4c 89 f7 89 04 24 e8 80 ec ff ff 8b 04 24 e9 b9 fe ff ff <0f> 0b 0f 0b 0f 1f 40 00 41 57 49 89 f7 41 56 41 55 41 54 55 53 

All apps accessing my picture btrfs subvolume were crashing.

After disabling the whole btrfs system by commenting the appropriate lines in my
`/etc/fstab` file, I had a stable system again – just without any pictures.

## Data Rescue

Luckily Chris Mason (#cmason) from [#btrfs][irc] could help me to fix these
problems without any loss of data!

A# simple `btrfsck` didn't help me, because of a crash of the repair tool itself:

    warning, start mismatch 48695640064 48695652352
    block 48695652352 rec extent_item_refs 1, passed 1

No more output. That's all. Chris told me to checkout some fresh code from his
very own repo. When I did the checkout, the master was `fdb6c04023`.

    git clone http://git.kernel.org/pub/scm/linux/kernel/git/mason/btrfs-progs.git

After a reboot, I ran

    make
    make btrfs-zero-log

which went without any errors. After that I used the custom build `btrfs-zero-log`
tool to do some btrfs magic, that I don't understand.

    ./btrfs-zero-log [device]

After another reboot, I was able to mount my picture partition in read-only mode.
I did a late backup again. When reading these files, one gets usually a lot of
errors in `/var/log/messages` like this:

    [ 4055.661622] btrfs csum failed ino 358 off 227975168 csum 4151547339 private 259191981

csum is the abbreviation for checksum. ino means inode, which is a kind of
identifier for every file. To fix these errors, you have to find these files
belonging to these inodes, deleting them and copy them back from your backup.

I wrote a small ruby script, which helps you finding the affected files

~~~ruby
#!/usr/bin/ruby

# string with error messages
error_messages = `dmesg | grep "found for inode"`
# list of integers
inode_list = error_messages.split("\n").map{|i| i.match(/inode (\d+).*/)[1].to_i}
# list of arrays of filenames
file_list = inode_list.map{|i| `find /mnt/test -inum #{i}`.split("\n")}

# require 'json'
# File.open("/tmp/inode-files.json", "w") {|f| f << JSON.pretty_generate(file_list)}

puts file_list.flatten.uniq.sort.join("\n")
~~~

If you finally want to delete these files, you have to remount your partition in
read-write mode.

At least for me, this walkthrough suggested by Chris resolved my problems.

# Complete error log

    Dec  9 11:38:03 theta kernel: [ 3235.664148] btrfs: free space inode generation (0) did not match free space cache generation (6403)
    Dec  9 11:38:03 theta kernel: [ 3235.664152] btrfs: failed to load free space cache for block group 38818283520
    Dec  9 11:38:34 theta kernel: [ 3266.367012] ------------[ cut here ]------------
    Dec  9 11:38:34 theta kernel: [ 3266.367385] kernel BUG at /home/abuild/rpmbuild/BUILD/kernel-desktop-3.1.0/linux-3.1/fs/btrfs/extent-tree.c:5467!
    Dec  9 11:38:34 theta kernel: [ 3266.368140] invalid opcode: 0000 [#1] PREEMPT SMP
    Dec  9 11:38:34 theta kernel: [ 3266.368510] CPU 1
    Dec  9 11:38:34 theta kernel: [ 3266.368653] Modules linked in: nls_iso8859_1 nls_cp437 vfat fat fuse af_packet ip6t_LOG xt_tcpudp xt_pkttype ipt_LOG xt_limit rfcomm bnep ip6t_REJECT nf_conntrack_ipv6 nf_defrag_ipv6 ip6table_raw xt_NOTRACK ipt_REJECT iptable_raw iptable_filter ip6table_mangle nf_conntrack_netbios_ns nf_conntrack_broadcast nf_conntrack_ipv4 nf_defrag_ipv4 ip_tables xt_conntrack nf_conntrack ip6table_filter ip6_tables x_tables cpufreq_conservative cpufreq_userspace cpufreq_powersave acpi_cpufreq mperf microcode dm_mod mmc_block snd_hda_codec_hdmi snd_hda_codec_conexant arc4 uvcvideo videodev v4l2_compat_ioctl32 hdj_mod snd_rawmidi snd_seq_device ecb kvm_intel kvm btusb bluetooth sg joydev sdhci_pci sdhci iwlagn mmc_core mac80211 e1000e cfg80211 i2c_i801 pcspkr snd_hda_intel snd_hda_codec snd_hwdep snd_pcm iTCO_wdt iTCO_vendor_support xhci_hcd snd_timer snd_page_alloc mei(C) battery thinkpad_acpi rfkill tpm_tis tpm tpm_bios snd soundcore ac wmi autofs4 btrfs zlib_deflate thermal i915 drm_
kms_helper
    Dec  9 11:38:34 theta kernel: r drm i2c_algo_bit processor button video thermal_sys
    Dec  9 11:38:34 theta kernel: [ 3266.376473]
    Dec  9 11:38:34 theta kernel: [ 3266.376585] Pid: 11081, comm: btrfs-endio-wri Tainted: G         C  3.1.0-1.2-desktop #1 LENOVO 4290W4H/4290W4H
    Dec  9 11:38:34 theta kernel: [ 3266.377390] RIP: 0010:[<ffffffffa01444bf>]  [<ffffffffa01444bf>] alloc_reserved_file_extent+0x24f/0x270 [btrfs]
    Dec  9 11:38:34 theta kernel: [ 3266.378147] RSP: 0018:ffff8800cce2fb40  EFLAGS: 00010282
    Dec  9 11:38:34 theta kernel: [ 3266.378535] RAX: 00000000ffffffef RBX: ffff8800cd1d90a0 RCX: 0000160000000000
    Dec  9 11:38:34 theta kernel: [ 3266.379060] RDX: 0000000000000008 RSI: 0000000000000001 RDI: ffff8801ad7fb130
    Dec  9 11:38:34 theta kernel: [ 3266.379613] RBP: 00000000000000b2 R08: 0000000000000001 R09: 0000000000000001
    Dec  9 11:38:34 theta kernel: [ 3266.380164] R10: ffff8800c99928e8 R11: 000000000000004e R12: 0000000000000000
    Dec  9 11:38:34 theta kernel: [ 3266.380716] R13: ffff8800cce2fc0f R14: ffff8800c99928e8 R15: ffff88020f367400
    Dec  9 11:38:34 theta kernel: [ 3266.381267] FS:  0000000000000000(0000) GS:ffff88021e240000(0000) knlGS:0000000000000000
    Dec  9 11:38:34 theta kernel: [ 3266.381891] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
    Dec  9 11:38:34 theta kernel: [ 3266.382334] CR2: 00007fbdfb6bc440 CR3: 0000000001c05000 CR4: 00000000000406e0
    Dec  9 11:38:34 theta kernel: [ 3266.382885] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
    Dec  9 11:38:34 theta kernel: [ 3266.383436] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
    Dec  9 11:38:34 theta kernel: [ 3266.383987] Process btrfs-endio-wri (pid: 11081, threadinfo ffff8800cce2e000, task ffff8800d447a580)
    Dec  9 11:38:34 theta kernel: [ 3266.384693] Stack:
    Dec  9 11:38:34 theta kernel: [ 3266.384844]  ffff88020f51d800 ffff880200000035 ffff8802057d4000 0000000100000001
    Dec  9 11:38:34 theta kernel: [ 3266.385445]  8000000000000c16 0000000000000000 0000000000000103 0000000000000166
    Dec  9 11:38:34 theta kernel: [ 3266.386045]  0000000000001000 0000003500000a4c ffff88010c730000 ffff8800c99928e8
    Dec  9 11:38:34 theta kernel: [ 3266.386645] Call Trace:
    Dec  9 11:38:34 theta kernel: [ 3266.386853]  [<ffffffffa014505e>] run_delayed_data_ref+0x10e/0x1c0 [btrfs]
    Dec  9 11:38:34 theta kernel: [ 3266.387401]  [<ffffffffa0147978>] run_clustered_refs+0xc8/0x220 [btrfs]
    Dec  9 11:38:34 theta kernel: [ 3266.387928]  [<ffffffffa0147b95>] btrfs_run_delayed_refs+0xc5/0x210 [btrfs]
    Dec  9 11:38:34 theta kernel: [ 3266.388482]  [<ffffffffa0158590>] __btrfs_end_transaction+0x90/0x340 [btrfs]
    Dec  9 11:38:34 theta kernel: [ 3266.389024]  [<ffffffffa015f5d5>] btrfs_finish_ordered_io+0x2a5/0x340 [btrfs]
    Dec  9 11:38:34 theta kernel: [ 3266.389604]  [<ffffffffa0173310>] end_bio_extent_writepage+0x120/0x170 [btrfs]
    Dec  9 11:38:34 theta kernel: [ 3266.390205]  [<ffffffffa017fcb1>] worker_loop+0xa1/0x2a0 [btrfs]
    Dec  9 11:38:34 theta kernel: [ 3266.390714]  [<ffffffff81075c8e>] kthread+0x7e/0x90
    Dec  9 11:38:34 theta kernel: [ 3266.391093]  [<ffffffff815a5474>] kernel_thread_helper+0x4/0x10
    Dec  9 11:38:34 theta kernel: [ 3266.391550] Code: 20 8b 94 24 a0 00 00 00 48 8b 7c 24 10 48 81 c6 86 00 00 00 e8 83 90 02 00 e9 6c ff ff ff 66 0f 1f 44 00 00 b8 f4 ff ff ff eb 90 <0f> 0b 49 8b 55 09 49 8b 75 00 48 c7 c7 20 6e 1a a0 31 c0 e8 0e
    Dec  9 11:38:34 theta kernel: [ 3266.393481] RIP  [<ffffffffa01444bf>] alloc_reserved_file_extent+0x24f/0x270 [btrfs]
    Dec  9 11:38:34 theta kernel: [ 3266.394093]  RSP <ffff8800cce2fb40>
    Dec  9 11:38:34 theta kernel: [ 3266.597905] ---[ end trace 3233c7c540de8b82 ]---
    Dec  9 11:38:34 theta kernel: [ 3266.597908] note: btrfs-endio-wri[11081] exited with preempt_count 1

[btrfs]: http://btrfs.wiki.kernel.org/
[opensuse]: http://www.opensuse.org/
[irc]: irc://chat.freenode.org/btrfs