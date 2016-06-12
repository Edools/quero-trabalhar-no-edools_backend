require 'rails_helper'

RSpec.describe CrudHelper, type: :helper do
  it 'generates a link to new' do
    model = double(model_name: double(human: 'Post'))

    expect(link_to_new(model, '/posts/new', class: 'lorem'))
      .to eql('<a class="lorem" href="/posts/new"><i class="fa fa-plus"></i> <span>Post</span></a>')
  end
end
