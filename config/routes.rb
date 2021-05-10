Rails.application.routes.draw do
  

  devise_for :users
  root to: "tweets#index"
  resources :users, only: [:edit, :update, :show]
  resources :members, only: [:index]
  resources :groups, only: [:index]
  resources :tweets do

    collection do
      get 'search'
    end

    collection do
      get 'ushio'
    end

    collection do
      get 'kageyama'
    end

    collection do
      get 'katou'
    end

    collection do
      get 'saitou'
    end

    collection do
      get 'kumi'
    end

    collection do
      get 'mirei'
    end

    collection do
      get 'takase'
    end

    collection do
      get 'takamoto'
    end

    collection do
      get 'higashimura'
    end

    collection do
      get 'kanemura'
    end

    collection do
      get 'kawata'
    end

    collection do
      get 'kosaka'
    end

    collection do
      get 'tomita'
    end

    collection do
      get 'nibu'
    end

    collection do
      get 'hamagishi'
    end

    collection do
      get 'matsuda'
    end

    collection do
      get 'miyata'
    end

    collection do
      get 'watanabe'
    end

    collection do
      get 'kamimura'
    end

    collection do
      get 'takahashi'
    end

    collection do
      get 'morimoto'
    end

    collection do
      get 'yamaguchi'
    end

  end

end
