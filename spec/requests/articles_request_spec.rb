require 'rails_helper'

RSpec.describe ArticlesController do

  before(:each) do
    Article.delete_all
  end

  describe "GET /articles" do
    it "should load articles page" do
      get articles_path
      expect(response).to have_http_status(200)
    end
  end

  it "renders the index template" do
    get articles_path
    expect(response).to render_template("index")
  end

  it "populates an array of articles" do
    article = create(:article)
    get articles_path
    expect(assigns(:articles)).to eq([article])
  end

  it "should not list draft articles if not admin" do

  end
end