# frozen_string_literal: true

class ThemesController < ApplicationController
  layout false

  # GET /themes/:theme
  def show
    render Views::Themes::Show.new(theme: params[:theme])
  end
end
