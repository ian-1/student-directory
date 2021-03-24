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
  puts "The Students of Villains Academy"
  puts "-------------"
end

def print_list(students)
  print_header()
  students.each_with_index do |student, i|
    puts "#{i + 1}) #{student[:name]} (#{student[:cohort].capitalize} cohort)"
  end
  print_no_of_summary(students.length)
end

def print_list_letter_start(students, letter)
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

def print_no_of_summary(number)
  puts "This is #{number} great students"
end

def interactive_menu(students)
  loop do
    puts "What would you like to do?"
    puts "  1) Print list of students"
    puts "  2) Print list of sudent names starting with a letter"
    puts "  9) Exit program"
    user_menu_input = gets.chomp
    print_list(students) if user_menu_input == "1"
    print_list_letter_start(students, "l") if user_menu_input == "2"
    break if user_menu_input == "9"
  end
end

students = input_students()
interactive_menu(students)