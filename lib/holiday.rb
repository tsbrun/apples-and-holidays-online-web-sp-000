require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter].each do |holiday_name, supply_array|
    supply_array << supply
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  winter_holiday_supplies = []
  holiday_hash[:winter].each do |holiday_name, supply_array|
    winter_holiday_supplies << supply_array
  end
  winter_holiday_supplies.flatten
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, holiday_array|
    puts "#{season.to_s.capitalize}:"
    holiday_array.each do |holiday_name, supply_array|
      puts "\s\s#{format_holiday(holiday_name)}: #{supply_array.join(", ")}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"

  holidays_with_bbqs = []

  holiday_hash.each do |season, holiday_array|
    holiday_array.each do |holiday_name, supply_array|
      if supply_array.include?("BBQ")
        holidays_with_bbqs << holiday_name
      end
    end
  end

  holidays_with_bbqs
end

def format_holiday(holiday_name)
  holiday = holiday_name.to_s.split("_")
  holiday.each do |word|
    word.capitalize!
  end
  holiday.join(" ")
end
