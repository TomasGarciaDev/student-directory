def input_students
    puts "Please enter the name of the students"
    puts "To finish, just hit return twice"
    name = gets.chomp
    
    puts "Please enter the country of the students"
    puts "To finish, just hit return twice"
    country = gets.chomp
    
    puts "Please enter the height of the students"
    puts "To finish, just hit return twice"
    height = gets.chomp

    students = []

  while !name.empty? || !country.empty? || !country.empty do
    students << {name: name, country: country, height: height, cohort: :november}
    puts "Now we have #{students.count} students"
    
    puts "Please enter the name of the students"
    puts "To finish, just hit return twice"
    name = gets.chomp
    if name.empty?
      break
    end
    
    puts "Please enter the country of the students"
    puts "To finish, just hit return twice"
    country = gets.chomp
    if country.empty?
      break
    end
    
    puts "Please enter the height of the students"
    puts "To finish, just hit return twice"
    height = gets.chomp.to_s
    if height.empty?
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
    puts "#{student[:name]} from #{student[:country]} is #{student[:height]} height (#{student[:cohort]} cohort)"
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