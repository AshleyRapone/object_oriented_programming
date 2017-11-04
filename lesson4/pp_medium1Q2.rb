class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

invoice = InvoiceEntry.new('hi', 2)
puts invoice.update_quantity(3)
puts invoice.quantity

# Can you spot the mistake and how to address it?

=begin
We need attr_accessor :quantity because we need to set the @quantity instance method
to the updated_count which we cannot currently do right now becasue we only have a getter
method for :quantity and a setter method is needed as well
-we also need to replace quantity on line 11 with self.quantity so that Ruby knows we
are referencing a setter method and not a local variable
=end
