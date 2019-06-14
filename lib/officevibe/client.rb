module Officevibe
  class Client
    attr_reader :auth_token, :connection

    delegate :get, to: :connection

    def initialize(auth_token)
      @auth_token = auth_token
      @connection = Faraday.new url: "https://app.officevibe.com", headers: headers do |conn|
        conn.response :json, :content_type => /\bjson$/
        conn.adapter Faraday.default_adapter
      end
    end

    def get_groups
      get("/groups/manageable")
        .body["result"]
        .map { |obj| obj.deep_transform_keys(&:underscore) }
        .map(&:with_indifferent_access)
    end

    def get_engagement_report(group_id)
      get("/report/engagement", groupId: group_id)
        .body["data"]
        .deep_transform_keys(&:underscore)
        .with_indifferent_access
    end

    private

    def headers
      { "Cookie" => { "officevibe.auth" => auth_token }.to_query }
    end

  end
end
