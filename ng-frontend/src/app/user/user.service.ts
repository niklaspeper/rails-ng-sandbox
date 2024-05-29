import { inject, Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
// rxjs (reactive extensions for javascript) is a powerful library for composing asynchronous and event-based programs using observable sequences. It provides a way to handle data streams and events in a declarative and functional manner.
import { BehaviorSubject, catchError, map, Observable, of, tap } from 'rxjs';
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
    const userData = {};
    return this.http
      // adjust url to api endpoint
      // user object is appended the 'user' prefix in order to be accepted from rails
      .post<IUser>('/api/users/login', Object.assign(userData, { user: credentials }), { observe: 'response' })
      .pipe(map((response: any) => {
        // when post succeeds the rxjs map function is used to grab and cache the returned user object locally
        const user: IUser = response.body.status.data;
        localStorage.setItem('access_token', JSON.stringify(response.headers.get('Authorization')));
        console.log(response.body.status.data);
        this.user.next(user);
        return user;
      }));
    ;
  }

  signOut(): Observable<any> {
    return this.http
      .delete('/api/users/logout')
      .pipe((response: any) => {
        this.user.next(null)
        return response;
      })
  }
}