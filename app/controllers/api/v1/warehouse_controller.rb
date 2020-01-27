class API::V1::WarehouseController < API::ApplicationController
  def fulfilment
    order_ids = fulfilment_order_params
    orders = Order.find(order_ids)
    unfulfillable_order_ids = []

    orders.each do |order|
      if order.fulfil
        next
      else
        order.update_attribute :status, 'Error: Unfulfillable'
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