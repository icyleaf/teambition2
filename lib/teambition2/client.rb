require 'teambition2/api/project'
require 'teambition2/api/task_group'
require 'teambition2/api/task'
require 'teambition2/api/stage_template'
require 'teambition2/api/tag'
require 'http'
require 'uri'

module Teambition2
  # Teambiton Client
  class Client
    OAUTH2_ENDPOINT = 'https://account.teambition.com'.freeze
    API_ENDPOINT = 'https://api.teambition.com'.freeze

    attr_accessor :key, :secret, :callback_url, :token

    def initialize(key, secret, callback_url)
      @key = key
      @secret = secret
      @callback_url = callback_url
    end

    def authorize_url(state = nil, response_type = 'code')
      uri = URI.join(OAUTH2_ENDPOINT, '/oauth2/authorize'.freeze)
      params = {
        client_id: @key,
        redirect_uri: @callback_url,
        response_type: response_type,
        state: state
      }

      uri.query = URI.encode_www_form(params)
      uri.to_s
    end

    def access_token(code)
      r = HTTP.post URI.join(OAUTH2_ENDPOINT, '/oauth2/access_token'), form: {
        client_id: @key,
        client_secret: @secret,
        code: code
      }

      @token = r.parse(:json)['access_token']
    end

    def valid_token?
      uri = URI.join(OAUTH2_ENDPOINT, "/api/applications/#{@client_key}/tokens/check")
      r = request.get uri, params: params

      case r.code
      when 200
        true
      when 400
        raise Teambition2::ParamError
      when 403
        raise Teambition2::NoPermissionError
      end

      false
    end

    def get(path, params = {})
      uri = URI.join(API_ENDPOINT, path)
      r = request.get uri, params: params
      r.parse(:json)
    end

    def post(path, form = {})
      uri = URI.join(API_ENDPOINT, path)
      r = request.post uri, form: form
      r.parse(:json)
    end

    def put(path, form = {})
      uri = URI.join(API_ENDPOINT, path)
      r = request.put uri, form: form
      r.parse(:json)
    end

    def delete(path, form = {})
      uri = URI.join(API_ENDPOINT, path)
      r = request.delete uri, form: form
      r.parse(:json)
    end

    private def request
      HTTP.headers(authorization: "OAuth2 #{@token}")
    end

    include API::Project
    include API::TaskGroup
    include API::Task
    include API::StageTemplate
    include API::Tag
  end
end
