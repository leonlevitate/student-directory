@students = [] #an empty array accesible to all methods

def input_students
  puts "Please enter the name of the student:"
  name = gets.chomp
  puts "What's your cohort month?"
  cohort = gets.chomp
  puts "Please enter country of birth:"
  country = gets.chomp
  puts "Please enter hobbie:"
  hobbie = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    @students << {name: name, cohort: cohort, country: country, hobbie: hobbie}
    puts "Now we have #{@students.count} students"
    #gets another name from the user
    puts "Please enter the name of the student:"
    name = gets.chomp
    puts "What's your cohort month?"
    cohort = gets.chomp
    puts "Please enter country of birth:"
    country = gets.chomp
    puts "Please enter hobbie:"
    hobbie = gets.chomp
  end
end

def interactive_menu
  loop do
  print_menu
  process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of save_students
  @students.each do |student|
  student_data = [student[:name], student[:cohort]]
  csv_line = student_data.join(",")
  file.puts csv_line
  end
  file.close
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit #this will cause the program to terminate
    else
      puts "I don't understand, please try again"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each_with_index do |student, index|
    puts "#{index + 1} #{student[:name]}, #{student[:country]}, #{student[:hobbie]}, (#{student[:cohort]} cohort)"
  end
end

def print_footer
  @students
  puts "Overall, we have #{@students.count} great students"
end

#nothing happens until we call the method:
interactive_menu
