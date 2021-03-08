require 'spec_helper'

RSpec.describe ExampleController, type: :controller do
  describe 'an example status' do
    it 'can be changed within a transaction' do
      example = Example.find(1)
      get :reproduce_issue
      roll_over = example.status == 'd'
      new_status = roll_over ? 0 : Example.statuses[example.status] + 1
      example.reload
      expect(new_status).to eq(Example.statuses[example.status])
    end
  end
end
