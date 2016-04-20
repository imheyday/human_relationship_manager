require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#active_li' do
    it 'return active class' do
      allow(helper).to receive(:current_page?).with(root_path).and_return(true)
      helper_method = helper.active_li('toto', root_path)
      content = content_tag(:li, class: 'active') do
        link_to 'toto', root_path
      end
      expect(helper_method).to eq(content)
    end
  end
end
