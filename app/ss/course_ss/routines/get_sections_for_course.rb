class CourseSs::GetSectionsForCourse
  lev_routine

  protected

  def exec(course)
    ss_maps = CourseSs::CourseSectionMap.where{course_id == course.id}
    sections = ss_maps.collect{|ss_map| ss_map.section}
    outputs[:sections] = sections
  end
end
