school = "Villains Academy"
students = [ 
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]

def print_header(school)
  puts "The students of #{school}"
  puts "-------------"
end

def print_list(students)
  students.each { |student| puts student }
end

def print_no_of_summary(students)
  puts "Overall, we have #{students.length} great students"
end

print_header(school)
print_list(students)
print_no_of_summary(students)
