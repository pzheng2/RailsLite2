class Flash

  def initialize(req)
    @contents = {}

    req.cookies.each do |cookie|
      if cookie.name == '_rails_lite_app'
        hashed_cookie_value = JSON.parse(cookie.value)
        @contents = hashed_cookie_value
        break
      end
    end

  end

  def [](key)
    @contents[key.to_s] || @contens[key.to_sym]
  end

  def []=(key, val)
    @contents[key] = val
  end

end
