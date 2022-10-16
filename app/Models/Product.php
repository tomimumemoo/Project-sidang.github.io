<?php

namespace App\Models;

use App\Models\Cart;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = ['title', 'slug', 'summary', 'description', 'cat_id', 'child_cat_id', 'price', 'brand_id', 'discount', 'status', 'photo', 'size', 'stock', 'is_featured', 'condition', 'id_penjual'];

    public function cat_info()
    {
        return $this->hasOne('App\Models\Category', 'id', 'cat_id');
    }
    public function sub_cat_info()
    {
        return $this->hasOne('App\Models\Category', 'id', 'child_cat_id');
    }

    public static function getAllProduct($id_penjual)
    {
        return Product::select('*', 'products.photo')->join('users', 'products.id_penjual', '=', 'users.id')->where('id_penjual', $id_penjual)->with(['cat_info', 'sub_cat_info'])->orderBy('products.id', 'desc')->paginate(10);
    }

    public function rel_prods()
    {
        return $this->hasMany('App\Models\Product', 'cat_id', 'cat_id')->where('status', 'active')->orderBy('id', 'DESC')->limit(8);
    }
    public function getReview()
    {
        return $this->hasMany('App\Models\ProductReview', 'product_id', 'id')->with('user_info')->where('status', 'active')->orderBy('id', 'DESC');
    }
    public static function getProductBySlug($slug)
    {
        return Product::with(['cat_info', 'rel_prods', 'getReview'])->where('slug', $slug)->first();
    }
    public static function countActiveProduct()
    {
        $data = Product::where('status', 'active')->count();
        if ($data) {
            return $data;
        }
        return 0;
    }

    public function carts()
    {
        return $this->hasMany(Cart::class)->whereNotNull('order_id');
    }

    public function wishlists()
    {
        return $this->hasMany(Wishlist::class)->whereNotNull('cart_id');
    }

    public static function get_keuntungan()
    {
        $data = Product::where('status', 'active')->count();
        if ($data) {
            return $data;
        }
        return 0;
    }

    public function get_all_product($id_penjual)
    {
        $data = Product::where('id_penjual', $id_penjual)->get();
        if ($data) {
            return $data;
        }
        return 0;
    }

}