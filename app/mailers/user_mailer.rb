class UserMailer < Devise::Mailer
  def confirmation_instructions(record, token, opts={})
    headers["Custom-header"] = "Bar"
    opts[:subject] = '茄子切貨網Eggplant 歡迎您加入我們的會員！'
    opts[:from] = 'eggplant@eggplant.com'
    opts[:reply_to] = 'tsangyuwen@gmail.com'
    super
  end

  def reset_password_instructions(record, token, opts={})
    headers["Custom-header"] = "Bar"
    opts[:subject] = '茄子切貨網Eggplant會員中心 - 修改密碼通知'
    opts[:from] = 'eggplant@eggplant.com'
    opts[:reply_to] = 'tsangyuwen@gmail.com'
    super
  end
end
