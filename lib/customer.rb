class Customer

  require 'csv'

  attr_reader :id
  attr_accessor :email, :address

  def initialize(id, email, address)
    @id = id
    @email = email
    @address = address
  end

  # Return array of Customer instances from CSV
  def self.all
    customers = []

    CSV.read('data/customers.csv').each do |customer|

      id = customer[0].to_i
      email = customer[1]
      address = {
        street: customer[2],
        city: customer[3],
        state: customer[4],
        zip: customer[5]
      }

      customers << Customer.new(id, email, address)
    end

    return customers
  end

  # Return Customer instance from customer id
  def self.find(id)
    customers = Customer.all

    customers.find do |customer|
      customer.id == id
    end
  end

end
