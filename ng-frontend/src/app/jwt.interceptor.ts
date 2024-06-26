import { HttpInterceptorFn } from '@angular/common/http';

// interceptor for adding authorization token to every http request
// to use it througout the entire app, it must be included in app.config.ts
export const jwtInterceptor: HttpInterceptorFn = (req, next) => {
  const authToken = localStorage.getItem('access_token');

  // Clone the request and add the authorization header
  const authReq = req.clone({
    setHeaders: authToken ? { Authorization: authToken } : {}
  });

  // Pass the cloned request with the updated header to the next handler
  return next(authReq);
};
