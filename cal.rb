# ruby
#
# cal.rb
# unix like utility to display a month or a year at a time

require 'optparse'

# types
ProgramOptions = Struct.new(:byMonth, :byYear)
DayStruct = Struct.new(:year, :month, :day, :weekday)

# global vars
daysInAMonth = %w{-1 31 28 31 30 31 30 31 31 30 31 30 31 -1}
options = ProgramOptions.new(true, false)
month = Time.now.month
year = Time.now.year
days = Array.new

def isLeap(year)
	isLeapYear = ((year % 400) == 0)
	isLeapYear |= ((year % 4) == 0)

	if (isLeapYear) then
		isLeapYear &= ((year % 100) != 0)
	end
	isLeapYear
end

def firstDayOfMonth(month, year)
	fd = Time.local(year, month, 1,0,0,0,0)
end

def handleArgs(args)
	optHandler = OptionParser.new

	optHandler.on("-m", "--month", Integer, "Display calendar by month") { options.byMonth = true; ARGV.delete("-m"); ARGV.delete("--month") }
	optHandler.on("-y", "--year",Integer, "Display calendar by year") { options.byYear = true; options.byMonth = false; ARGV.delete("-y"); ARGV.delete("--year") }
	optHandler.on("-h", "--help",nil,"Display this help") { puts optHandler; exit }

	optHandler.parse(args)
end

def printTitle(yy, mm)
	puts " "*10 + Time.local(yy,mm,1,0,0,0,0).strftime("%b %Y")
	weekDays = %w{Sun Mon Tue Wed Thu Fri Sat}
	puts " " + weekDays.join(" ")
end

def fillDayDataStruct(wday, daysThisMonth, yy, mm)
	indx = 0
	days = Array.new
	(1..wday.to_i).each { |d|
		oneDay = DayStruct.new(0,0,0,indx)
		days.push oneDay
		indx = indx.succ
	}

	(1..daysThisMonth.to_i).each { |d|
		oneDay = DayStruct.new(yy, mm, d, Time.local(yy,mm,d,0,0,0,0).strftime("%w"))
		days.push oneDay
	}
	days
end

def printCalendar(days)
	indx = 0
	while (indx <= days.size-1) do	
		if (days[indx].month == 0) then
			print "    "
		else
			printf "%4d", days[indx].day
			puts if (days[indx].weekday.to_i == 6)
		end
		indx = indx.succ
	end
end

def monthCalendar(mon, yy, da) 
	localTime = Time.local(yy, mon, 1,0,0,0,0)
	weekDay = localTime.strftime("%w")
	monthString = localTime.strftime("%b")

	# udpate dayArray depending on year being leap or not
	if (isLeap(yy)) then
		daysInAMonth[2] = 29
	end
	
	daysThisMonth = da[mon]

	printTitle(yy,mon)
	days = fillDayDataStruct(weekDay, daysThisMonth, yy, mon)
	printCalendar(days)
	puts
end

# ===== main =====
if (ARGV.size > 0) then
	begin
		month = ARGV[0].to_i
		if (month > 12) then
			options.byYear = true
			options.byMonth = false
			year = month
		end
	rescue
		STDERR.puts "Unable to convert argument to month"
		exit
	end
else
	month = Time.now.month
end

if (ARGV.size > 1) then
	begin
		year = ARGV[1].to_i
	rescue
		STDERR.puts "Unable to convert argument to year"
		exit
	end
else
	year = Time.now.year
end

if (options.byMonth) then
	year = Time.now.year.to_i
	monthCalendar(month, year, daysInAMonth)
end

if (options.byYear) then
	year = month
	(1..12).each { |mon|
		monthCalendar(mon, year, daysInAMonth)
	}
end
# eof : cal.rb