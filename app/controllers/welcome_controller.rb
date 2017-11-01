class WelcomeController < ApplicationController
  def index
    @featured polls = Polls.sample(5)
  end
end
