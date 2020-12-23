class Passport
  attr_accessor :byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid, :cid

  def add_field(key, value)
    self.send("#{key}=", value)
  end

  def valid?
    valid_byr? && 
    valid_iyr? &&
    valid_eyr? &&
    valid_hgt? &&
    valid_hcl? &&
    valid_ecl? &&
    valid_pid?
  end

  private

  def valid_byr?
    !byr.nil? && byr.length == 4 && byr.to_i >= 1920 && byr.to_i <= 2002
  end

  def valid_iyr?
    !iyr.nil? && iyr.length == 4 && iyr.to_i >= 2010 && iyr.to_i <= 2020
  end

  def valid_eyr?
    !eyr.nil? && eyr.length == 4 && eyr.to_i >= 2020 && eyr.to_i <= 2030
  end

  def valid_hgt?
    if !hgt.nil? && hgt.include?("cm")
      hgt_value = hgt.tr("cm", "").to_i
      hgt_value >= 150 && hgt_value <= 193
    elsif !hgt.nil? && hgt.include?("in")
      hgt_value = hgt.tr("in", "").to_i
      hgt_value >= 59 && hgt_value <= 76
    else
      false
    end
  end

  def valid_hcl?
    if !hcl.nil? && hcl[0] == "#" && hcl.length == 7
      valid_chars = true
      hcl[1..-1].each_char do |c|
        unless (c >= "0" && c <= "9") || (c >= "a" && c <= "f" )
          valid_chars = false
          break
        end
        valid_chars
      end
    else
      false
    end
  end

  def valid_ecl?
    !ecl.nil? && ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].include?(ecl)
  end

  def valid_pid?
    !pid.nil? && pid.length == 9
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