require 'rails_helper'

describe CourseSs::AddSectionToCourse do
  it 'adds the given section to the given course' do
    course = Course.create!
    section = Section.create!

    result = CourseSs::AddSectionToCourse.call(section, course)
    expect(result.errors).to be_empty

    ss_maps = CourseSs::CourseSectionMap.where{course_id == course.id}
    expect(ss_maps.count).to eq(1)
    expect(ss_maps.first.course_id).to eq(course.id)
    expect(ss_maps.first.section_id).to eq(section.id)
  end
  it 'does add the same section to a course twice' do
    course = Course.create!
    section = Section.create!

    result = CourseSs::AddSectionToCourse.call(section, course)
    expect(result.errors).to be_empty

    result = CourseSs::AddSectionToCourse.call(section, course)
    expect(result.errors).to_not be_empty

    ss_maps = CourseSs::CourseSectionMap.where{course_id == course.id}
    expect(ss_maps.count).to eq(1)
    expect(ss_maps.first.course_id).to eq(course.id)
    expect(ss_maps.first.section_id).to eq(section.id)
  end
end
