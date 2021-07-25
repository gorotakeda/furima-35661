class OrderAddress
  include ActiveModel::Model

  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :order_id, :item_id, :user_id,
                :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :house_number
    validates :phone_number, numericality: { only_integer: true, message: 'Input only number' },
                             format: { with: /\A\d{10}$|^\d{11}\z/, message: ' is too short ' }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                   building: building, phone_number: phone_number, order_id: order.id)
  end
end
