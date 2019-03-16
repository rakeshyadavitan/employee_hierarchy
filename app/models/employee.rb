class Employee < ApplicationRecord
	
	has_many :manager_subs, class_name: 'Employee', foreign_key: :manager_id
  belongs_to :manager, class_name: 'Employee', foreign_key: :manager_id, optional: true
  
  has_many :director_subs, class_name: 'Employee', foreign_key: :director_id
  belongs_to :director, class_name: 'Employee', foreign_key: :director_id, optional: true
  
  has_many :vp_subs, class_name: 'Employee', foreign_key: :vp_id
  belongs_to :vp, class_name: 'Employee', foreign_key: :vp_id, optional: true
  
  scope :ceo, -> { where(manager_id: nil, director_id: nil, vp_id: nil) }
  
  scope :active_employees, -> {where(resign: false)}


end
