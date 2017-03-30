require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe "GET #show" do
    it "assigns the requested article to @article" do
      article = create(:article)
      get :show, id: articleexpect(assigns(:article)).to eq article
    end
    it "renders the :show template" do
      article = create(:article)
      get :show, id: article
      expect(response).to render_template :show
  end

  describe "POST #create" do
    it "saves the new contact in the database" do
      expect {
        post :create, article: attributes_for(:article)
      }.to change(Article, :count).by(1)
    end
    it "redirects to articles#index" do
      post :create, article: attributes_for(:article)
      expect(response).to redirect_to articles_path
    end
  end

  describe "PATCH #update" do
    it "locates the requested @article" do
      article = create(:article)
      patch :update, id: article, article: attributes_for(:article)
      expect(assigns(:article)).to eq article
    end
    it "changes @article's attributes" do
      article = create(:article)
      patch :update, id: article, article: attributes_for(:article, title: 'hoge', text: 'hogehoge')
      article.reload
      expect(article.title).to eq('hoge')
      expect(article.content).to eq('hogehoge')
    end
    it "redirects to articles_path" do
      article = create(:article)
      patch: update, id: article, article: attributes_for(:article)
      expect(response).to redirect_to articles_path
    end
  end

  describe "DELETE #destroy" do
    it "deletes the article" do
      article = create(:article)
      expect {
        delete :destroy, id: article
      }.to change(Article, :count).by(-1)
    end
  end
end
