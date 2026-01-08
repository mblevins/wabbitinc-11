---
title: 'Koreader on Kobo'
date: 2025-04-04
draft: false
layout: "/layouts/post.njk"
tags: ['Howto']
---

# Step 1: factory reset the reader
factory reset the kobo

# Step 2: install and configure KOReader

install koreader+kfmon (credit [this post](https://www.mobileread.com/forums/showthread.php?t=314220))

(use curl to avoid safari unzip )

On Mac:

```
mkdir KOReader
curl -O https://storage.gra.cloud.ovh.net/v1/AUTH_2ac4bfee353948ec8ea7fd1710574097/kfmon-pub/OCP-KFMon-1.4.6-139-g709df40.zip
curl -O https://storage.gra.cloud.ovh.net/v1/AUTH_2ac4bfee353948ec8ea7fd1710574097/kfmon-pub/OCP-KOReader-v2024.11.zip
curl -O https://storage.gra.cloud.ovh.net/v1/AUTH_2ac4bfee353948ec8ea7fd1710574097/kfmon-pub/kfm_mac_install.zip
unzip kfm_mac_install.zip
```

Plug in kobo to Mac, then
```
sh install.command
```

(not sure it is needed, but I did this twice, once for kfmon and once for koreader, disconnecting each time and waiting the for the reboot)

verify: nickel menu is in left bottom corner, and it has an item "KOReader"

# Step 3: Exclude the KOReader directory

Exclude "KOReader" from kobo nickel indexing (credit [this post](https://www.reddit.com/r/kobo/comments/1h6gzk2/tip_keep_your_koreader_books_out_of_nickel_reader/))

```
vi /Volumes/KOBOeReader/.kobo/Kobo/Kobo\ eReader.conf
```

Look for this in the file, and update to include KOReader
```
[FeatureSettings]
ExcludeSyncFolders=((KOReader)|\\.(?!kobo|adobe).+|([^.][^/]*/)+\\..+)
```
Not sure this is needed, but I disconnected/reconnected before next step

# Step 4: Set up Calibre  

Now use Calibre to "save to folder" in the KOReader directory.

verify: After disconnecting, there should be no files shown in nickel "home view" and using Koreader from the nickel menu should show all the downloaded books

# Step 5: KOReader tweeks (optional)

edit /Volumes/KOBOeReader/.adds/koreader/settings.reader.lua and add:
(you need to run koreader once for this file to show up)

```
 ["ignore_power_sleepcover"] = true
```

(credit [this thread](https://www.mobileread.com/forums/showthread.php?t=281809))

mkdir /Volumes/KOBOeReader/KOReader 

# Step 6: 

to sync:

power kobo on
plugin koobo via USB -- it will prompt for USB access, click yes

Send to device config: /KOReader/{author_sort}/{title} - {authors}

Prompts for Digital Edition password in keychain?