@students = [] # an empty array accesible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items 
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    puts "You exited student directory"
    exit # this will cause the program to terminate
  else
    puts "I dont't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  if name.empty?
    puts "Exit Input students"
  end
  # while the name is not empty, repeat the code
  while !name.empty? do
    #add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets .chomp
    if name.empty?
      puts "Exit Input students"
    end
  end
end

def show_students
  print_header
  print_student_list
  print_footer
  puts "List of students printed"
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end 
  file.close
  puts "New students added and saved"
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
  puts "Students file loeaded"
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil? 
    filename = "students.csv"
  end
  if File.exists?(filename) #if it exists
    load_students(filename)
    puts "loaded #{@students.count} from #{filename}"
  else # if doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
interactive_menu