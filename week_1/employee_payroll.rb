
class Employee
	attr_accessor :name, :email
	def initialize(name, email)
		@name=name
		@email=email
	end

end
class HourlyEmployee<Employee
	attr_accessor :hourly_pay, :hours_week
	def initialize(name, email,hourly_pay,hours_week)
		
   		super(name,email)
		@hourly_pay=hourly_pay
		@hours_week=hours_week
	end
	def calculate_salary      #Calculates the weekly salary
      hours_week * hourly_pay
    end
end

class SalariedEmployee< Employee
	attr_accessor :yearly_salary
	def initialize(name,email,yearly_salary)
		super(name,email)
		@yearly_salary=yearly_salary
	end
	def calculate_salary
		yearly_salary/52 #Returns weekly employee salary
	end

end

class MultiPaymentEmployee< SalariedEmployee
	attr_accessor :hourly_rate, :hours_week

	def initialize(name,email,yearly_salary,hourly_rate,hours_week)
		super(name,email,yearly_salary)
		@hourly_rate=hourly_rate
		@hours_week=hours_week
	end
end

	# super.calculate_salary  #To know employee weekly salary
	def calculate_salary
		if hours_week<=40
			super
		elsif hours_week>40
			super + (hourly_rate*(hours_week-40))

		else
			puts "Please enter a valid hours work on the week"

	   end
    end

class Payroll
	attr_accessor :employees
    def initialize(employees)
        @employees = employees
    end


  def pay_employees
      # Should output how much we're paying each employee for this week and the total amount spent on payroll this week. 

      # @employees.push(employees)
      
      employees.each do |hm|
		puts "Employee: #{hm.name}, weekly salary: #{hm.calculate_salary}"
	end
     

      total_salary=@employees.reduce(0.0) do |sum, hm|
				     sum + hm.calculate_salary

      end
      total_salary+=(total_salary*0.18)
      puts "The total salary of the employees this week is #{total_salary}"
  end
  
  	def notify_employee(employee)
         
        
        employee.each do |hm|
        	if(hm.calculate_salary>0)
         	puts "#{hm.name}, we send you an email to #{hm.email} with your payroll"
            else
         	puts "we have in our records that #{hm.name} doesn't have a payroll this week"
            end	
 	    end
  
     end
end


josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)
nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)
ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)
berta= HourlyEmployee.new('Berta','bertaloca@yahoo.com',35,0)
employee_payroll=[]
employee_payroll.push(josh)
employee_payroll.push(nizar)
employee_payroll.push(ted)
employee_payroll.push(berta)
my_Payroll=Payroll.new(employee_payroll)
my_Payroll.pay_employees
my_Payroll.notify_employee(employee_payroll)