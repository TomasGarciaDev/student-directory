def input_students
  puts "Please enter the name of the students"
  puts "To finish, type 'stop'"
  name = gets.strip.capitalize
  if name.empty?
    name = "Unknown name"
  end
  
  puts "Please enter the cohort of the students"
  puts "To finish, type 'stop'"
  cohort = gets.strip.downcase.to_sym
    if cohort.empty?
      cohort = "Unknown"
    end

  students = []

  while true do
    #add the student hash to the array
    students << {name: name, cohort: cohort}
    if students.count == 1
        puts "Overall, we have #{students.count} great student"
      else
        puts "Overall, we have #{students.count} great students"
      end
    # get another name from the user
    puts "Please enter the name of the students"
    puts "To finish, type 'stop'"
    name = gets.strip.capitalize
    if name.empty?
      name = "Unknown name"
    elsif name == "Stop"
      break
    end
    
    puts "Please enter the cohort of the students"
    puts "To finish, type 'stop'"
    cohort = gets.strip.downcase.to_sym
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
  student_by_cohort = {}
  students.map do |student|
    cohort = student[:cohort]
    name = student[:name]

    if student_by_cohort[cohort] == nil
      student_by_cohort[cohort] = []
    end

    student_by_cohort[cohort].push(name)
  end
  student_by_cohort.map do |cohort, name|
    puts "For the #{cohort.capitalize} cohort we have: "
    name.each do |each_name|
      puts each_name
    end
  end
end

def print_footer(students)
  if students.count == 1
    puts "Overall, we have #{students.count} great student"
  else
    puts "Overall, we have #{students.count} great students"
  end
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)