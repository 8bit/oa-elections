class WelcomeController < ApplicationController
  def index
    render :text => 'Hello World!', :layout => 'application'
  end
end
