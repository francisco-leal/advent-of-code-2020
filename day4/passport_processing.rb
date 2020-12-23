class Passport
  attr_accessor :byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid, :cid

  def add_field(key, value)
    self.send("#{key}=", value)
  end

  def valid?
    !byr.nil? && !iyr.nil? && !eyr.nil? && !hgt.nil? && !hcl.nil? && !ecl.nil? && !pid.nil?
  end
end

passport = Passport.new
valid_passport_count = 0

File.foreach("./input") do |line|
  if line == "\n"
    valid_passport_count += 1 if passport&.valid?
    passport = Passport.new
    next
  end

  fields = line.split(" ")
  fields.each do |field|
    key, value = field.split(":")
    passport.add_field(key, value)
  end
end

valid_passport_count += 1 if passport&.valid?

if valid_passport_count > 0
  puts "Valid passports found: #{valid_passport_count}"
else
  puts "No valid passports found."
end