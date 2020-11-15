require_relative './part_1_solution.rb'

def apply_coupons(cart, coupon_array)
  if cart.size == 0
    return cart
  elsif coupon_array.size == 0
    return cart
  else
    consolidated_coupons_hash = {}
    coupon_array.each do |coupon|
      item_name = coupon[:item]
      if consolidated_coupons_hash.key?(item_name) == false
        coupon = coupon.merge({coupon_count: 1})
        consolidated_coupons_hash[item_name] = coupon
      else
          consolidated_coupons_hash[item_name][:num] += coupon[:num]
          consolidated_coupons_hash[item_name][:coupon_count] += 1
      end
    end
    consolidated_coupons_hash.each do |consolidated_key, value|
      if cart.key?(consolidated_key)
        consolidated_coupon_number = consolidated_coupons_hash[consolidated_key][:num]
        cart_item_count = cart[consolidated_key][:count]
        coupon_item_price = consolidated_coupons_hash[consolidated_key][:cost]
        coupon_count = consolidated_coupons_hash[consolidated_key][:coupon_count]
        cart_item_count_after_coupon = cart_item_count - consolidated_coupon_number
        cart_item_clearance = cart[consolidated_key][:clearance]

        cart[consolidated_key][:count] = cart_item_count_after_coupon
        cart["#{consolidated_key} W/COUPON"] = {price: coupon_item_price, clearance: cart_item_clearance, count: coupon_count}
        #if cart[consolidated_key][:count] == 0
          #cart.delete(consolidated_key)
        #end
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
#     if cart_item && cart_item[:count] >= coupons[counter][:num]
#       if cart_item_with_coupon
#         cart_item_with_coupon[:count] += coupons[counter][:num]
#         cart_item[:count] -= coupons[counter][:num]
#       else
#         cart_item_with_coupon = {
#           :item => coupon_item_name,
#           :price => coupons[counter][:cost] / coupons[:counter][num],
#           :count => coupons[counter][:num],
#           :clearance => cart_item[:clearance]
#         }
#         cart << cart_item_with_coupon
#         cart_item[:count] -= coupons[counter][:num]
#       end
#     end
#     counter += 1
#   end
#   cart
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
  cart.keys.each do |item|
   if cart[item][:clearance]
     cart[item][:price] = (cart[item][:price]* 0.8).round(2)
   end
 end
 cart
end
