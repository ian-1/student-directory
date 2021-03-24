def input_students
  students = []
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  loop do
    puts "name:"
    name = gets[0...-1]
    break if name == ""
    puts "cohort:"
    cohort_string = gets.chomp
    cohort = cohort_setter(cohort_string)
    students.push({name: name, cohort: cohort})
    puts "Now we have #{students.count} students"
  end
  students
end

def cohort_setter(cohort_string)
  cohort_string = cohort_string.downcase
  cohort = :unknown
  if cohort_string[0]
    case cohort_string[0]
    when "j"
      if cohort_string[1] == "a"
        cohort = :january
      elsif cohort_string[2] == "n"
        cohort = :june
      elsif cohort_string[2] == "l"
        cohort = :july
      end
    when "f"
      cohort = :february
    when "m"
      if cohort_string[2] == "r"
        cohort = :march
      elsif cohort_string[2] == "y"
        cohort = :may
      end
    when "a"
      if cohort_string[1] == "p"
        cohort = :april
      elsif cohort_string[1] == "u"
        cohort = :august
      end
    when "s"
      cohort = :september
    when "o"
      cohort = :october
    when "n"
      cohort = :november
    when "d"
      cohort = :december
    end
  end
  cohort
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