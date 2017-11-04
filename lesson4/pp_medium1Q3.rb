class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end

# Alan noticed that this will fail when update_quantity is called. Since quantity is
# an instance variable, it must be accessed with the @quantity notation when setting it.
# One way to fix this is to change attr_reader to attr_accessor and change quantity to self.quantity.

# Is there anything wrong with fixing it this way?

=begin
My answer:
-We might want change attr_accessor :quantity to attr_writer :quantity
just in case we dont want to have the option to view the @quantity instance variable
=end


=begin
LS answer:
-If change to attr_accessor :quantity then that means that you technically can call the quantity method on
the object outside of the class and change the value if you want to.
Perhaps to avoid this possiblity we can make attr_accessor :quantity private so that it can
only be changed from within the class and not outside
=end
