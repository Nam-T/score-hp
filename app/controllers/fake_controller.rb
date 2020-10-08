require 'rubygems'
require 'mechanize'
class FakeController < ApplicationController
  LIST = ['Năm cc', 'Có', 'Trang thông tin tuyển dụng của công ty', 'Không quan tâm', 'Không quan tâm', 'Không quan tâm', 'Không quan tâm', 'Không quan tâm', 'Không nắm chắc rõ công ty nào đang tuyển dụng, thời gian tuyển dụng'].freeze
  def index
    agent = Mechanize.new
    page = agent.get("https://docs.google.com/forms/d/e/1FAIpQLScHEFNpLaG-kpm-CId98BAAdu3VXAYYFme18P4YtDo4UmMRxg/viewform")
    vote_form = page.form_with(id: "mG61Hd")
    LIST.each_with_index do |value, index|
      vote_form.fields[index].value = value
    end
    binding.pry
    
    render html: 'Hi'
  end
end
