require 'rails_helper'

describe ProductsController do
  describe 'GET #index' do
    it 'assigns all products as @products' do
      product1 = create(:product)
      product2 = create(:product)
      get :index
      expect(assigns(:products)).to match_array([product1, product2])
    end

    it 'render the :index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested product as @product' do
      product = create(:product)
      get :show, id: product
      expect(assigns(:product)).to eq(product)
    end

    it 'render the :show template' do
      product = create(:product)
      get :show, id: product
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    it 'assigns a new product as @product' do
      get :new
      expect(assigns(:product)).to be_a_new(Product)
    end

    it 'render the :new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested product as @product' do
      product = create(:product)
      get :edit, id: product
      expect(assigns(:product)).to eq(product)
    end

    it 'render the :edit template' do
      product = create(:product)
      get :edit, id: product
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new Product' do
        expect { post :create, product: attributes_for(:product) }
          .to change(Product, :count).by(1)
      end

      it 'assigns a newly created product as @product' do
        post :create, product: attributes_for(:product)
        expect(assigns(:product)).to be_a(Product)
        expect(assigns(:product)).to be_persisted
      end

      it 'redirects to the created product' do
        post :create, product: attributes_for(:product)
        expect(response).to redirect_to product_path(assigns[:product])
      end
    end

    context 'with invalid attributes' do
      it 'assigns a newly created but unsaved product as @product' do
        post :create, product: attributes_for(:product_invalid)
        expect(assigns(:product)).to be_a_new(Product)
      end

      it 're-renders the :new template' do
        post :create, product: attributes_for(:product_invalid)
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid attributes' do
      before(:each) do
        @product = create(:product)
      end

      it 'assigns the requested product as @product' do
        put :update, id: @product, product: attributes_for(:product)
        expect(assigns(:product)).to eq(@product)
      end

      it 'updates the requested product' do
        put :update, id: @product,
          product: attributes_for(:product,
            name: 'Some new name',
            description: 'Some new description'
          )
        @product.reload
        expect(@product.name).to eq('Some new name')
        expect(@product.description).to eq('Some new description')
      end

      it 'redirects to the product' do
        put :update, id: @product, product: attributes_for(:product)
        expect(response).to redirect_to(@product)
      end
    end

    context 'with invalid attributes' do
      before(:each) do
        @product = create(:product)
      end

      it 'assigns the product as @product' do
        put :update, id: @product, product: attributes_for(:product_invalid)
        expect(assigns(:product)).to eq(@product)
      end

      it 're-renders the :edit template' do
        put :update, id: @product, product: attributes_for(:product_invalid)
        expect(response).to render_template(:edit)
      end
    end
  end

  # TODO: add PATCH testing

  describe 'DELETE #destroy' do
    before(:each) do
      @product = create(:product)
    end

    it 'destroys the requested product' do
      expect { delete :destroy, id: @product }.to change(Product, :count).by(-1)
    end

    it 'redirects to the products list' do
      delete :destroy, id: @product
      expect(response).to redirect_to(products_url)
    end
  end
end
