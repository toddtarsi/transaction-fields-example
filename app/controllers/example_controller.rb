# This is a comment to make rubocop happy

class ExampleController < ApplicationController
  def reproduce_issue
    example = Example.find(1)
    example.with_lock do
      roll_over = example.status == 'd'
      example.status = roll_over ? 0 : Example.statuses[example.status] + 1
      example.save!
    end
    head :ok
  end
end
