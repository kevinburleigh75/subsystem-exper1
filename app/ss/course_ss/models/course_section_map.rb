class CourseSs::CourseSectionMap < ActiveRecord::Base
  belongs_to :course
  belongs_to :section

  validates_presence_of :course_id
  validates_presence_of :section_id
end
