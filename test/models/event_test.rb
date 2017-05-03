require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  let(:key_to_delete) {FactoryGirl.create(:key)}

  it 'should destroy' do
    delete :destroy, id: key_to_delete.id
    expect(Key.where(id: key_to_delete.id).count).to eq(0)
  end
end
