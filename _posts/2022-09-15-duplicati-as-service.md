---
layout: post
title: ""
date: 2022-01-01 09:00:00 +0000
categories: #Space Separated
tags: #Space Separated
---

# Install Duplicati as Windows Service

## Installation

Download Duplicati from [HERE](https://www.duplicati.com/download)

During install don’t mark Auto Start up option

Open CMD as admin

Navigate to the installation folder in CMD (this should be the same as long as you left it as default)
```bash
cd "C:\Program Files\Duplicati 2\"
```

Now we will install the service 
`.\Duplicati.WindowsService.exe install`

Start the Duplicati service via Task Manager or Services.

Go to http://localhost:8200/ngax/index.html

You might have to reconfigure things since Duplicati is no longer running as your user and is running as a system user.