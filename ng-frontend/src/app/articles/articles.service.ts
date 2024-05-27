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

  // crud operations

  createArticle(article: IArticle) {
    // post methods needs the url of the api endpoint and a javascript object
    // the js object is converted to json automatically before the request is sent
    this.http.post('api/v1/articles', article).subscribe(() => {
      console.log("article created by ng frontend");
    });
  }
  // return type is an observable -> similar to callbacks/promises, used for asynchronous c/s communication
  getArticles(): Observable<IArticle[]> {
    // url also accepts query params '?...'
    return this.http.get<IArticle[]>('api/v1/articles');
  }
  updateArticle(id: number, updatedArticle: IArticle) {
    this.http.put('api/v1/articles/' + id, updatedArticle).subscribe();
  }
  deleteArticle(id: number) {
    this.http.delete('api/v1/articles/' + id).subscribe();
  }
}
