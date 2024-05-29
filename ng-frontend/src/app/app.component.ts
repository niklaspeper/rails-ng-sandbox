import { Component, inject } from '@angular/core';
// import routeroutlet used to dynamically load a component based on url path
import { Router, RouterLink, RouterLinkActive, RouterOutlet } from '@angular/router';
import { ArticlesComponent } from './articles/articles.component';
import { UserService } from './user/user.service';
import { IUser } from './user/user.model';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, RouterLink, RouterLinkActive, ArticlesComponent, CommonModule],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  private userSvc: UserService = inject(UserService);
  private router: Router = inject(Router);
  currentUser: IUser | null = null;

  ngOnInit() {
    this.userSvc.getUser().subscribe(user => {
      this.currentUser = user;
    })
  }
  logOut() {
    this.userSvc.signOut().subscribe({
      next: () => {
        localStorage.removeItem('access_token');
        this.router.navigate(['sign-in']);
      }
    });
  }
}
