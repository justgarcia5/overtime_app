require 'rails_helper'

describe 'navigate' do
  let(:admin) { create_logged_in_admin }
  let(:user) { create_logged_in_user }

  describe 'edit' do
    before do
      login(admin)
      @post = Post.create!(date: Date.today, rationale: 'Post1', user: user)
    end

    it 'has a status that can be edited on the form by an admin' do
      login(admin)

      visit edit_post_path(@post)
      choose('post_status_approved')
      click_on('Submit')
      expect(@post.reload.status).to eq('approved')
    end

    it 'cannot be edited by a non admin' do
      logout(admin)
      login(user)

      visit edit_post_path(@post)
      expect(page).to_not have_content('Approved')
    end
  end
end
