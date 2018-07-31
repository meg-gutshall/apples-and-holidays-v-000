require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply
end

# Alternate solution:
# def add_supply_to_winter_holidays(holiday_hash, supply)
#   holiday_hash[:winter].each do |holiday, supplies|
#     supplies << supply
#   end
# end

def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, season_data|
    puts "#{season.to_s.capitalize}:"
    season_data.each do |holiday, supplies|
      puts "  #{holiday.to_s.split("_").map {|word| word.capitalize}.join(" ")}: #{supplies.join(", ")}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  bbq_holidays = []
  holiday_hash.each do |season, season_data|
    season_data.each do |holiday, holiday_data|
      holiday_data.each do |supplies|
        if supplies == "BBQ"
          bbq_holidays << holiday
        end
      end
    end
  end
  bbq_holidays
end

# Alternate short/long code
# def all_holidays_with_bbq(holiday_hash)
#   bbq_holidays = []
#   holiday_hash.each {|season, season_data| season_data.each {|holiday, holiday_data| holiday_data.each {|supplies| supplies == "BBQ" ? bbq_holidays << holiday : nil}}}
#   bbq_holidays
# end
