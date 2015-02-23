class CourseSs::AddSectionToCourse
  lev_routine

  protected

  def exec(section, course)
    ss_map = CourseSs::CourseSectionMap.create(course: course, section: section)
    transfer_errors_from(ss_map, {type: :verbatim}, true)
  end
end
