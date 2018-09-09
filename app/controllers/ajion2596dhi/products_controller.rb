class Ajion2596dhi::ProductsController < ApplicationController
  def index
    require 'mechanize'
    agent = Mechanize.new
    page = agent.get("https://www.alexa.com/siteinfo/pansci.asia")
    @text = page.search('strong.metrics-data')
  end
end
