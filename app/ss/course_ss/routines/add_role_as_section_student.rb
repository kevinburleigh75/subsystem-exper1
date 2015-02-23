class CourseSs::AddRoleAsSectionStudent
  lev_routine

  protected

  def exec(section, student_role)
    ss_map = CourseSs::SectionStudentMap.create(section: section, role: student_role)
    transfer_errors_from(ss_map, {type: :verbatim}, true)
  end
end
