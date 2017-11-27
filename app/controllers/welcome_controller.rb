class WelcomeController < ApplicationController
  def index
    redirect_to polls_path
  end
end
