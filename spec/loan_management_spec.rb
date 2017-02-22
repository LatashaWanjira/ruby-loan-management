require('rspec')
require('pry')
require('loan_management')

describe(Loans) do
  describe('.name') do
    it('returns the name of the person asking for a loan') do
      test_loan = Loans.new("Andrew", 2000)
      expect(test_loan.name()).to(eq("Andrew"))
    end
  end
  describe('.amount') do
    it('returns the amount the person asking for') do
      test_loan = Loans.new("Andrew", 2000)
      expect(test_loan.amount()).to(eq(2000))
    end
  end
  describe('.all') do
    it('it returns an empty array at first') do
      expect(Loans.all()).to(eq([]))
    end
  end

  describe('.save') do
    it('saves the new loan in the loans class') do
      test_loan = Loans.new("Andrew", 2000)
      test_loan.save()
      expect(Loans.all()).to(eq([test_loan]))
    end
  end

  describe('.find') do
    it('finds the loan from its id') do
      test_loan = Loans.new("Andrew", 50000)
      test_loan.save()
      test_loan2 = Loans.new("Moses", 10000)
      test_loan2.save()
      expect(Loans.find(test_loan.id())).to(eq(test_loan))
    end
  end

  describe('.clear') do
    it('it clears the array') do
      expect(Loans.clear()).to(eq([]))
    end
  end

  # describe('.can_borrow') do
  #   it('checks if there is enough money to loan') do
  #     Loans.clear()
  #     test_loan = Loans.new("Andrew", 1000000)
  #     test_loan.save()
  #     expect(Loans.can_borrow()).to(eq("There isn't enough money in the account"))
  #   end
  # end

  # describe('.can_borrow') do
  #   it('checks if there is enough money to loan') do
  #     Loans.clear()
  #     test_loan = Loans.new("Andrew", 50000)
  #     test_loan.save()
  #     test_loan2 = Loans.new("Moses", 10000)
  #     test_loan2.save()
  #     expect(Loans.can_borrow()).to(eq(40000))
  #   end
  # end

  describe('.interest') do
    it('returns the amount to be refunded after interest') do |variable|
      Loans.clear()
      test_loan = Loans.new("Andrew", 10000)
      test_loan.save()
      expect(test_loan.interest()).to(eq(11000))
    end
  end
end
