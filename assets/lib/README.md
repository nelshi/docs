# Static Assets

## Introduction

Static assets (libraries/plugins/web-fonts) required by the theme to run. It provides the opportunity to choose self-host assets in production or development mode.

## Usage

- If you expect the assets to be self-hosted when your website is published:

  Keep the `_config.yml` options as follows:

  ```yml
  # _config.yml
  assets:
    self_host:
      enabled: true
  ```
