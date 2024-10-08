# frozen_string_literal: true

class PagesController < ApplicationController
  layout false

  def home
    render Views::Pages::HomeView.new
  end
end
