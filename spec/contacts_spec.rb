require("rspec")
require("contacts")
require("email")
require("pry")

describe(Contact) do

    before() do
      Contact.clear()
      @test_contact = Contact.new({:nickname => "Tyler"})
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
    it("finds a spesific email in an array and returns contacts email") do
      expect(Email.find(@test_email.id())).to(eq(@test_email))
    end
  end

  describe("#id") do
    it("gives each nickname an id by entry into array") do
      expect(@test_email.id()).to(eq(1))
    end
  end

end
