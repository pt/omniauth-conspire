require 'omniauth-oauth'
require 'json'

module OmniAuth
  module Strategies
    class Conspire < OmniAuth::Strategies::OAuth2
      option :name, 'conspire'
      option :client_options, {
                              :site               => 'https://www.conspire.com/',
                              :proxy              => ENV['http_proxy'] ? URI(ENV['http_proxy']) : nil,
                              :request_token_path => '/oauth2/unused',
                              :authorize_url      => '/oauth2/authorize',
                              :token_url          => '/oauth2/token'
                             }

      uid do
        raw_info['user']['id']
      end

      info do
        {
          :name => raw_info['user']['profile']['name'],
          :image => raw_info['user']['profile']['photo'],
        }
      end

      extra do
        { :raw_info => raw_info }
      end

      def raw_info
        @raw_info ||= JSON.load(access_token.get('/api/v2/user').body)
      rescue ::Errno::ETIMEDOUT
        raise ::Timeout::Error
      end

    end
  end
end
