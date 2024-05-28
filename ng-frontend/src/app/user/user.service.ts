import { inject, Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
// rxjs (reactive extensions for javascript) is a powerful library for composing asynchronous and event-based programs using observable sequences. It provides a way to handle data streams and events in a declarative and functional manner.
import { BehaviorSubject, map, Observable } from 'rxjs';
import { IUser, IUserCredentials } from './user.model';

@Injectable({
  providedIn: 'root',
})
export class UserService {
  private http: HttpClient = inject(HttpClient);
  private user: BehaviorSubject<IUser | null>;

  constructor() {
    // caching the current user
    this.user = new BehaviorSubject<IUser | null>(null);
  }

  // observables represent streams of values that can be emitted over time. you can subscribe to an observable to receive these values.
  getUser(): Observable<IUser | null> {
    return this.user;
  }

  signIn(credentials: IUserCredentials): Observable<IUser> {
    return this.http
      .post<IUser>('/api/sign-in', credentials)
      .pipe(map((user: IUser) => {
        // when post succeeds the rxjs map function is used to grab and cache the returned user object locally
        this.user.next(user);
        return user;
      }));
  }

  signOut() {
    this.user.next(null);
  }
}