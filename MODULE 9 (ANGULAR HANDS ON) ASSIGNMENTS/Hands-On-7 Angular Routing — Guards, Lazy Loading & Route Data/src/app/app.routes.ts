import { Routes } from '@angular/router';
import { AuthGuard } from './guards/auth.guard';
import { UnsavedChangesGuard } from './guards/unsaved-changes.guard';

export const routes: Routes = [
  { path: '', loadComponent: () => import('./pages/home/home.component').then(m => m.HomeComponent) },
  {
    path: 'courses',
    children: [
      { path: '', loadComponent: () => import('./pages/course-list/course-list.component').then(m => m.CourseListComponent) },
      { path: ':id', loadComponent: () => import('./pages/course-detail/course-detail.component').then(m => m.CourseDetailComponent) }
    ]
  },
  { path: 'profile', canActivate: [AuthGuard], loadComponent: () => import('./pages/student-profile/student-profile.component').then(m => m.StudentProfileComponent) },
  {
    path: 'enroll',
    canActivate: [AuthGuard],
    canDeactivate: [UnsavedChangesGuard],
    loadComponent: () => import('./pages/reactive-enrollment-form/reactive-enrollment-form.component').then(m => m.ReactiveEnrollmentFormComponent)
  },
  { path: '**', loadComponent: () => import('./pages/not-found/not-found.component').then(m => m.NotFoundComponent) }
];
