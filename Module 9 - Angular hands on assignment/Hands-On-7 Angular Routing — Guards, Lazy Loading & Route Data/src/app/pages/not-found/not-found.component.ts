import { Component } from '@angular/core';

@Component({
  selector: 'app-not-found',
  standalone: true,
  template: `
    <div style="padding:48px;text-align:center">
      <h1>404</h1>
      <p>Page not found.</p>
      <a routerLink="/">Go Home</a>
    </div>
  `
})
export class NotFoundComponent {}
