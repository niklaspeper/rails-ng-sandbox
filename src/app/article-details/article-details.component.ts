import { Component, EventEmitter, Input, Output } from '@angular/core';
import { IArticle } from '../articles/article.model';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'blog-article-details',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './article-details.component.html',
  styleUrl: './article-details.component.css'
})
export class ArticleDetailsComponent {
  // defining an input property for this child component passing from parent
  @Input() article!: IArticle;
  // defining an output property for this child component passing data to parent
  @Output() favour = new EventEmitter();

  price: number = 420;
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
  // trigger event to output data to parent 
  favourButtonClicked() {
    this.favour.emit();
  }
}
