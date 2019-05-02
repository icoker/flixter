class LessonsController < ApplicationController
  before_action :require_enrolled_in_current_course

  def show

  end

  def require_enrolled_in_current_course
    if !current_user.enrolled_in?(current_course)
      redirect_to course_path(current_course), alert: 'You must be enrolled in the course to view this lesson.'
    end
  end

  private

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

  def current_course
    current_lesson.section.course
  end
end
