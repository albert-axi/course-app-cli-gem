
module CourseApp
  class Course
    attr_accessor :title, :course_overview, :description, :url
  
    @@all = []
  
    def initialize
      @@all << self
    end

    def print_course_details
      puts "====================================================="
      puts "                    #{self.title}                    "
      puts "====================================================="
      puts "Course link: #{self.url}"
      puts "Description: #{self.description}"
      puts "====================================================="
      puts self.course_overview
      puts "====================================================="
    end
  
    def self.all
      @@all
    end
  
    def self.reset_all
      @@all.clear
    end

    def self.print_courses
      self.all.each.with_index(1) do |course, index|
        puts "#{index}. #{course.title}"
      end
    end
  
  end
end
