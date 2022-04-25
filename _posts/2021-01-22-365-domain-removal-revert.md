---
layout: post
title: "365 Domain Removal and Revert"
date: 2021-01-22 09:00:00 +0000
categories: 365 script #Space Separated
tags: 365 script domain #Space Separated
---

# 365 Domain Removal and Revert

Script to remove existing primary domain and revert to .onmicrosoft or other specified domain.

## Specify Domains and Connect to 365

```ps
$olddomain ="docs.nels.one"
$Newdomain="nels.onmicrosoft.com"

Import-Module MsOnline
$credential = get-credential
Connect-MsolService -Credential $credential
```
## Replace Existing UPN's

```ps
$users=Get-MsolUser -domain $olddomain
$users | Foreach-Object{ 
$user=$_
$UserName =($user.UserPrincipalName -split "@")[0]
$UPN= $UserName+"@"+ $Newdomain 
Set-MsolUserPrincipalName -UserPrincipalName $user.UserPrincipalName -NewUserPrincipalName $UPN
}
```
## Remove Address from Existing Mailboxes

```ps
Connect-ExchangeOnline
$Mailboxes = Get-Mailbox -ResultSize Unlimited
foreach ($Mailbox in $Mailboxes) {

    $Mailbox.EmailAddresses | Where-Object { ($_ -like "*@docs.nels.one") } | 

    ForEach-Object {
        Set-Mailbox $Mailbox.Name -EmailAddresses @{remove = $_ }
        Write-Host "Removing $_ from $Mailbox Mailbox" -ForegroundColor Green
    }
}
```