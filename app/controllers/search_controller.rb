class SearchController < ApplicationController
  def search
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    @how = params["search"]["how"]
    @datas = search_for(@how, @model, @content)
  end

  private
  #検索フォーム完全一致
  def match(model, content)
    if model == 'user'
      User.where(name: content)
    elsif model == 'game'
      Game.where(title: content)
    end
  end

  #検索フォーム前方一致
  def forward(model, content)
    if model == 'user'
      User.where("name LIKE ?", "#{content}%")
    elsif model == 'game'
      Game.where("title LIKE ?", "#{content}%")
    end
  end

  #検索フォーム後方一致
  def backward(model, content)
    if model == 'user'
      User.where("name LIKE ?", "%#{content}")
    elsif model == 'game'
      Game.where("title LIKE ?", "%#{content}")
    end
  end

  #検索フォーム部分一致
  def partical(model, content)
    if model == 'user'
      User.where("name LIKE ?", "%#{content}%")
    elsif model == 'game'
      Game.where("title LIKE ?", "%#{content}%")
    end
  end

  def search_for(how, model, content)
    case how
    when 'match'
      match(model, content)
    when 'forward'
      forward(model, content)
    when 'backward'
      backward(model, content)
    when 'partical'
      partical(model, content)
    end
  end

end
