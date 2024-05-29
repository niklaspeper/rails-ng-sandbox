// default file to define routes in angular
import { Routes } from '@angular/router';
import { ArticlesComponent } from './articles/articles.component';
import { AuthorsComponent } from './authors/authors.component';
import { SignInComponent } from './user/sign-in/sign-in.component';
import { authGuard } from './auth.guard';

export const routes: Routes = [
  // order of routes matters
  // colon sets a route paramater -> route parameters have to be set
  // { path: 'articles/:filter', component: ArticlesComponent },
  // query parameters are optional
  { path: 'sign-in', component: SignInComponent },
  { path: 'articles', component: ArticlesComponent, canActivate: [authGuard] },
  { path: 'authors', component: AuthorsComponent, canActivate: [authGuard] },
  // defining root route with pathMatch:'full'
  { path: '', redirectTo: '/articles', pathMatch: 'full' }
];
