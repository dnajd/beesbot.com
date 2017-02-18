---
layout: post
title:  "Rails Scaffold for a Model in a Module"
date:   2014-12-11
categories: rails scaffod model modules
summary: Need to create rails scaffold for a Model that is inside a Module?
permalink: rails-scaffold-for-model-in-module/
---

I used active record to map a legacy database and packaged the active record models in a gem.  When you do that you end up with a model embedded in a module path, for example something like this ```class Legacy::Database::Product```

When you roll this into rails and use scaffold you'll end up with paths like ```/legacy/database/products``` and path variables like ```legacy_database_products_path```. 

So lets fix all that! Start by assuming we have a rails project and have included our gem.

## Generate the scaffold

Note you'll need to include the attributes of your model so the forms generate correctly.

```
rails generate scaffold Products title:string description:text price:decimal
```

## Clean up

Remove the generated model, migration, fixtures/factory and unit test for the model.

## Shorter Routes

Update the routes to ```/products``` by adjusting the ```config/routes.rb``` file.

```
resources :products, path: '/products'
```

Now your paths / path variables will be shallow and not include module names.

## Views

Anywhere that a model is passed to a ```form_for``` needs the addition of the ```url``` 

```
<%= form_for(@product, {
  url: (@product.new_record? ? products_path : product_path(@product)),
  method: (@product.new_record? ? :post : :put)
}) do |f| %>
```

```link_to``` methods that don't include a path variable (ex. ```link_to 'Show', @product```) need to inlcude the path variable.

```
<%= link_to 'Show', product_path(@product) %>
```

## Controller

The create and update actions have a params key that will need to be updated (```params[:product]```) to a param key including the module names.

```
params[:legacy_database_product]
```

## Functional Tests

The scaffold will create automated tests and there are a few changes to make.  

First add the module name to the ```assert_difference``` in the destory test.

```
 test "should destroy product" do
    assert_difference('Legacy::Database::Product.count', -1)...
```

And the parameter names for the update and create tests

```
 test "should create product" do
    assert_difference('Legacy::Database::Product.count') do
      post :create, {legacy_database_product: {

  test "should update product" do
    put :update, {id: @product, legacy_database_product: {
```

## Congrats

You have integrated a your gem packaged active record classes into your rails project, used the scaffolding and ended up with reasonable paths & path variables.  Enjoy




