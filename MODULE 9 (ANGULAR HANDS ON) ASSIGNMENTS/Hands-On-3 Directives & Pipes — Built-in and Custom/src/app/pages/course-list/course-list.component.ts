import { Component, OnInit } from '@angular/core';
import { NgFor, NgIf } from '@angular/common';
import { CourseCardComponent } from '../../components/course-card/course-card.component';

@Component({
  selector: 'app-course-list',
  standalone: true,
  imports: [NgFor, NgIf, CourseCardComponent],
  templateUrl: './course-list.component.html',
  styleUrl: './course-list.component.css'
})
export class CourseListComponent implements OnInit {
  isLoading = true;
  courses: any[] = [
    { id: 1, name: 'Data Structures', code: 'CS101', credits: 4, gradeStatus: 'passed' },
    { id: 2, name: 'Operating Systems', code: 'CS102', credits: 3, gradeStatus: 'failed' },
    { id: 3, name: 'Web Development', code: 'CS103', credits: 3, gradeStatus: 'pending' },
    { id: 4, name: 'Machine Learning', code: 'CS104', credits: 4, gradeStatus: 'passed' },
    { id: 5, name: 'Database Systems', code: 'CS105', credits: 3, gradeStatus: 'pending' }
  ];

  ngOnInit() {
    setTimeout(() => { this.isLoading = false; }, 1500);
  }

  trackByCourseId(index: number, course: any) {
    return course.id;
  }
}
