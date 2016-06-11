class HomeController < ApplicationController
  def index
  end

  def search
    query = Sunspot.search Student, School, Course do
      fulltext params[:q]
    end

    @results = query.results

  end
end
