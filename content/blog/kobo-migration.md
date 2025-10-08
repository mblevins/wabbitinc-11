---
title: 'Kobo Migration'
date: 2024-11-02
draft: false
layout: "/layouts/post.njk"
tags: ['Howto']
---
This is how I converted all our kindle books (500+) to standard epub format for reading on Kobo readers. After this step, all books were downloaded onto two readers, no cloud storage is used. This was done on Windows 11 with a Kobo Clara BW.

Downloaded kindle for windows from https://filehippo.com/download_kindle-for-pc/2.4.70904/ . Note this has to be a pre 2.5 version, as versions after that  will add additional DRM to downloaded books (edit: epubor gave me a warning this was still too late a version, and downgraded it for me -- I could have probably skipped this step and had epubor do it for me)

Downloaded all kindle books on kindle for windows. This was manual, did 10 at a time. 

Downloaded https://www.epubor.com/, paid the $29 license fee. Set the output path to /users/user/ultimate. Added all the kindle books from "Documents/My Kindle Content" and converted to epub. It prompted me to downgrade kindle for windows. Some of the books were in mobi and not converted.

Downloaded Calibre. Set the library directory to d:/Calibre. Added all the converted books from /users/user/ultimate. 

Ran two "download metadata" jobs, 

job 1:
```
Source=open library
Metadata fields=series
Do not swap author names 
Do prefer fewer tags
Download metadata
```

job 2:
```
Source=goodreads, google images
Download covers only
```

Plugged the kobo in the windows machine, and it prompted to add as a device. Calibre recognized it as a device.

Set preferences/send to device to "automatic management". 

Set up a plugboard (preferences/plugboard) to switch the author names, kobo needs *firstname* *lastname* with no comma. Had some issue with the source/dest detection, so just set up as "source=any" "dest=any", since kobo was the only device I had. The plugboard had one template, with source field as author:


```
re(list_re_group(field('authors'), '&', '.', '(.*)', "program: swap_around_comma($)"), '&', ', ')
```

Then selected all books, and clicked "send to device". After the jobs were done, ejected the device. Unplugged the USB cable and plugged it again, this updated some of the book metadata via the "automatic management" (it appears some metadata can only be updated, not done on add, hence the two steps). 

Repeated with second Kobo. 

After this, used the docker version of [calibre-web](https://github.com/linuxserver/docker-calibre-web) running on a house server, it is easier to browse books via this interface than on the Kobo. 



https://www.mobileread.com/forums/showthread.php?t=314220 -- read the first two posts, the second post is the one to follow, but it refers to the first


