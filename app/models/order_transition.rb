class OrderTransition < ActiveRecord::Base
  include Statesman::Adapters::ActiveRecordTransition


  belongs_to :order, inverse_of: :transitions
end
