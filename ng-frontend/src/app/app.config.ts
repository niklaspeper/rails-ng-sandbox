import { ApplicationConfig, importProvidersFrom } from '@angular/core';
// imports for angular routing functionality
import { provideRouter } from '@angular/router';
import { routes } from './app.routes';
// import for http calls
import { HttpClientModule } from '@angular/common/http';


// angular http client must be imported here in the app's root dependancy injector
export const appConfig: ApplicationConfig = {
  providers: [
    provideRouter(routes),
    importProvidersFrom(HttpClientModule),
  ]
};
