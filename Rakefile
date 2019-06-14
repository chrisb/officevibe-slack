require "bundler"

Bundler.require

require "./lib/officevibe/client"

task :default => ["broadcast_engagement"]

task broadcast_engagement: :dotenv do
  slack_client = Slack::Web::Client.new token: ENV.fetch("SLACK_API_TOKEN") { raise "SLACK_API_TOKEN is not configured!"}
  slack_channel = ENV.fetch("SLACK_CHANNEL_ID") { raise "SLACK_CHANNEL_ID is not configured!"}
  officevibe_client = Officevibe::Client.new(ENV.fetch("OFFICEVIBE_AUTH") { raise "OFFICEVIBE_AUTH is not configured!"})

  officevibe_client.get_groups.each do |group|
    group_name = group[:display_name].split(">").last.strip
    slack_client.chat_postMessage channel: slack_channel, text: "Officevibe results for *#{group_name}* as of now..."

    engagement_data = officevibe_client.get_engagement_report(group[:id])
    engagement_data[:metric_groups].each do |metric_group|
      slack_client.chat_postMessage channel: slack_channel, text: ":verified: #{metric_group[:title]}: *#{metric_group[:value]}*", mrkdwn: true
    end
  end
end
