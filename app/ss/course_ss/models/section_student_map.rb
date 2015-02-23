class CourseSs::SectionStudentMap < ActiveRecord::Base
  belongs_to :section
  belongs_to :role

  validates_presence_of :section_id
  validates_presence_of :role_id
end
