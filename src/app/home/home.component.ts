import { Component, OnInit } from '@angular/core';

// 'decorator' 
// metadata
@Component({
  // name of html selector -> <app-home>
  selector: 'blog-home',
  standalone: true,
  imports: [],
  templateUrl: './home.component.html',
  // can be an array containing multiple css files
  styleUrl: './home.component.css'
})
export class HomeComponent implements OnInit {
  constructor() {
  }
  ngOnInit(): void {

  }
}
