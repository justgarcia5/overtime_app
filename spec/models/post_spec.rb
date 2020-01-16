require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { build(:user) }
  describe 'Post' do
    let(:post) { build(:post, user: user) }
    context 'when all attributes supplied' do
      it 'post' do
        expect(post).to be_valid
      end
    end

    context 'when attributes are missing' do
      let(:post) { build(:post, date: nil, rationale: nil, user: user) }
      it 'cannot be created without date, rationale' do
        expect(post).to_not be_valid
      end
    end
  end
end
