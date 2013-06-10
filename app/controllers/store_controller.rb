# coding: utf-8

class StoreController < ApplicationController

  include StoreHelper

  skip_before_filter :authorize

  def show_venki
    show_products "В", params[:sort]
  end

  def show_korsinu
    show_products "К", params[:sort]
  end

  def show_goods
    show_products "И", params[:sort]
  end

  def show_may_9
    @products = Product.paginate :page=>params[:page], :per_page => 500, :conditions => "may9 <> '0'", :order => "price desc"
  end

  def show_novinki
    dt = Date.today - 6.months
    @products = Product.paginate :page=>params[:page], :per_page => 500, :conditions => "created_at > '#{dt}'", :order => "created_at desc"
  end

  protect_from_forgery

  def show_products(key, sort)
    if sort == nil
      order = "price desc"
    else
      order = "created_at desc"
    end

    @products = Product.paginate :page=>params[:page], :per_page => 500, :conditions => "article like '#{key}%'", :order => order
  end

  def show_all_products(key)
    Product.all :conditions => "article like '#{key}%'", :order => "price desc"
  end

  private

end
