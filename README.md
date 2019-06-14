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

Now, edit `.env` with your credentials. You will need:

#### `OFFICEVIBE_AUTH`

To get your auth token log in to the Officevibe app and copy the value of the `officevibe.auth` cookie; this can be done through the Developer Tools of your browser or any number of browser extensions (like [EditThisCookie](https://chrome.google.com/webstore/detail/editthiscookie/fngmhnnpilhplaeedifhccceomclgfbg?hl=en) for Chrome).

#### `SLACK_API_TOKEN`

You'll need to set up a [Slack app](https://api.slack.com/apps) and use the **OAuth Access Token** you are provisioned.

#### `SLACK_CHANNEL_ID`

Find the ID of the channel you want to post results to using the Slack web client (check the URL) or use the API to get the ID.

### Usage

After configuring the credentials above, run:

```
rake
```
