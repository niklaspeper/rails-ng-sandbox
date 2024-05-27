import { Component, inject } from '@angular/core';
import { Router, RouterLink } from '@angular/router';

@Component({
  selector: 'blog-authors',
  standalone: true,
  imports: [RouterLink],
  templateUrl: './authors.component.html',
  styleUrl: './authors.component.css'
})
export class AuthorsComponent {
  private router: Router = inject(Router);

  // example usage of navigating between routes via code
  goToArticles() {
    this.router.navigate(['articles']);
  }
}
