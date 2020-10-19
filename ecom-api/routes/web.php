<?php

use Illuminate\Support\Facades\Route;


Auth::routes();
Route::get('/', 'HomeController@index')->name('home');
// Route::get('/category/index', 'CategoryController@index')->name('list.categories');
// Route::get('/category/create', 'CategoryController@create')->name('create.category.form');
// Route::get('/category/edit/{id}', 'CategoryController@edit')->name('edit.category.form');
// Route::post('/category/add', 'CategoryController@store')->name('add.category');
// Route::post('/category/update', 'CategoryController@update')->name('update.category');
// Route::get('/category/delete', 'CategoryController@destroy')->name('delete.category');
Route::resource('categories', 'CategoryController');