class UsersController < ApplicationController
  def index
    @users=User.all
  end
  
  def new
  end
  
  def create
    User.create(
                name: params[:name],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation],
                age: params[:age],
                phone_num: params[:phone_num],
                address: params[:address],
                type_career_1: params[:type_career_1],
                type_term_1: params[:type_term_1],
                type_career_2: params[:type_career_2],
                type_term_2: params[:type_term_2], 
                type_career_3: params[:type_career_3],
                type_term_3: params[:type_term_3]
                
                )
                
    redirect_to :root
  end
  
  def show
    @user= User.find(params[:id])
  end
  
  def edit
    @id = params[:id]
    @user= User.find(@id)
    
=begin
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    @user.age = params[:age]
    @user.phone_num = params[:phone_num]
    @user.career = params[:career]
    @user.save
=end
  end
  def update
    @user = User.find(params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    @user.age = params[:age]
    @user.phone_num = params[:phone_num]
    @user.address = params[:address]
    @user.type_career_1 = params[:type_career_1]
    @user.type_term_1=params[:type_term_1]
    @user.type_career_2 = params[:type_career_2]
    @user.type_term_2=params[:type_term_2]
    @user.type_career_3 = params[:type_career_3]
    @user.type_term_3=params[:type_term_3]
    @user.save
  end
end
