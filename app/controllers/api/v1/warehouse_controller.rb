class API::V1::WarehouseController < API::ApplicationController
  def fulfilment
    order_ids = fulfilment_order_params
    orders = Order.find(order_ids)
    unfulfillable_order_ids = []

    order.each do |order|
      if order.fulfil
        next
      else
        unfulfillable_order_ids << order.id
      end
    end

    render json: {unfulfillable: unfulfillable_order_ids}
  end

  private

  def fulfilment_order_params
    params.require(:orderIds)
  end
end