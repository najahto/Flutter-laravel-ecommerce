<?php

use Illuminate\Support\Facades\Route;


Auth::routes();
Route::get('/', 'HomeController@index')->name('home');

Route::resource('categories', 'CategoryController');
Route::resource('products', 'ProductController');
Route::resource('sliders', 'SliderController');