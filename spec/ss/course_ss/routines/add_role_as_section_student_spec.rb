require 'rails_helper'

describe CourseSs::AddRoleAsSectionStudent do
  it 'adds the given role as a student in the given section' do
    section = Section.create!
    role    = Role.create!

    result = CourseSs::AddRoleAsSectionStudent.call(section, role)
    expect(result.errors).to be_empty

    ss_maps = CourseSs::SectionStudentMap.where{section_id == section.id}
    expect(ss_maps.count).to eq(1)
    expect(ss_maps.first.section_id).to eq(section.id)
    expect(ss_maps.first.role_id).to eq(role.id)
  end
  it 'does add the same role to a section twice' do
    section = Section.create!
    role    = Role.create!

    result = CourseSs::AddRoleAsSectionStudent.call(section, role)
    expect(result.errors).to be_empty

    result = CourseSs::AddRoleAsSectionStudent.call(section, role)
    expect(result.errors).to_not be_empty

    ss_maps = CourseSs::SectionStudentMap.where{section_id == section.id}
    expect(ss_maps.count).to eq(1)
    expect(ss_maps.first.section_id).to eq(section.id)
    expect(ss_maps.first.role_id).to eq(role.id)
  end
end
