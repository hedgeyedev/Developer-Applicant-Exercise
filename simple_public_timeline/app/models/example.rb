class Example 
  include Mongoid::Document
  
  field :name, type: String
  field :email, type: String
  field :description, type: String
  field :project, type: String
  field :revision, type: Integer
  field :user, type: String
  
  validates_presence_of :name
  validates_uniqueness_of :user
  validates_length_of :name, :minimum => 6
  validates_length_of :name, :maximum => 249
  validates_length_of :user, :minimum => 4
  validates_length_of :user, :maximum => 20
  validates_numericality_of :revision, :only_integer => true, :greater_than_or_equal_to => 0
  
  # attr_accessible :name, :description, :project, :revision, :user
  attr_protected :email
  
  before_create :assign_email



	private
		def assign_email
      self.email = self.user + "@gmail.com"
		end
end