class GreetingsController < ApplicationController
  def index
  end

  def create
    @first_name, @last_name = params[:f], params[:l]

  operate

  end


   def operate
    if ['upcase', 'reverse'].include?(params[:operation])
    @first_name.send("#{params[:operation]}!")
    @last_name.send("#{params[:operation]}!")
    end
  end

  def upcase_full_name
    @fisrt_name = params[f].upcase!
    @last_name = params[l].upcase!
  end

  def reverse_full_name
    @first_name = params[f].reverse!
    @last_name = params[l].reverse!
  end
end


 # if params[:upcase]
    #@first_name.upcase!
    #@last_name.upcase!
  #end

 # if params[:backward]
    #@first_name.reverse!
    #@last_name.reverse!
  #end
