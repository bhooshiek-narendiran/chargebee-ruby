module ChargeBee
  class Environment
    
    attr_accessor :api_key, :site
    attr_reader :api_endpoint
      
    def initialize(options)
      [:api_key, :site].each do |attr|
        instance_variable_set "@#{attr}", options[attr]
      end
      if($CHARGEBEE_DOMAIN == nil)
        @api_endpoint = "https://#{@site}.chargebee.com/api/v1"
      else
        @api_endpoint = "#{$ENV_PROTOCOL == nil ? "http": "https"}://#{@site}.#{$CHARGEBEE_DOMAIN}/api/v1"
      end
    end

    def api_url(url, is_v2 = false) # providing support for v2
      (is_v2 ? @api_endpoint[0..-2] + '2' :  @api_endpoint) + url
    end
    
  end
end
