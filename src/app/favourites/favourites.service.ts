import { Injectable } from '@angular/core';
import { IArticle } from '../articles/article.model';

// service implementation (angular best practice)
// keeping the business logic encapsulated outside of a controller
// services in angular are singletons -> good for managing global states
// @Injectable decorator marks this class as a service
@Injectable({
  // always set to 'root' -> service is available anywhere in the application
  providedIn: 'root'
})
export class FavouritesService {
  favouredArticles: IArticle[] = [];

  constructor() { }

  add(article: IArticle) {
    if (!this.favouredArticles.includes(article))
      this.favouredArticles.push(article);
  }
}
