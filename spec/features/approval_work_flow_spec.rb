require 'rails_helper'

describe 'navigate' do
  let(:admin) { create_logged_in_admin }
  let(:user) { create_logged_in_user }

  before do
    login(admin)
    @post = Post.create!(date: Date.today, rationale: 'Post1', user: user)
  end

  describe 'edit' do
    it 'has a status that can be edited' do
      visit edit_post_path(@post)
      choose('post_status_approved')
      click_on('Submit')
      expect(@post.reload.status).to eq('approved')
    end
  end
end
