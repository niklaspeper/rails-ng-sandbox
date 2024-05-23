# Blog Webapp Rails/Angular

This is is simple blog app built with rails for backend and angular for frontend. contains crud operations, api endpoints/ calls and best practices for both frameworks.

The web servers run on the following ports:

| <!-- -->    | <!-- -->    |
|-------------|-------------|
| backend |http://localhost:3000|
|frontend| http://localhost:4200 |

### Prerequisites
- Ruby
- Rails
- Node.js
- npm
- yarn
- angular cli

---
## Rails Backend

### First Steps

1. Navigate to rails-backend/
2. Run `bundle install`, `npm install` and `yarn install`
3. Run `rails db:migrate`
4. Rund `rails assets:precompile`
5. Start dev server: `rails s`

---
## Angular Frontend

### First Steps

1. Navigate to ng-frontend/
2. Run `npm install` and you are ready to go
3. Start dev server: `npm start`

### Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

### Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory.

### Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

### Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via a platform of your choice. To use this command, you need to first add a package that implements end-to-end testing capabilities.

### Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI Overview and Command Reference](https://angular.io/cli) page.
