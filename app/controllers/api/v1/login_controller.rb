class Api::V1::LoginController < Api::V1::BaseController
  URL = "https://api.weixin.qq.com/sns/jscode2session".freeze

  def wechat_user
    @wechat_response||= RestClient.post(URL, wechat_params)
    @wechat_user ||= JSON.parse(@wechat_response.body)
  end

  def login
    @user = Owner.find_or_create_by(user_id: wechat_user.fetch("openid"))
    p @user
    render json: { 
      userId: @user.id 
    }
  end

  private

  def wechat_params
    {appid:ENV['APP_ID'], secret:ENV['SECRET'], js_code:params[:code], grant_type:"authorization_code" }
  end
end
