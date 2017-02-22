require('rspec')
require('pry')
require('borrow_management')

describe(Borrow) do
  describe('.name_of_lender') do
    it('returns the name of the person who gave the loan') do
      test_borrow = Borrow.new("Moses", 2000)
      expect(test_borrow.name_of_lender()).to(eq("Moses"))
    end
  end
  describe('.amount_borrowed') do
    it('returns the amount you are asking for') do
      test_borrow = Borrow.new("Moses", 2000)
      expect(test_borrow.amount_borrowed()).to(eq(2000))
    end
  end
  describe('.all') do
    it('it returns an empty array at first') do
      expect(Borrow.all()).to(eq([]))
    end
  end

  describe('.save') do
    it('saves the new loan in the Borrow class') do
      test_borrow = Borrow.new("Moses", 2000)
      test_borrow.save()
      expect(Borrow.all()).to(eq([test_borrow]))
    end
  end

  describe('.find') do
    it('finds the loan from its id') do
      test_borrow = Borrow.new("Moses", 50000)
      test_borrow.save()
      test_borrow2 = Borrow.new("Moses", 10000)
      test_borrow2.save()
      expect(Borrow.find(test_borrow.id())).to(eq(test_borrow))
    end
  end

  describe('.clear') do
    it('it clears the array') do
      expect(Borrow.clear()).to(eq([]))
    end
  end

  # describe('.can_borrow') do
  #   it('checks if there is enough money to loan') do
  #     Borrow.clear()
  #     test_borrow = Borrow.new("Moses", 1000000)
  #     test_borrow.save()
  #     expect(Borrow.can_borrow()).to(eq("There isn't enough money in the account"))
  #   end
  # end

  # describe('.can_borrow') do
  #   it('checks if there is enough money to loan') do
  #     Borrow.clear()
  #     test_borrow = Borrow.new("Moses", 50000)
  #     test_borrow.save()
  #     test_borrow2 = Borrow.new("Cornellius", 10000)
  #     test_borrow2.save()
  #     expect(Borrow.can_borrow()).to(eq(40000))
  #   end
  # end

  describe('.interest') do
    it('returns the amount to be refunded after interest') do |variable|
      Borrow.clear()
      test_borrow = Borrow.new("Moses", 10000)
      test_borrow.save()
      expect(test_borrow.interest()).to(eq(11000))
    end
  end
end
