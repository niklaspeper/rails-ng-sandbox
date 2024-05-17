import { Component } from '@angular/core';
import { IArticle } from './article.model';
import { CommonModule } from '@angular/common';
import { ArticleDetailsComponent } from "../article-details/article-details.component";

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
  favouredArticles: IArticle[] = [];

  constructor() {
    this.article = {
      title: 'First Test Article',
      body: 'This is the article for testing angular frontend',
      status: 'public'
    };
    this.articles =
      [{
        title: 'First Test Article',
        body: 'This is the first article for testing angular frontend',
        status: 'public'
      },
      {
        title: 'Second Test Article',
        body: 'This is the second article for testing angular frontend',
        status: 'private'
      },
      {
        title: 'Third Test Article',
        body: 'This is the third article for testing angular frontend',
        status: 'public'
      }, {
        title: 'Fourth Test Article',
        body: 'This is the fourth article for testing angular frontend',
        status: 'archived'
      }, {
        title: 'Fifth Test Article',
        body: 'This is the fifth article for testing angular frontend',
        status: 'public'
      },
      ]

  }
  createAltTag(article: IArticle) {
    return article.title + ' example pic'
  }
  getFilteredArticles() {
    return this.filter === ''
      ? this.articles
      : this.articles.filter((article: any) => article.status === this.filter);
  }
  addFavouredArticle(article: IArticle) {
    this.favouredArticles.push(article);
  }
}

