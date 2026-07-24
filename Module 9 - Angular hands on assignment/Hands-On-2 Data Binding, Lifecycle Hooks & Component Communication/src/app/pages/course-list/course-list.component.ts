import { Component } from '@angular/core';
import { NgFor, NgIf } from '@angular/common';
import { CourseCardComponent } from '../../components/course-card/course-card.component';

@Component({
  selector: 'app-course-list',
  standalone: true,
  imports: [NgFor, NgIf, CourseCardComponent],
  templateUrl: './course-list.component.html',
  styleUrl: './course-list.component.css'
})
export class CourseListComponent {
  selectedCourseId: number | null = null;

  courses = [
    { id: 1, name: 'Data Structures', code: 'CS101', credits: 4 },
    { id: 2, name: 'Operating Systems', code: 'CS102', credits: 3 },
    { id: 3, name: 'Web Development', code: 'CS103', credits: 3 },
    { id: 4, name: 'Machine Learning', code: 'CS104', credits: 4 },
    { id: 5, name: 'Database Systems', code: 'CS105', credits: 3 }
  ];

  onEnroll(courseId: number) {
    console.log('Enrolling in course: ' + courseId);
    this.selectedCourseId = courseId;
  }
}
