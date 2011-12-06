module Extensions
  module SimpleForm
    module FormBuilder
    end
  end
end

SimpleForm::FormBuilder.send :include, Extensions::SimpleForm::FormBuilder