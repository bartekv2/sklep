class OrderMailer < ApplicationMailer
  def order_confirmation(order)
    @order = order

    mail to: order.address.email, subject: "Thank you for your order"
  end

  def order_in_progress(order)
    @order = order

    mail to: order.address.email, subject: "Your order is in progress"
  end

  def order_shipped(order)
    @order = order

    mail to: order.address.email, subject: "Your has been shipped"
  end

  def order_cancelled(order)
    @order = order

    mail to: order.address.email, subject: "Your order has been cancelled"
  end
end
