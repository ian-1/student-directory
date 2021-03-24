school = "Villains Academy"

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

def print_header(school)
  puts "The Students of #{school}"
  puts "-------------"
end

def print_list(students)
  students.each_with_index do |student, i|
    puts "#{i + 1}) #{student[:name]} (#{student[:cohort].capitalize} cohort)"
  end
end

def print_list_letter_start(students, letter)
  i = 0
  students.each do |student|
    if student[:name][0] == letter
      puts "#{i + 1}) #{student[:name]} (#{student[:cohort].capitalize} cohort)"
      i += 1
    end
  end
end

def print_no_of_summary(students)
  puts "Overall, we have #{students.length} great students"
end

students = input_students()
print_header(school)
print_list_letter_start(students, "l")
print_no_of_summary(students)
