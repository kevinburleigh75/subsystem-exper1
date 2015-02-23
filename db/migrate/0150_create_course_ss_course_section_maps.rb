class CreateCourseSsCourseSectionMaps < ActiveRecord::Migration
  def change
    create_table :role_ss_course_section_maps do |t|
      t.integer :course_id
      t.integer :section_id
      t.timestamps null: false

      t.index [:course_id, :section_id], unique: true
    end
  end
end
