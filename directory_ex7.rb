def input_students
  puts "Please enter the name of the students"
  puts "To finish, type 'stop'"
  name = gets.chomp.capitalize
  if name.empty?
    name = "Unknown name"
  end
  
  puts "Please enter the cohort of the students"
  puts "To finish, type 'stop'"
  cohort = gets.chomp.downcase.to_sym
    if cohort.empty?
      cohort = "Unknown"
    end

  students = []

  while true do
    #add the student hash to the array
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Please enter the name of the students"
    puts "To finish, type 'stop'"
    name = gets.chomp.capitalize
    if name.empty?
      name = "Unknown name"
    elsif name == "Stop"
      break
    end
    
    puts "Please enter the cohort of the students"
    puts "To finish, type 'stop'"
    cohort = gets.chomp.downcase.to_sym
    if cohort.empty?
      cohort = "Unknown"
    elsif cohort == :stop
      break
    end
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)