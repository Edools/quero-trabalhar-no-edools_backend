module ApplicationHelper
	def flash_message
		msg = ""		
    flash.each do |key, value|
      case key
        when "error"               	        
          msg = 'sweetAlert("Oops...", "Parece haver erro em sua solicitação.", "error");'
        when "success"
    			msg = 'swal("Good job!", "Solicitação realizada com sucesso!", "success");'
      end    
    end
    javascript_tag(msg)
  end

	def error_tag(model, attribute)
	  if model.errors.has_key? attribute
	    content_tag :div, class: 'isa_error fa fa-times-circle' do        
	      "#{model.errors[attribute].first}"
	    end
	  end
	end

end