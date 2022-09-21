---
layout: post
title: "Cloudflare DDNS Docker"
date: 2020-02-13 09:00:00 +0000
categories: docker #Space Separated
tags: docker cloudflare ddns domain #Space Separated
---

# Cloudflare DDNS Docker

## Usage

Quick Setup:

```shell
docker run \
  -e API_KEY=xxxxxxx \
  -e ZONE=example.com \
  -e SUBDOMAIN=subdomain \
  oznu/cloudflare-ddns
```

## Parameters

* `--restart=always` - ensure the container restarts automatically after host reboot.
* `-e API_KEY` - Your CloudFlare scoped API token. See the [Creating a Cloudflare API token](#creating-a-cloudflare-api-token) below. **Required**
  * `API_KEY_FILE` - Path to load your CloudFlare scoped API token from (e.g. a Docker secret). *If both `API_KEY_FILE` and `API_KEY` are specified, `API_KEY_FILE` takes precedence.*
* `-e ZONE` - The DNS zone that DDNS updates should be applied to. **Required**
  * `ZONE_FILE` - Path to load your CloudFlare DNS Zone from (e.g. a Docker secret). *If both `ZONE_FILE` and `ZONE` are specified, `ZONE_FILE` takes precedence.*
* `-e SUBDOMAIN` - A subdomain of the `ZONE` to write DNS changes to. If this is not supplied the root zone will be used.
  * `SUBDOMAIN_FILE` - Path to load your CloudFlare DNS Subdomain from (e.g. a Docker secret). *If both `SUBDOMAIN_FILE` and `SUBDOMAIN` are specified, `SUBDOMAIN_FILE` takes precedence.*

## Optional Parameters

* `-e PROXIED` - Set to `true` to make traffic go through the CloudFlare CDN. Defaults to `false`.
* `-e RRTYPE=A` - Set to `AAAA` to use set IPv6 records instead of IPv4 records. Defaults to `A` for IPv4 records.
* `-e DELETE_ON_STOP` - Set to `true` to have the dns record deleted when the container is stopped. Defaults to `false`.
* `-e INTERFACE=tun0` - Set to `tun0` to have the IP pulled from a network interface named `tun0`. If this is not supplied the public IP will be used instead. Requires `--network host` run argument.
* `-e CUSTOM_LOOKUP_CMD="echo '1.1.1.1'"` - Set to any shell command to run them and have the IP pulled from the standard output. Leave unset to use default IP address detection methods.
* `-e DNS_SERVER=10.0.0.2` - Set to the IP address of the DNS server you would like to use. Defaults to 1.1.1.1 otherwise. 
* `-e CRON="@daily"` - Set your own custom CRON value before the exec portion. Defaults to every 5 minutes - `*/5 * * * *`.

## Depreciated Parameters

* `-e EMAIL` - Your CloudFlare email address when using an Account-level token. This variable MUST NOT be set when using a scoped API token.

## Creating a Cloudflare API token

To create a CloudFlare API token for your DNS zone go to https://dash.cloudflare.com/profile/api-tokens and follow these steps:

1. Click Create Token
2. Provide the token a name, for example, `cloudflare-ddns`
3. Grant the token the following permissions:
    * Zone - Zone Settings - Read
    * Zone - Zone - Read
    * Zone - DNS - Edit
4. Set the zone resources to:
    * Include - All zones
5. Complete the wizard and copy the generated token into the `API_KEY` variable for the container

## Multiple Domains

If you need multiple records pointing to your public IP address you can create CNAME records in CloudFlare.

## IPv6

If you're wanting to set IPv6 records set the envrionment variable `RRTYPE=AAAA`. You will also need to run docker with IPv6 support, or run the container with host networking enabled.

## Docker Compose

`docker-compose.yml`

```yml
{% include /assets/docker-compose/docker-compose-cloudflare.yml %}
```