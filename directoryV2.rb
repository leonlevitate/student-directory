#Print the menu and ask the user what to do:
def interactive_menu
  students = []
  loop do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
  #read the input and save it into a variable:
  selection = gets.chomp
  #do what the user has asked:
    case selection
    when "1"
    students = input_students
    when "2"
    print_header
    print(students)
    print_footer(students)
    when "9"
    exit #this will cause the program to terminate
    else
    puts "I don't understand, please try again"
    end
  end
end
#1. Added the index+1 to print number of line
def input_students
  puts "Please enter the name of the student:"
  name = gets.chomp
  puts "What's your cohort month?"
  cohort = gets.chomp
  puts "Please enter country of birth:"
  country = gets.chomp
  puts "Please enter hobbie:"
  hobbie = gets.chomp
  #create an empty array
  students = []

  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: cohort, country: country, hobbie: hobbie}
    puts "Now we have #{students.count} students"
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
  #return the array of students
students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
#7.if students.has_value?(:cohort) false do

  #if student[0] == "L"
    puts "#{index + 1} #{student[:name]}, #{student[:country]}, #{student[:hobbie]}, (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

#nothing happens until we call the methods
interactive_menu
students = input_students
print_header
print(students)
print_footer(students)
