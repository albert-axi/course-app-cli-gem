require 'pry'
module CourseApp
  class Scraper
    BASE_PATH = "https://academyxi.com"
  
    def get_page(link = BASE_PATH)
      url = link
      uri = URI.parse(url)
      doc = Nokogiri::HTML(uri.open)
    end
  
    def get_courses
      page = get_page
  
      page.css('div.elementor-widget-container .list-entry-col').map do |course|
        course
      end
    end
  
    def make_courses
      courses = get_courses
      puts "Scraping Data...."
      courses.map do |course|
        print "="

        new_course = Course.new

        new_course.title = course.css('h4.entry-title').text.strip
        new_course.description = course.css('div.entry-desc').text.strip
        new_course.url = course.css('div.entry-actions a.entry-action').attr("href").value.strip
        new_course.course_overview = course_details(new_course.url)

        new_course
      end
      system("clear")
    end
  
    def course_details(course_url)
      url = (course_url.include? BASE_PATH )? 
            course_url : 
            "#{BASE_PATH}#{course_url}"
      page =  get_page(url)
  
      page.css('div.elementor-text-editor')[1].text.strip
    end
  
    # def print_courses
    #   make_courses.each.with_index(1) do |course, index|
    #     puts "#{index}. #{course.title}"
    #   end
    # end
  
  end  
end

