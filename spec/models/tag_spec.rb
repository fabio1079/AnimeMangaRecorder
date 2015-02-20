require "rails_helper"

RSpec.describe Tag, :type => :model do
  describe 'should_generate_new_friendly_id' do
    it 'should generate a new friendly url if the slug is blank' do
      tag = Tag::new name:"Just a tag"

      expect(tag.should_generate_new_friendly_id?).to be(true)
      tag.save!
      expect(tag.should_generate_new_friendly_id?).to be(false)
    end

    it 'should generate a new friendly url if the name changed' do
      tag = Tag::new name:"Just a tag"
      tag.save!

      expect(tag.should_generate_new_friendly_id?).to be(false)
      tag.name = "Another tag"
      expect(tag.should_generate_new_friendly_id?).to be(true)
    end
  end
end