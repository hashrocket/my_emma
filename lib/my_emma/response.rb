class MyEmma
  class Response
    attr_reader :response, :code
    alias to_s response

    def initialize(response)
      @response = response
      @code = response.to_i
    end

    def failed?
      code <= 0
    end

    def success?
      code > 0
    end

    RESPONSES = {
      :added_member? => 1,
      :updated_member? => 2,
      :member_exists? => 3,
      :authentication_failed? => -1,
      :add_member_failed? => -2,
      :update_member_failed? => -3
    }

    RESPONSES.each do |name, error_code|
      define_method name do
        code == error_code
      end
    end
  end
end
