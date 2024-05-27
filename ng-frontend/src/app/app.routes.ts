// default file to define routes in angular
import { Routes } from '@angular/router';
import { ArticlesComponent } from './articles/articles.component';
import { AuthorsComponent } from './authors/authors.component';

export const routes: Routes = [
  { path: 'articles', component: ArticlesComponent },
  { path: 'authors', component: AuthorsComponent },
];
