# frozen_string_literal: true

def input_students
  students = []
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'
  loop do
    puts 'name:'
    name = gets[0...-1]
    break if name == ''

    puts 'cohort:'
    cohort = :unknown
    loop do
      cohort_string = gets.chomp
      cohort = cohort_setter(cohort_string)
      break if cohort != :unknown

      puts 'please enter month of cohort:'
    end
    students.push({ name: name, cohort: cohort })
    puts "Now we have #{students.count} students"
  end
  students
end

def cohort_setter(cohort_string)
  cohort_return = :unknown
  cohorts = [
    ['ja', :january],
    ['f', :february],
    ['mar', :march],
    ['ap', :april],
    ['may', :may],
    ['jun', :june],
    ['jul', :july],
    ['au', :august],
    ['s', :september],
    ['o', :october],
    ['n', :november],
    ['d', :december]
  ]
  cohorts.each do |cohort|
    cohort_return = cohort[1] if cohort_string.downcase[0...cohort[0].length] == cohort[0]
  end
  cohort_return
end

def print_header
  puts ''.center(50, '°')
  puts 'The Students of Villains Academy'.center(50)
  puts ''.center(10, '-').center(50)
end

def print_no_of_summary(number)
  puts "This is #{number} great students".center(50)
  puts ''.center(50, '°')
end

def print_list(students)
  print_header
  students.each_with_index do |student, i|
    puts "#{i + 1}) #{student[:name]} (#{student[:cohort].capitalize} cohort)"
  end
  print_no_of_summary(students.length)
end

def letter_from_user
  puts 'Enter letter you would like to search for:'
  gets.chomp
end

def print_list_letter_start(students)
  letter = letter_from_user
  print_header
  i = 0
  students.each do |student|
    if student[:name][0] == letter
      puts "#{i + 1}) #{student[:name]} (#{student[:cohort].capitalize} cohort)"
      i += 1
    end
  end
  print_no_of_summary(i)
end

def characters_from_user
  puts 'Enter how many characters for your maximun:'
  gets.chomp
end

def print_list_shorter_than(students)
  chars = characters_from_user
  print_header
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
  print_header
  i = 0
  until i == students.length
    puts "#{i + 1}) #{students[i][:name]} (#{students[i][:cohort].capitalize} cohort)"
    i += 1
  end
  print_no_of_summary(students.length)
end

def cohort_from_user
  puts 'Enter the cohort you would like to print list for:'
  cohort = :unknown
  loop do
    cohort_string = gets.chomp
    cohort = cohort_setter(cohort_string)
    break if cohort != :unknown

    puts 'please enter month of cohort:'
  end
  cohort
end

def print_list_by_cohort(students)
  cohort = cohort_from_user
  print_header
  i = 0
  students.each do |student|
    if student[:cohort] == cohort
      puts "#{i + 1}) #{student[:name]} (#{student[:cohort].capitalize} cohort)"
      i += 1
    end
  end
  print_no_of_summary(i)
end

def print_menu
  puts 'What would you like to do?'
  puts '  1) Print list of students'
  puts '  2) Print list of sudent names starting with a letter'
  puts '  3) Print list of students (using until loop)'
  puts '  4) Print names shorter than X characters'
  puts '  5) Print list by cohort'
  puts '  9) Exit program'
end

def act_on_menu_input(students, input)
  case input
  when '1'
    print_list(students)
  when '2'
    print_list_letter_start(students)
  when '3'
    print_list_until_loop(students)
  when '4'
    print_list_shorter_than(students)
  when '5'
    print_list_by_cohort(students)
  else
    puts "Sorry, I didn't understand your selection".center(50, '😟')
  end
end

def interactive_menu(students)
  loop do
    print_menu
    user_menu_input = gets.chomp
    break if user_menu_input == '9'

    act_on_menu_input(students, user_menu_input)
  end
end

students = input_students
interactive_menu(students)
