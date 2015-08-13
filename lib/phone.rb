class Phone
  attr_reader(:phone_number, :phone_info)
  @@phone_numbers = []

  define_method(:initialize) do |attributes|
    @phone_number = attributes.fetch(:phone_number)
    @phone_id = @@phone_numbers.length().+(1)
  end

  define_singleton_method(:all) do
    @@phone_numbers
  end

  define_method(:save) do
    @@phone_numbers.push(self)
  end

  define_singleton_method(:clear) do
    @@phone_numbers = []
  end

  define_method(:id) do
    @phone_id
  end

  define_singleton_method(:find) do |identification|
    found_number = nil
    @@phone_numbers.each() do |phone|
      if phone.id() == identification.to_i
        found_number = phone
      end
    end
    found_number
  end

end
