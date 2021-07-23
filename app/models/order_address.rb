class OrderAddress
  include ActiveModel::Model

  attr_accessor :postal_code, :prefecture, :city, :house_number, :building, :phone_number, :order_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :house_number
    validates :phone_number
    validates :order_id
  end

  def save
    order = Order.create(order_id: order_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building: building, phone_number: phone_number)
  end
end