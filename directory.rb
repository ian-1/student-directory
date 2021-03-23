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

def print_header()
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_list(items)
  items.each { |item| puts item }
end

def print_no_of_summary(items)
  puts "Overall, we have #{items.length} great students"
end

print_header()
print_list(students)
print_no_of_summary(students)
