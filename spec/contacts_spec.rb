require("rspec")
require("contacts")
require("email")
require("phone")
require("pry")

describe(Contact) do

    before() do
      Contact.clear()
      @test_contact = Contact.new({:nickname => "Tyler", :job => "Computer-Genius", :city => "Portland"})
      @test_contact.save()
    end

  describe("#nickname") do
    it("checks if the contact is intialized via the nickname") do
      expect(@test_contact.nickname()).to(eq("Tyler"))
    end
  end

  describe(".clear") do
    it("clears contact entries") do
      # @test_contact.save()
      Contact.clear
      expect(Contact.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves the contact nickname") do
      # @test_contact.save()
      expect(Contact.all()).to(eq([@test_contact]))
    end
  end

  describe(".find") do
    it("finds a spesific contact in an array and returns contacts nickname") do
      # @test_contact.save()
      expect(Contact.find(@test_contact.id())).to(eq(@test_contact))
    end
  end

  describe("#id") do
    it("gives each nickname an id by entry into array") do
      # @test_contact.save()
      expect(@test_contact.id()).to(eq(1))
    end
  end

  describe("#add_email") do
    it("ads an email-address from the Email-class to the email-array") do
      email = Email.new(:email_address => "hello@he.lo")
      @test_contact.add_email(email)
      expect(@test_contact.emails()).to(eq([email]))
    end
  end

  describe("#delete")do
    it("removes one specific entrz from the @@contacts array") do
      @test_contact.delete()
      expect(Contact.all()).to(eq([]))
    end
  end

end

describe(Email) do

  before() do
    Email.clear()
    @test_email = Email.new({:email_address => "none@no.one"})
    @test_email.save()
  end

  describe("#email") do
    it("returns the string of the entered email_adress") do
      expect(@test_email.email_address()).to(eq("none@no.one"))
    end
  end

  describe(".clear") do
    it("clears email entries") do
      Email.clear
      expect(Email.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves the email adress") do
      expect(Email.all()).to(eq([@test_email]))
    end
  end
  describe(".find") do
    it("finds a specific email in an array and returns contacts email") do
      expect(Email.find(@test_email.id())).to(eq(@test_email))
    end
  end

  describe("#id") do
    it("gives each email_address an id by entry into array") do
      expect(@test_email.id()).to(eq(1))
    end
  end

end

describe(Phone) do

  before() do
    Phone.clear()
    @test_phone = Phone.new({:phone_number => 5555555})
    @test_phone.save()
  end

  describe("#phone_number") do
    it("returns the number of the entered phone_number") do
      expect(@test_phone.phone_number()).to(eq(5555555))
    end
  end

  describe(".clear") do
    it("clears phone numbers") do
      Phone.clear
      expect(Phone.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves the phone numbers") do
      expect(Phone.all()).to(eq([@test_phone]))
    end
  end
  describe(".find") do
    it("finds a specific phone number in an array and returns contacts number") do
      expect(Phone.find(@test_phone.id())).to(eq(@test_phone))
    end
  end

  describe("#id") do
    it("gives each phone_number an id by entry into array") do
      expect(@test_phone.id()).to(eq(1))
    end
  end

end
