class PasswordsController < ApplicationController
  def index
    @password = "Здесь будет ваш новый пароль"
  end

  def create
    @password = HumanizedPassword.new(length).generate

    render("index", local: @password)
  end

  private

  def length
    params.require(:pass).permit(:length)
  end
end
