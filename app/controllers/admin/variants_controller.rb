class Admin::VariantsController < Admin::BaseController
  def new
    @variant = Variant.new
    @product_id = params[:product_id]
    @product_name = params[:product_name]
  end

  def create
    @variant = Variant.new(variant_params)
    @variants = Variant.all
    @product_id = params[:variant][:product_id]
    @product_name = params[:variant][:product_name]
    if item = @variants.where(size: params[:variant][:size_id], color: params[:variant][:color_id], product_id: params[:variant][:product_id]).first
      item.quantity += params[:variant][:quantity].to_i
      item.save
      redirect_to admin_products_path, notice: "Pomyślnie zaktualizowano liczbę sztuk."
    else
      if @variant.save
        redirect_to admin_products_path, notice: "Pomyślnie dodano wariant produktu."
      else
        render action: :new
      end
    end
  end

  def edit
    @variant = Variant.find(params[:id])
    @product_id = params[:product_id]
    @product_name = params[:product_name]
  end

  def update
    @variant = Variant.find(params[:id])
    @product_id = params[:variant][:product_id]
    @product_name = params[:variant][:product_name]
    if @variant.update_attributes(variant_params)
      redirect_to admin_products_path, notice: "Pomyślnie zmieniono wariant produktu."
    else
      render action: :edit
    end
  end

  private

  def variant_params
    params.require(:variant).permit(
      :size_id,
      :color_id,
      :quantity,
      :product_id
    )
  end
end
