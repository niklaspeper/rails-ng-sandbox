import { Component, inject } from '@angular/core';
import { IArticle } from './article.model';
import { CommonModule } from '@angular/common';
import { ArticleDetailsComponent } from "../article-details/article-details.component";
import { FavouritesService } from '../favourites/favourites.service';
import { ArticlesService } from './articles.service';

// a component should implement the logic for displaying the data
@Component({
  selector: 'blog-articles',
  standalone: true,
  templateUrl: './articles.component.html',
  styleUrl: './articles.component.css',
  imports: [CommonModule, ArticleDetailsComponent]
})
export class ArticlesComponent {
  article: IArticle;
  articles: any;
  filter: string = '';
  likedArticles: IArticle[] = [];
  // inject FavouritesService dependency
  private favSvc: FavouritesService = inject(FavouritesService);
  private artSvc: ArticlesService = inject(ArticlesService);
  // also works as constructor injection which might have minor pros for writing tests
  // constructor(private favSvc: FavouritesService) {


  constructor() {
    this.article = {
      title: 'First Test Article',
      body: 'This is the article for testing angular frontend',
      status: 'public'
    };
  }
  ngOnInit() {
    // this method returns an observable, so just calling the method doesn't do anything.
    // it needs to be called the 'subscribe' method to get the results
    this.artSvc.getArticles().subscribe(articles => {
      this.articles = articles;
    });
  }
  createAltTag(article: IArticle) {
    return article.title + ' example pic'
  }
  getFilteredArticles() {
    return this.filter === ''
      ? this.articles
      : this.articles.filter((article: any) => article.status === this.filter);
  }
  addLikedArticle(article: IArticle) {
    this.likedArticles.push(article);
  }
  addFavouredArticle(article: IArticle) {
    this.favSvc.add(article);
  }
  getFavouredArticles() {
    return this.favSvc.favouredArticles;
  }
}

