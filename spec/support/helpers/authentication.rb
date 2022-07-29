# frozen_string_literal: true

module Helpers
  module Authentication
    def sign_in_as(user)
      post login_path, params: { session: { email: user.email, password: 'password' } }
    end
  end
end
