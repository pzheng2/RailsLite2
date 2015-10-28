require 'json'
require 'webrick'

module Phase4
  class Session

    # find the cookie for this app
    # deserialize the cookie into a hash
    def initialize(req)
      @data = {}
      req.cookies.each do |cookie|
        if cookie.name == '_rails_lite_app'
          hashed_cookie_value = JSON.parse(cookie.value)
          @data = hashed_cookie_value
          p @data
          break
        end
      end

    end

    def [](key)
      @data[key]
    end

    def []=(key, val)
      @data[key] = val
    end

    # serialize the hash into json and save in a cookie
    # add to the responses cookies
    def store_session(res)
      res.cookies << WEBrick::Cookie.new('_rails_lite_app', @data.to_json)
    end
  end
end
