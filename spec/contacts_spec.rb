require("rspec")
require("contacts")

describe(Contact) do

    before() do
      Contact.clear()
      @test_contact = Contact.new({:nickname => "Tyler"})
      @test_contact.save()
    end

  describe("#first_name") do
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

  describe("#add") do
    it("ads a new contact and checks its existance in the array") do
      @test_contact.add()
      expect(@test_contact.info()).to(eq([@test_contact.nickname]))
    end
  end


end
