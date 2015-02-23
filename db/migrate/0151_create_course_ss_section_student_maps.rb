class CreateCourseSsSectionStudentMaps < ActiveRecord::Migration
  def change
    create_table :role_ss_section_student_maps do |t|
      t.integer :section_id
      t.integer :role_id
      t.timestamps null: false

      t.index [:section_id, :role_id], unique: true
    end
  end
end
