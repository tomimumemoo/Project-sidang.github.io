<header class="header shop">
    <!-- Topbar -->
    <div class="topbar">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-12 col-12">
                    <!-- Top Left -->
                    <div class="top-left">
                        <ul class="list-main">
                            @php
                            $settings=DB::table('settings')->get();

                            @endphp
                            <li><i class="ti-headphone-alt"></i>@foreach($settings as $data) {{$data->phone}}
                                @endforeach</li>
                            <li><i class="ti-email"></i> @foreach($settings as $data) {{$data->email}} @endforeach</li>
                        </ul>
                    </div>
                    <!--/ End Top Left -->
                </div>
                <div class="col-lg-6 col-md-12 col-12">
                    <!-- Top Right -->
                    <div class="right-content">
                        <ul class="list-main">
                            {{-- <li><i class="ti-alarm-clock"></i> <a href="#">Daily deal</a></li> --}}
                            @auth
                            @if(Auth::user()->role=='admin')
                            <li><i class="ti-user"></i> <a href="{{route('admin')}}" target="_blank">Dashboard</a></li>
                            @elseif(Auth::user()->role=='user')
                            <li><i class="ti-shopping-cart"></i> <a data-toggle="modal" data-target="#exampleModal">Jadi Penjual</a></li>
                            <li><i class="ti-user"></i> <a href="{{route('user')}}" target="_blank">Dashboard</a></li>
                            @else
                            <li><i class="ti-user"></i> <a href="{{route('pelapak')}}" target="_blank">Pusat
                                    Penjualan</a></li>
                            @endif
                            <li><i class="ti-power-off"></i> <a href="{{route('user.logout')}}">Keluar</a></li>

                            @else
                            <li><i class="ti-power-off"></i><a href="{{route('login.form')}}">Login /</a> <a
                                    href="{{route('register.form')}}">Register</a></li>
                            @endauth
                        </ul>
                    </div>
                    <!-- End Top Right -->
                </div>
            </div>
        </div>
    </div>
    <!-- End Topbar -->
    <div class="middle-inner">
        <div class="container">
            <div class="row">
                <div class="col-lg-2 col-md-2 col-12">
                    <!-- Logo -->
                    <div class="logo">
                        @php
                        $settings=DB::table('settings')->get();
                        @endphp
                        <a href="{{route('home')}}"><img src="@foreach($settings as $data) {{$data->logo}} @endforeach"
                                alt="logo"></a>
                    </div>
                    <!--/ End Logo -->
                    <!-- Search Form -->
                    <div class="search-top">
                        <div class="top-search"><a href="#0"><i class="ti-search"></i></a></div>
                        <!-- Search Form -->
                        <div class="search-top">
                            <form class="search-form">
                                <input type="text" placeholder="Search here..." name="search">
                                <button value="search" type="submit"><i class="ti-search"></i></button>
                            </form>
                        </div>
                        <!--/ End Search Form -->
                    </div>
                    <!--/ End Search Form -->
                    <div class="mobile-nav"></div>
                </div>
                <div class="col-lg-8 col-md-7 col-12">
                    <div class="search-bar-top">
                        <div class="search-bar">
                            <select>
                                <option>Semua</option>
                                @foreach(Helper::getAllCategory() as $cat)
                                <option>{{$cat->title}}</option>
                                @endforeach
                            </select>
                            <form method="POST" action="{{route('product.search')}}">
                                @csrf
                                <input name="search" placeholder="Cari produk disini..." type="search">
                                <button class="btnn" type="submit"><i class="ti-search"></i></button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-3 col-12">
                    <div class="right-bar">
                        <!-- Search Form -->
                        <div class="sinlge-bar shopping">
                            @php
                            $total_prod=0;
                            $total_amount=0;
                            @endphp
                            @if(session('wishlist'))
                            @foreach(session('wishlist') as $wishlist_items)
                            @php
                            $total_prod+=$wishlist_items['quantity'];
                            $total_amount+=$wishlist_items['amount'];
                            @endphp
                            @endforeach
                            @endif
                            <a href="{{route('wishlist')}}" class="single-icon"><i class="fa fa-heart-o"></i> <span
                                    class="total-count">{{Helper::wishlistCount()}}</span></a>
                            <!-- Shopping Item -->
                            @auth
                            <div class="shopping-item">
                                <div class="dropdown-cart-header">
                                    <span>{{count(Helper::getAllProductFromWishlist())}} Items</span>
                                    <a href="{{route('wishlist')}}">View Wishlist</a>
                                </div>
                                <ul class="shopping-list">
                                    {{-- {{Helper::getAllProductFromCart()}} --}}
                                    @foreach(Helper::getAllProductFromWishlist() as $data)
                                    @php
                                    $photo=explode(',',$data->product['photo']);
                                    @endphp
                                    <li>
                                        <a href="{{route('wishlist-delete',$data->id)}}" class="remove"
                                            title="Remove this item"><i class="fa fa-remove"></i></a>
                                        <a class="cart-img" href="#"><img src="{{$photo[0]}}" alt="{{$photo[0]}}"></a>
                                        <h4><a href="{{route('product-detail',$data->product['slug'])}}"
                                                target="_blank">{{$data->product['title']}}</a></h4>
                                        <p class="quantity">{{$data->quantity}} x - <span
                                                class="amount">${{number_format($data->price,2)}}</span></p>
                                    </li>
                                    @endforeach
                                </ul>
                                <div class="bottom">
                                    <div class="total">
                                        <span>Total</span>
                                        <span
                                            class="total-amount">Rp {{number_format(Helper::totalWishlistPrice(),2)}}</span>
                                    </div>
                                    <a href="{{route('cart')}}" class="btn animate">Cart</a>
                                </div>
                            </div>
                            @endauth
                            <!--/ End Shopping Item -->
                        </div>
                        {{-- <div class="sinlge-bar">
                            <a href="{{route('wishlist')}}" class="single-icon"><i class="fa fa-heart-o"
                            aria-hidden="true"></i></a>
                    </div> --}}
                    <div class="sinlge-bar shopping">
                        <a href="{{route('cart')}}" class="single-icon"><i class="ti-bag"></i> <span
                                class="total-count">{{Helper::cartCount()}}</span></a>
                        <!-- Shopping Item -->
                        @auth
                        <div class="shopping-item">
                            <div class="dropdown-cart-header">
                                <span>{{count(Helper::getAllProductFromCart())}} Items</span>
                                <a href="{{route('cart')}}">View Cart</a>
                            </div>
                            <ul class="shopping-list">
                                {{-- {{Helper::getAllProductFromCart()}} --}}
                                @foreach(Helper::getAllProductFromCart() as $data)
                                @php
                                $photo=explode(',',$data->product['photo']);
                                @endphp
                                <li>
                                    <a href="{{route('cart-delete',$data->id)}}" class="remove"
                                        title="Remove this item"><i class="fa fa-remove"></i></a>
                                    <a class="cart-img" href="#"><img src="{{$photo[0]}}" alt="{{$photo[0]}}"></a>
                                    <h4><a href="{{route('product-detail',$data->product['slug'])}}"
                                            target="_blank">{{$data->product['title']}}</a></h4>
                                    <p class="quantity">{{$data->quantity}} x - <span class="amount">Rp
                                            {{number_format($data->price,2)}}</span></p>
                                </li>
                                @endforeach
                            </ul>
                            <div class="bottom">
                                <div class="total">
                                    <span>Total</span>
                                    <span class="total-amount">Rp {{number_format(Helper::totalCartPrice(),2)}}</span>
                                </div>
                                <a href="{{route('checkout')}}" class="btn animate">Checkout</a>
                            </div>
                        </div>
                        @endauth
                        <!--/ End Shopping Item -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <!-- Header Inner -->
    <div class="header-inner">
        <div class="container">
            <div class="cat-nav-head">
                <div class="row">
                    <div class="col-lg-12 col-12">
                        <div class="menu-area">
                            <!-- Main Menu -->
                            <nav class="navbar navbar-expand-lg">
                                <div class="navbar-collapse">
                                    <div class="nav justify-content-center">
                                        <ul class="nav main-menu menu navbar-nav">
                                            <li class="{{Request::path()=='home' ? 'active' : ''}}"><a
                                                    href="{{route('home')}}">Beranda</a></li>
                                            <!-- <li class="{{Request::path()=='about-us' ? 'active' : ''}}"><a href="{{route('about-us')}}">Tentang Kami</a></li> -->
                                            <li
                                                class="@if(Request::path()=='product-grids'||Request::path()=='product-lists')  active  @endif">
                                                <a href="{{route('product-grids')}}">Produk</a><span
                                                    class="new">baru</span>
                                            </li>
                                            {{Helper::getHeaderCategory()}}
                                            <!-- <li class="{{Request::path()=='contact' ? 'active' : ''}}"><a href="{{route('contact')}}">Hubungi Kami</a></li> -->
                                        </ul>
                                    </div>
                                </div>
                            </nav>
                            <!--/ End Main Menu -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ End Header Inner -->
</header>
@auth
@if(Auth::user()->role=='user'):
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">

                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <center>
                    <div style="width: 50%;padding: 20px 0;">
                        <h4>Ingin menjadi pelapak?</h4>

                        <form action="{{route('jadi_penjual')}}" method="POST" enctype="multipart/form-data">
                            @csrf

                            <div class="form-group col-8 mt-4">
                                <label for="ktp">Ktp</label>
                                <input type="file" class="form-control" id="image" name="image">
                            </div>

                            <div class="form-group col-8 mt-2">
                                <label for="alamat">Alamat</label>
                                <textarea name="alamat" id="alamat" cols="30" rows="5" class="form-control" required></textarea>
                            </div>

                            <div class="form-group col-8 mt-2">
                                <label for="no_hp">Nomor Hp</label>
                                <input type="text" class="form-control" id="no_hp" name="no_hp" required>

                            </div>

                            <input type="hidden" value="{{Session::get('user')['id_user']}}" name="id_user">
                            <button class="btn btn-primary col-8" style="margin-top: 20px;"
                                type="submit">Daftar</button>
                        </form>

                    </div>
                </center>


            </div>

        </div>
    </div>
</div>
@endif
@endauth