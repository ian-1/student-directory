school = "Villains Academy"
students = [ 
  { name: "Dr. Hannibal Lecter", cohort: :november},
  { name: "Darth Vader", cohort: :november},
  { name: "Nurse Ratched", cohort: :november},
  { name: "Michael Corleone", cohort: :november},
  { name: "Alex DeLarge", cohort: :november},
  { name: "The Wicked Witch of the West", cohort: :november},
  { name: "Terminator", cohort: :november},
  { name: "Freddy Krueger", cohort: :november},
  { name: "The Joker", cohort: :november},
  { name: "Joffrey Baratheon", cohort: :november},
  { name: "Norman Bates", cohort: :november}
]

def print_header(school)
  puts "The Students of #{school}"
  puts "-------------"
end

def print_list(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort].capitalize} cohort)"
  end
end

def print_no_of_summary(students)
  puts "Overall, we have #{students.length} great students"
end

print_header(school)
print_list(students)
print_no_of_summary(students)
