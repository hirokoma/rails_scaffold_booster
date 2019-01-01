class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def twitter
        # パスワード認証をONにしている場合、SNSコールバック初回はパスワードは未設定
        # なので`from_twitter`メソッドの中で必ずロールバックが発生する。
        @user = User.from_twitter(request.env['omniauth.auth'].except('extra'))

        if @user.persisted?
            sign_in_and_redirect @user
        else
            session['devise.user_attributes'] = @user.attributes
            redirect_to new_user_registration_url
        end
    end
end