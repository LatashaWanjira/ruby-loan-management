require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/loan_management')
require('./lib/borrow_management')
require('pry')

get('/') do
  erb(:index)
end

get('/loans/new') do
  erb(:loan_form)
end

get('/loans') do
  @loans = Loans.all()
  erb(:loans)
end

post('/loans') do
  name = params.fetch("name")
  amount = params.fetch("amount").to_i()
  loan = Loans.new(name, amount)
  loan.save()
  @int = Loans.new(name, amount).interest()
  @borrower = Loans.new(name, amount).name()
  erb(:success)
end

get('/loans/:id') do
  @loan = Loans.find(params.fetch("id"))
  erb(:loan)
end

post('/loans/:id') do
  name = params.fetch("name")
  amount = params.fetch("amount").to_i()
  loan = Loans.new(name, amount)
  loan.save()
  @interests = Loans.new(name, amount).interest()
  erb(:loan)

end



get('/borrowed/new') do
  erb(:borrow_form)
end

get('/borrowed') do
  @borrowed = Borrow.all()
  erb(:borrowed)
end

post('/borrowed') do
  name_of_lender = params.fetch("name_of_lender")
  amount_borrowed = params.fetch("amount_borrowed").to_i()
  borrow = Borrow.new(name_of_lender, amount_borrowed)
  borrow.save()
  @int1 = Borrow.new(name_of_lender, amount_borrowed).interest()
  @borrower = Borrow.new(name_of_lender, amount_borrowed).name_of_lender()
  erb(:success1)
end

get('/borrowed/:id') do
  @borrow = Borrow.find(params.fetch("id"))
  erb(:borrow)
end

post('/borrowed/:id') do
  name_of_lender = params.fetch("name_of_lender")
  amount_borrowed = params.fetch("amount_borrowed").to_i()
  borrow = Borrow.new(name_of_lender, amount_borrowed)
  borrow.save()
  @interests = Borrow.new(name_of_lender, amount_borrowed).interest()
  erb(:borrow)

end
