import { Component } from '@angular/core';
import { IArticle } from './article.model';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'blog-articles',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './articles.component.html',
  styleUrl: './articles.component.css',
  // 'styles' array permits direct css: 
  // styles: ['a { font-weight:bold}']
})
export class ArticlesComponent {
  article: IArticle;
  articles: any;
  filter: string = '';
  price: number = 420;
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
  // function for ngClass binding
  // can return a string with the name of the class like 'public'
  // can return a string with the names of the desired classes like 'public bold'
  // can return an array with the names of the classes like ['public', 'bold']
  // --> this allows to push or remove elements to an existing class array
  getStatusClass(article: IArticle) {
    return article.status === 'public'
      ? 'public bold'
      : article.status === 'private'
        ? ['private', 'italic']
        : 'archived'
    // another possibility to return a css class name:
    // return { public: article.status === 'public' }
  }
}

