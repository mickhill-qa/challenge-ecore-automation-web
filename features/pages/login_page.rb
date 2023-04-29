# frozen_string_literal: true

class LoginPage < SitePrism::Page
  set_url "#{BASE_URL}/"
  element :input_username, 'input[name=username]'
  element :input_password, 'input[name=password]'
  element :btn_login, 'button[id=btnLogin]'

  def fill_in_username(text)
    input_username.set text
  end

  def fill_inpassword(text)
    input_password.set text
  end

  def click_btn_login
    btn_login.click
  end
end
