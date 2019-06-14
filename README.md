# Officevibe -> Slack

This script will dump Officevibe metrics to a Slack channel of your choosing. It will broadcast the results of all groups you have management access to.

### Setup

Install gem dependencies:

```
bundle
```

Copy the sample `.env`:

```
cp .env.example .env
```

Edit `.env` with your Officevibe auth token (once logged in, use the value of the `officevibe.auth` cookie), Slack token, and Slack channel ID.

### Usage

After configuring the credentials above, run:

```
rake
```
