import { HttpClient } from '@angular/common/http';
import { Injectable, inject } from '@angular/core';
import { IArticle } from './article.model';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
// service for http requests regarding the 'articles' resources
export class ArticlesService {

  // dependancy injection is also good practice for services
  private http: HttpClient = inject(HttpClient);

  constructor() { }

  // return type is an observable -> similar to callbacks/promises, used for asynchronous c/s communication
  getArticles(): Observable<IArticle[]> {
    // url also accepts query params '?...'
    return this.http.get<IArticle[]>('api/v1/articles');
  }
}
