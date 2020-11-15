require_relative './part_1_solution.rb'


def apply_coupons(cart, coupons)

  coupons.each do |coupon|
    coupon.each do |attribute, value|
      name = coupon[:item]

      if cart[name] && cart[name][:count] >= coupon[:num]
        if cart["#{name} W/COUPON"]
          cart["#{name} W/COUPON"][:count] += 1
        else
          cart["#{name} W/COUPON"] = {:price => coupon[:cost],
          :clearance => cart[name][:clearance], :count => 1}
        end

      cart[name][:count] -= coupon[:num]
    end
  end
end
  cart
end
# def apply_coupons(cart, coupons)
#   counter = 0
#   while counter < coupons.length
#     cart_item = find_item_by_name_in_collection([coupons][counter][:item], cart)
#     coupon_item_name = "#{coupons[counter][:item]} W/COUPON"
#     cart_item_with_coupon = find_item_by_name_in_collection(coupon_item_name, cart)
#     if cart_item_with_coupon
#       cart_item_with_coupon[:count] += coupons[counter][:num]
#       cart_item[:count] -= coupons[counter][:num]
#     else
#       cart_item_with_coupon = {
#         :item => coupon_item_name,
#         :price => coupons[counter][:cost] / coupons[:counter][num],
#         :count => coupons[counter][:num],
#         :clearance => cart_item[:clearance]
#       }
#       cart << cart_item_with_coupon
#       cart_item[:count] -= coupons[counter][:num]
#       end
#       counter += 1
#     end
#   return cart
# end
#


def apply_clearance(cart)
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers

end
