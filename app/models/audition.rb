class Audition < ActiveRecord::Base
  belongs_to :role
  def role 
    self.role
  end 

  def call_back
    self.hired.update_attribute(true)
  end
end