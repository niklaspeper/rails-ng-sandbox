import { Component } from '@angular/core';
// import routeroutlet used to dynamically load a component based on url path
import { RouterLink, RouterLinkActive, RouterOutlet } from '@angular/router';
import { ArticlesComponent } from './articles/articles.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, RouterLink, RouterLinkActive, ArticlesComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
}
