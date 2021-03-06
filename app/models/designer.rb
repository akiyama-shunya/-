class Designer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
validates_presence_of :name
validates_uniqueness_of :name
def self.find_first_by_auth_conditions(warden_conditions)
conditions = warden_conditions.dup
if login = conditions.delete(:login)
where(conditions).where(["name = :value", {:value => name}]).first
else
where(conditions).first
end
end
end