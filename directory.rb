def input_students
  students = []
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  loop do
    name = gets.chomp
    break if name == ""
    students.push({name: name, cohort: :november})
    puts "Now we have #{students.count} students"
  end
  students
end

def print_header()
  puts "".center(50, "°")
  puts "The Students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print_no_of_summary(number)
  puts "This is #{number} great students".center(50)
  puts "".center(50, "°")
end

def print_list(students)
  print_header()
  students.each_with_index do |student, i|
    puts "#{i + 1}) #{student[:name]} (#{student[:cohort].capitalize} cohort)"
  end
  print_no_of_summary(students.length)
end

def print_list_letter_start(students)
  puts "Enter letter you would like to search for:"
  letter = gets.chomp
  print_header()
  i = 0
  students.each do |student|
    if student[:name][0] == letter
      puts "#{i + 1}) #{student[:name]} (#{student[:cohort].capitalize} cohort)"
      i += 1
    end
  end
  print_no_of_summary(i)
end

def print_list_shorter_than(students)
  puts "Enter how many characters for your maximun:"
  chars = gets.chomp
  print_header()
  i = 0
  students.each do |student|
    if student[:name].length <= chars.to_i
      puts "#{i + 1}) #{student[:name]} (#{student[:cohort].capitalize} cohort)"
      i += 1
    end
  end
  print_no_of_summary(i)
end

def print_list_until_loop(students)
  print_header()
  i = 0
  until i == students.length do
    puts "#{i + 1}) #{students[i][:name]} (#{students[i][:cohort].capitalize} cohort)"
    i += 1
  end
  print_no_of_summary(students.length)
end

def interactive_menu(students)
  loop do
    puts "What would you like to do?"
    puts "  1) Print list of students"
    puts "  2) Print list of sudent names starting with a letter"
    puts "  3) Print list of students (using until loop)"
    puts "  4) Print names shorter than X characters"
    puts "  9) Exit program"
    user_menu_input = gets.chomp
    case user_menu_input
    when "1"
      print_list(students)
    when "2"
      print_list_letter_start(students)
    when "3"
      print_list_until_loop(students)
    when "4"
      print_list_shorter_than(students)
    when "9"
      break
    else
      puts "Sorry, I didn't understand your selection".center(50, "😟")
    end
  end
end

students = input_students()
interactive_menu(students)