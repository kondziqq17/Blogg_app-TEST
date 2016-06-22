require 'rails_helper'
require 'support/macros'

RSpec.describe CommentsController, type: :controller do
	describe "POST and #create" do
		before do
			@john = User.create(email: "john@example.com", password: "password")
		end

		context "signed in user" do
			it "can create comment" do
				login_user @john
				article = Article.create(title: "First article", body: "Body of first artcile", user: @john )
				post :create, comment: {body: "Awesome post"}, 
				article_id: article.id
				expect(flash[:success]).to eq("Comment has been created")
		end
	end

		context "non-signed id user" do
			it "is redirected to sign in page" do
				login_user nil
				article = Article.create(title: "First article", body: "Body of first artcile", user: @john )
				post :create, comment: {body: "Awesome post"},
				article_id: article.id
				expect(response).to redirect_to new_user_session_path
			end
		end
	end
end
