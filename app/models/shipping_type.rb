class ShippingType < ActiveRecord::Base
  def shipping_name_and_cost
    "#{name} #{helper.number_to_currency cost}"
  end

  private

  def helper
    @helper ||= Class.new do
      include ActionView::Helpers::NumberHelper
    end.new
  end
end
