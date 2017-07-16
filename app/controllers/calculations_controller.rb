class CalculationsController < ApplicationController
    
    def flex_square
        # The incoming parameters for this action look like {"a_number" => "5"}
        # Rails stores that has in a variable called params
        
        @user_input = params["a_number"].to_i
        @squared_number = @user_input**2
        
        render("calculations/flexible_square_template.html.erb")
    end
    
    def flex_square_root
        @user_input = params["a_number"].to_i
        @square_root = @user_input**0.5
        
    render("calculations/flexible_square_root_template.html.erb")
    end
    
    def flex_payment
        @basis_points = params["basis_points"].to_f
        @number_of_years = params["number_of_years"].to_i
        @present_value = params["present_value"].to_f
        monthly_rate = @basis_points/120000
        num_months = @number_of_years*12
        ### Calc: P = r(PV) / (1-(1+r)^-n)
        
        @monthly_payment = ((monthly_rate*@present_value)/ (1 - (1+monthly_rate)**-num_months)).round(2)
    
    render("calculations/flexible_payment_template.html.erb")
    end
    
    def flex_random_number
        @minn = params["minn"].to_i
        @maxx = params["maxx"].to_i
        @random_number = rand(@minn..@maxx)
    render("calculations/flexible_random_number_template.html.erb")
    end
    
    ##################### Form Elements ###########################
    
    ######## Square Calc Form
    def square_form
    
    render("calculations/square_form_template.html.erb")
    end
    
    def process_square
        @user_input = params["the_user_number"].to_f
        @processed_square = @user_input**2
    render("calculations/process_square_template.html.erb")
    end
    
    ######## Square Root Calc Form
    def square_root_form
    
    render("calculations/square_root_form_template.html.erb")
    end
    
    def process_square_root
        @user_input = params["the_user_number"].to_f
        @processed_square_root = @user_input**0.5
    render("calculations/process_square_root_template.html.erb")
    end
    
    ######## Loan Payment Form
    def payment_form
        render("calculations/payment_form_template.html.erb")
    end
    
    def process_payment
        @pct_points = params["user_apr"].to_f
        @number_of_years = params["user_years"].to_i
        @present_value = params["user_principal"].to_f
        monthly_rate = @pct_points/1200
        num_months = @number_of_years*12
        ### Calc: P = r(PV) / (1-(1+r)^-n)
        
        @monthly_payment = ((monthly_rate*@present_value)/ (1 - (1+monthly_rate)**-num_months)).round(2)
        
        render("calculations/process_payment_template.html.erb")
    end
    
    
    
    ######## Random Number Form
end
