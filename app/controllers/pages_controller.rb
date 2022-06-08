class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  cookies[:moon] = {
    value: 'on'
  }
  end
end
