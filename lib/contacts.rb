class Contact
  attr_reader(:nickname, :info)
  @@contacts = []


  define_method(:initialize) do |attributes|
    @nickname = attributes.fetch(:nickname)
    @contact_id = @@contacts.length().+(1)
    @info = []
  end

  define_singleton_method(:all) do
    @@contacts
  end

  define_method(:save) do
    @@contacts.push(self)
  end

  define_singleton_method(:clear) do
    @@contacts = []
  end

  define_method(:id) do
    @contact_id
  end

  define_singleton_method(:find) do |identification|
    found_contact = nil
    @@contacts.each() do |contact|
      if contact.id() == identification.to_i
        found_contact = contact
      end
    end
    found_contact
  end

  define_method(:add) do
    @info.push(@nickname)
  end

end
