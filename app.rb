require "sinatra"
require "sinatra/reloader"

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
@the_num = params.fetch("users_number").to_f

@the_result = @the_num**2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do
  @the_num = params.fetch("user_number").to_f

  @the_result = Math.sqrt(@the_num)

  erb(:square_root_results)
end

get("/random/new") do
  erb(:random_with_form)
end

get("/random/results") do
  @the_min = params.fetch("user_min").to_f
  @the_max = params.fetch("user_max").to_f

  @the_result = rand(@the_min..@the_max)

  erb(:random_results)
end

get("/payment/new") do
  erb(:payment_calc)
end

get("/payment/results") do
  apr = params.fetch("user_apr").to_f
  @apr = apr.to_fs(:percentage, { precision: 4 })
  monthly_interest_rate = apr/100/12

  @num_of_years = params.fetch("user_years").to_i
  num_monthly_payments = @num_of_years * 12

  principal = params.fetch("user_pv").to_f
  @principal = principal.to_fs(:currency)

  numerator = monthly_interest_rate * principal
  denominator = 1 - (1 + monthly_interest_rate)**-num_monthly_payments
  @payment = (numerator/denominator).to_fs(:currency)

  erb(:payment_results)

end


get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
