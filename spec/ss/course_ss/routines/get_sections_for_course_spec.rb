require 'rails_helper'

describe CourseSs::GetSectionsForCourse do
  context "when there are no sections for the given course" do
    it "return no sections" do
      target_course = Course.create!

      result = CourseSs::GetSectionsForCourse.call(target_course)

      expect(result.errors).to be_empty
      expect(result.outputs.sections).to be_empty
    end
  end
  context "there is one section for the given course" do
    it "returns the courses's section" do
      target_course  = Course.create!
      target_section = Section.create!
      CourseSs::CourseSectionMap.create!(course: target_course, section: target_section)

      other_course  = Course.create!
      other_section = Section.create!
      CourseSs::CourseSectionMap.create!(course: other_course, section: other_section)

      result = CourseSs::GetSectionsForCourse.call(target_course)

      expect(result.errors).to be_empty
      expect(result.outputs.sections.size).to eq(1)
      expect(result.outputs.sections).to include(target_section)
    end
  end
  context "there are multiple sections for the given course" do
    it "returns all the course's sections" do
      target_course   = Course.create!
      target_section1 = Section.create!
      CourseSs::CourseSectionMap.create!(course: target_course, section: target_section1)

      other_course  = Course.create!
      other_section = Section.create!
      CourseSs::CourseSectionMap.create!(course: other_course, section: other_section)

      target_section2 = Section.create!
      CourseSs::CourseSectionMap.create!(course: target_course, section: target_section2)

      result = CourseSs::GetSectionsForCourse.call(target_course)

      expect(result.errors).to be_empty
      expect(result.outputs.sections.size).to eq(2)
      expect(result.outputs.sections).to include(target_section1)
      expect(result.outputs.sections).to include(target_section2)
    end
  end
end
