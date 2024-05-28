# frozen_string_literal: true

Rails.application.routes.draw do
  # override default devise routes and add route aliases
  devise_for :users, path: 'api/users/', path_names: {
                                           sign_in: 'login',
                                           sign_out: 'logout',
                                           registration: 'signup'
                                         },
                     controllers: {
                       sessions: 'users/sessions',
                       registrations: 'users/registrations'
                     }
  root 'articles#index'
  # get '/articles', to: "articles#index"
  # get "/articles/:id", to: "articles#show"

  # redirect to root path when accessing webpage only with /en or /de attached
  # get '/:locale' => "articles#index"

  # "resources :articles" automatically generates the following routes
  # and binds them to controller actions/ corresponding views:
  #
  # GET /articles - articles#index - prefix: articles
  # POST /articles - articles#create
  # GET /articles/new - articles#new - prefix: new_article
  # GET /articles/:id/edit - articles#edit - prefix: edit_article
  # GET /articles/:id - articles#show - prefix: article
  # PATCH /articles/:id - articles#update
  # PUT /articles/:id - articles#update
  # DELETE /articles/:id - articles#destroy

  # scope "(:locale)", locale: /en|de/ do
  resources :articles do
    # this creates comments as a nested resource within articles,
    # automatically generates the following routes and binds them to controller actions/ corresponding views:
    #
    # GET /articles/:article_id/comments - comments#index - prefix: article_comments
    # POST /articles/:article_id/comments - comments#create
    # GET /articles/:article_id/comments/new - comments#new - prefix: new_article_comment
    # GET /articles/:article_id/comments/:id/edit - comments#edit - prefix: edit_article_comment
    # GET /articles/:article_id/comments/:id - comments#show - prefix: article_comment
    # PATCH /articles/:article_id/comments/:id - comments#update
    # PUT /articles/:article_id/comments/:id - comments#update
    # DELETE /articles/:article_id/comments/:id - comments#destroy
    resources :comments
    # end
  end

  namespace :api do
    namespace :v1 do
      get 'articles/xml', to: 'articles#xml_index'
      get 'articles/csv', to: 'articles#csv_index'
      resources :articles
    end
    namespace :v2 do
      resources :articles
    end
  end
end
