import { ApplicationConfig, importProvidersFrom } from '@angular/core';
// imports for angular routing functionality
import { provideRouter } from '@angular/router';
import { routes } from './app.routes';
// import for http calls
import { HttpClientModule, provideHttpClient, withInterceptors } from '@angular/common/http';
import { jwtInterceptor } from './jwt.interceptor';


// angular http client must be imported here in the app's root dependancy injector
export const appConfig: ApplicationConfig = {
  providers: [
    provideRouter(routes),
    provideHttpClient(withInterceptors([jwtInterceptor])),
    importProvidersFrom(HttpClientModule),
  ]
};
