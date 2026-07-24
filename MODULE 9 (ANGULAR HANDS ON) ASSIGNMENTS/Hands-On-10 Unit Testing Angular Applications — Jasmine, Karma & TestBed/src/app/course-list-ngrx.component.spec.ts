import { ComponentFixture, TestBed } from '@angular/core/testing';
import { MockStore, provideMockStore } from '@ngrx/store/testing';
import { By } from '@angular/platform-browser';
import { CourseListComponent } from './pages/course-list/course-list.component';

const mockCourses = [
  { id: 1, name: 'Data Structures', code: 'CS101', credits: 4, gradeStatus: 'passed' },
  { id: 2, name: 'Web Dev', code: 'CS103', credits: 3, gradeStatus: 'pending' }
];

const initialState = {
  course: { courses: mockCourses, loading: false, error: null }
};

describe('CourseListComponent with MockStore', () => {
  let component: CourseListComponent;
  let fixture: ComponentFixture<CourseListComponent>;
  let store: MockStore;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [CourseListComponent],
      providers: [provideMockStore({ initialState })]
    }).compileComponents();

    store = TestBed.inject(MockStore);
    fixture = TestBed.createComponent(CourseListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should render course cards from store', () => {
    const cards = fixture.debugElement.queryAll(By.css('app-course-card'));
    expect(cards.length).toBe(2);
  });

  it('should show loading indicator when loading is true', () => {
    store.setState({ course: { courses: [], loading: true, error: null } });
    fixture.detectChanges();
    const loader = fixture.debugElement.query(By.css('.loading'));
    expect(loader).toBeTruthy();
  });
});
