module WithStatuses
  extend ActiveSupport::Concern

  included do
    enum status: STATUSES
  end

  STATUSES = {
    a: 0,
    b: 1,
    c: 2,
    d: 3
  }.freeze
end
