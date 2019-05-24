@students = [] #an empty array accesible to all methods

def input_students
  puts "Please enter the name of the students:"
  puts "To finish, just hit Enter twice"
  name = STDIN.gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    @students << {
      name: name,
      cohort: valid_cohort?(get_cohort),
      country: :"Evil Land",
      hobbies: :Badminton
    }
    #adding variable statement for single student:
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    #gets another name from the user
    name = STDIN.gets.chomp
  end
end

def get_cohort
  puts "Please enter student's cohort (e.g July):"
  cohort = gets.chomp.to_sym
end

def valid_cohort?(cohort)
  cohort_options = [
    :January, :February, :March, :April, :May, :June,
    :July, :August, :September, :October, :November,
    :December
  ]
  if cohort.empty?
    return "November"
  elsif cohort_options.include?(cohort)
    return cohort
  else
    puts "Please check the spelling"
    cohort = valid_cohort?(get_cohort)
  end
end

def interactive_menu
  loop do
  print_menu
  process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "5. Choose a cohort to view"
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

def try_load_students
  filename = ARGV.first #first argument from the command line
  return if filename.nil? #get out of the method if it isn't given
  if File.exists?(filename) #if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else #if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit #quits the program
  end
end
#load_students will load from students.csv by default
#load_students(list.txt) will load from list.txt
def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
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
    when "4"
      load_students
    when "5"
      print_cohort
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
    puts "#{index + 1} #{student[:name]} (#{student[:cohort]} cohort) #{student[:country]}, #{student[:hobbies]}".center(30)
  end
end

def print_cohort
  puts "Which cohort would you like to view?"
  cohort_input = STDIN.gets.chomp.to_sym
  while cohort_input == :cohort
  @students.map { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)"}
end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

#nothing happens until we call the methods:
try_load_students
interactive_menu
