class Email
  attr_reader(:email_address, :email_info)
  @@emails = []

  define_method(:initialize) do |attributes|
    @email_address = attributes.fetch(:email_address)
    @email_id = @@emails.length().+(1)
    @email_info = []
  end

  define_singleton_method(:all) do
    @@emails
  end

  define_method(:save) do
    @@emails.push(self)
  end

  define_singleton_method(:clear) do
    @@emails = []
  end

  define_method(:id) do
    @email_id
  end

  define_singleton_method(:find) do |identification|
    found_email = nil
    @@emails.each() do |email|
      if email.id() == identification.to_i
        found_email = email
      end
    end
    found_email
  end

  define_method(:add) do
    @email_info.push(@email)
  end
end
