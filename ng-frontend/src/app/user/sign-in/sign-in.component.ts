import { Component, inject } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { IUserCredentials } from '../user.model';
import { UserService } from '../user.service';
import { Router } from '@angular/router';

@Component({
  selector: 'blog-sign-in',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './sign-in.component.html',
  styleUrl: './sign-in.component.css'
})
export class SignInComponent {
  credentials: IUserCredentials = { email: '', password: '' };
  private userSvc: UserService = inject(UserService);
  private router: Router = inject(Router);

  constructor() {

  }

  signIn() {
    // calling the user service where the credentials are posted to api
    // subscribers are functions that receive emitted values from an observable. they can handle the data, perform side effects, or unsubscribe from the observable.
    this.userSvc.signIn(this.credentials).subscribe({
      // when the user successfully signed in, navigate to articles page
      next: () => this.router.navigate(['articles'])
    })
  }
}
