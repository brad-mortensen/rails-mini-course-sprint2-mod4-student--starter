require "rails_helper"

RSpec.describe Employee, type: :model do
  describe "validations" do
    it "is valid" do
      employee = Employee.new(first_name: "Jeff", last_name: "Baker") 
      
      expect(employee.valid?).to be true
      expect(employee.errors.full_messages).to be_empty
    end  
    it "is invalid without first name" do
      employee = Employee.new(first_name: nil, last_name: "Baker") 
      
      expect(employee.valid?).to be false
      expect(employee.errors.full_messages).to include("First name can't be blank")
    end  
    it "is invalid without last name" do
      employee = Employee.new(first_name: "Jeff", last_name: nil) 
      
      expect(employee.valid?).to be false
      expect(employee.errors.full_messages).to include("Last name can't be blank")
    end  
  end
  describe "attributes" do
    it "has expected attributes" do
      employee = Employee.new(first_name: "Jeff", last_name: "Baker")

      expect(employee.attribute_names.map(&:to_sym)).to contain_exactly(
        :first_name,
        :last_name,
        :rewards_balance,
        :created_at,
        :updated_at,
        :id
      )
    end
  end

end
