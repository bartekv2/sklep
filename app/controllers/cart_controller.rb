class CartController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:finish]
  def show
    @cart = current_cart
  end

  def edit
    @cart = current_cart
    @cart.build_address if @cart.address.blank?
  end

  def update
    @cart = current_cart
    @types = Order.select(:payment_channel).distinct
    if @cart.update_attributes(cart_attributes)
      @cart.update_attribute(:shipping_cost, @cart.shipping_type.cost)
      redirect_to confirmation_cart_path
    else
      render action: :edit
    end
  end

  def confirmation
    @cart = current_cart
    @id = "770516"
    @amount = @cart.full_cost.to_s
    @currency = "PLN"
    @description = "Zamówienie numer " + current_cart.address.order_id.to_s
    @channel = current_cart.payment_channel.to_s
    @type = "4"
    @url = finish_cart_url
    @firstname = current_cart.address.first_name
    @lastname = current_cart.address.last_name
    @email = current_cart.address.email
    @bylaw = "1"
    @personal_data = "1"
  end

  def finish
    @cart = current_cart
    if params[:status] == 'OK'
      @cart.transition_to :confirmed
      session.delete(:order_id)
      @ok = true
    else
      @ok = false
    end
  end

  def add_product
    order = current_cart_or_create
    product = Product.find(params[:product_id])
    variants = product.variants
    if !params[:selected_item].nil?
      variant_id = params[:selected_item]
      if item = order.line_items.where(product: product, variant_id: variant_id).first
        item.quantity += 1
        item.save
      else @new_item = order.line_items.create product: product,
          quantity: 1,
          unit_price: product.price,
          item_name: product.name,
          variant_id: variant_id
      end
      selected_variant = variants.find(variant_id)
      selected_variant.quantity -= 1
      selected_variant.save
      redirect_back fallback_location: root_path, notice: "Dodano produkt do koszyka"
    else
      redirect_back fallback_location: root_path, alert: "Proszę wybrać rozmiar!"
    end
  end

  def remove_product
    order = current_cart
    product = Product.find(params[:product_id])
    selected_variant = Variant.find(params[:variant_id])
    item = order.line_items.where(product: product).first
    if item
      item.destroy
    end
    selected_variant.quantity += params[:item_quantity].to_i
    selected_variant.save
    redirect_back fallback_location: root_path, notice: "Usunięto produkt z koszyka"
  end

  private

  def cart_attributes
    params.require(:order).permit(
      :shipping_type_id,
      :comment,
      :payment_channel,
      :bylaw,
      :personal_data,
      :address_attributes => [
        :first_name,
        :last_name,
        :city,
        :zip_code,
        :street,
        :email,
        :phone
      ]
    )
  end

end
