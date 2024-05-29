import { CanActivateFn, Router } from '@angular/router';
import { UserService } from './user/user.service';
import { inject } from '@angular/core';

// auth guard checks if user is logged in to see specific pages
export const authGuard: CanActivateFn = (route, state) => {

  return inject(UserService).isLoggedIn()
    ? true
    : inject(Router).navigate(['sign-in']);
}
