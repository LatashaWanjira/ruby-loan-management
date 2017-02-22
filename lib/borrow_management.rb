class Borrow
  @@borrowed = []
  amount_plus_interest = 0

  define_method(:initialize) do |name_of_lender, amount_borrowed|
    @name_of_lender = name_of_lender
    @amount_borrowed = amount_borrowed
    @id = @@borrowed.length().+(1)
  end

  define_method(:name_of_lender) do
    @name_of_lender
  end

  define_method(:amount_borrowed) do
    @amount_borrowed
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:all) do
    @@borrowed
  end

  define_singleton_method(:clear) do
    @@borrowed = []
  end

  define_method(:save) do
    @@borrowed.push(self)
  end

  define_method(:interest) do
    amount_plus_interest= @amount_borrowed.*(1.1)
  end

  # define_singleton_method(:can_borrow) do
  #   @@borrowed.each() do |borrow|
  #     if borrow.amount.<=(loanable_amount)
  #       loanable_amount = loanable_amount.-(borrow.amount)
  #     else
  #       return "There isn't enough money in the account"
  #     end
  #   end
  #   loanable_amount
  # end

  define_singleton_method(:find) do |indetification|
    found_borrow = nil
    @@borrowed.each() do |borrow|
      if borrow.id().eql?(indetification.to_i())
        found_borrow = borrow
      end
    end
    found_borrow
  end
end
