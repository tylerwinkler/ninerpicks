class WelcomeController < ApplicationController
  def index
    @featured_polls = Poll.all.sample(10)
  end
end
