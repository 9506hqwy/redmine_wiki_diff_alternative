# frozen_string_literal: true

RedmineApp::Application.routes.draw do
  resources :projects do
    resources :wiki, as: 'wiki_page' do
      member do
        post 'wiki_diff/preview', to: 'wiki_diff_alternative#preview'
      end
    end
  end
end
