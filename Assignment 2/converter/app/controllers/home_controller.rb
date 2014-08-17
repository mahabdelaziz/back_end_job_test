class HomeController < ApplicationController
  def index

  	@avaible_converters = ConverterBase.subclasses.map(&:converter_name)

  	if params[:from] 
  		if @avaible_converters.include?(params[:converter_klass])
	  		if params[:from] =~ /\A[-+]?[0-9]+\z/ # is a number
		  		converter_klass = params[:converter_klass].classify.constantize
		  		converter = converter_klass.new
		  		@to_val = converter.convert(params[:from].to_i)
		  		@from_val = params[:from]
		  	else
		  		@error = "Please enter a number"
	  		end
	  	else
	  		@error = "This converter is not avaible"
	  	end
  	end
  end
end
