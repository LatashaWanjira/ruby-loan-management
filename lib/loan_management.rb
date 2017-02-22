class Loans
  @@loans = []
  $loanable_amount = 100000
  amount_plus_interest = 0

  define_method(:initialize) do |name, amount|
    @name = name
    @amount = amount
    @id = @@loans.length().+(1)
  end

  define_method(:name) do
    @name
  end

  define_method(:amount) do
    @amount
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:all) do
    @@loans
  end

  define_singleton_method(:clear) do
    @@loans = []
  end

  define_method(:save) do
    @@loans.push(self)
  end

  define_singleton_method(:can_borrow) do
    @@loans.each() do |loan|
      if loan.amount.<=(loanable_amount)
        loanable_amount = loanable_amount.-(loan.amount)
      else
        return "There isn't enough money in the account"
      end
    end
    loanable_amount
  end

  define_method(:interest) do
    amount_plus_interest= @amount.*(1.1)
  end

  # define_singleton_method (:interest) do
  #   @@loans.each() do |loan|
  #     loan.amount
  #   end
  # end

  define_singleton_method(:find) do |indetification|
    found_loan = nil
    @@loans.each() do |loan|
      if loan.id().eql?(indetification.to_i())
        found_loan = loan
      end
    end
    found_loan
  end
end
