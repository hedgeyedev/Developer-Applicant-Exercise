class Api::ApisController < ApplicationController
  
  # rescue_from Mongoid::Errors::MassAssignmentSecurity do |error|
  #   render :json => { :error => "mass_assignment", 
  #                     :errors => error.to_s,
  #                     :code => 10, 
  #                     :message => "Mass Assignment deals with the problem of trying to assign a value onto a protected attribute",
  #                     :status => "failed"
  #                   }, :status => 400 and return
  # end
  
  # rescue_from Mongoid::Errors::ActiveRecordError do |error|
  #   render :json => { :error => "generic_error",
  #                     :code => 0, 
  #                     :errors => error.message,
  #                     :message => "Generic Error occured. Not sure where the error occured but the :errors variable might be of some help",
  #                     :status => "failed"
  #                   }, :status => 400 and return
  # end
    
    
    
    
  rescue_from BSON::InvalidObjectId do |error|
    render :json => { :error => "invalid_find", 
                      :errors => error.message,
                      :code => 10, #
                      :message => "Passed in id is not formatted correctly.", 
                      :status => "failed"
                    }, :status => 400 
  end
    
  rescue_from Mongoid::Errors::InvalidFind do |error| 
    render :json => { :error => "invalid_find", 
                      :errors => error.message,
                      :code => 10, #
                      :message => "Passed in id is not formatted correctly.", 
                      :status => "failed"
                    }, :status => 400 
  end
  rescue_from Mongoid::Errors::Validations do |error|
    render :json => { :error => "record_invalid", 
                      :errors => error.instance_values['document'].errors,
                      :code => 11, #
                      :message => "Record Invalid deals with a problem with the passed in parameters. Errors should hint at the problem", 
                      :status => "failed"
                    }, :status => 400 
  end
  
  rescue_from Mongoid::Errors::DocumentNotFound  do |error|    
    render :json => { :error => "record_not_found", 
                      :errors => error.message,
                      :code => 12, 
                      :message => "Record Not Found deals with a problem of the id request not being found in the persisted data store", 
                      :status => "failed"
                    }, :status => 400 
  end

  # Used for dates and stuff?!
  # rescue_from ActiveRecord::MultiparameterAssignmentErrors do |error|
  #   render :json => {:error => "multiparameter_assignment_errors", :code => 12, :message => error.message }, :status => 400 and return
  # end
  #   Raised when an error occurred while doing a mass assignment to an attribute through the attributes= method. 
  # The exception has an attribute property that is the name of the offending attribute.
  # rescue_from ActiveRecord::AttributeAssignmentError do |error|
  #   render :json => {:error => "attribute_assignment_error", :code => 13, :message => error.message }, :status => 400 and return
  # end
  
end