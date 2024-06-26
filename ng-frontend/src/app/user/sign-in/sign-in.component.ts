import { Component, inject } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { IUserCredentials } from '../user.model';
import { UserService } from '../user.service';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'blog-sign-in',
  standalone: true,
  imports: [FormsModule, CommonModule],
  templateUrl: './sign-in.component.html',
  styleUrl: './sign-in.component.css'
})
export class SignInComponent {
  credentials: IUserCredentials = { email: '', password: '' };
  errors: string = "";
  private userSvc: UserService = inject(UserService);
  private router: Router = inject(Router);
  signInError: boolean = false;

  constructor() {

  }

  signIn() {
    this.signInError = false;
    // calling the user service where the credentials are posted to api
    // subscribers are functions that receive emitted values from an observable. they can handle the data, perform side effects, or unsubscribe from the observable.
    this.userSvc.signIn(this.credentials).subscribe({
      // when the user successfully signed in, navigate to articles page
      next: () => this.router.navigate(['articles']),
      error: () => this.signInError = true
    })
  }
}
