---
title: 'Mac Mini 2018 Linux'
date: 2024-11-08
draft: false
tags: ['Howto']
---

This is how I repurposed a 2018 Mac Mini to be a Linix based house server. 

2018 Mac Mini was set up with USB keyboard and mouse, and wired ethernet connection. The Mac had 8GB of RAM and a 256GB disk.

Prepped the Mac with a fresh Ventura install. Then set up a 200GB partition for Linux.

Followed directions from https://wiki.t2linux.org/roadmap/ , for Ubuntu 24.04

After Ubuntu install, set up an ssh server per https://documentation.ubuntu.com/server/how-to/security/openssh-server. This made it easier for the next steps, as I could copy and paste from my dev machine

Followed the instructions for firmware updates per https://wiki.t2linux.org/guides/wifi-bluetooth/, using "Linux option 2", which pulled it directly from the MacOS parition

Followed the instructions for fan daemon per https://wiki.t2linux.org/guides/fan/

Unrelated to the T2 part, installed docker per https://docs.docker.com/engine/install/ubuntu/ . The packages added the docker group, so I just added my user to the docker group. 





