module CourseApp
  class CLI
    def call
      puts "Course App CLI started"
      CourseApp::Scraper.new.make_courses
      list_courses
    end

    def list_courses
      CourseApp::Course.print_courses
      user_prompt_for_course
    end

    def user_prompt_for_course
      print "Select the number of your choice to see more: "
      input = gets 
      
      system("clear")
      show_course_details(input)
    end

    def user_general_prompt
      puts "Input the following commands:"
      puts "[list] - to show the list of courses"
      puts "[exit] - to close the app"
      input = gets.strip
      process_general_prompt(input)
    end

    def show_course_details(input)
      system("clear")
      CourseApp::Course.all[input.to_i-1].print_course_details

      user_general_prompt
    end

    def process_general_prompt(input)
      system("clear")
      list_courses if input == "list"
      exit if input == "exit"
    end
  end
end