module OmniauthMacros

    def stub_omniauth
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
        provider: 'facebook',
        uid: '12345678910',
        info: {
          email: 'antman@gmail.com',
          first_name: 'Super',
          last_name: 'Man'
        },
        credentials: {
          token: 'abcdefg12345',
          refresh_token: '12345abcdefg',
          expires_at: DateTime.now
        }
      )
    end
  end