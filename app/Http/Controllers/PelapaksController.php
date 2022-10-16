<?php

namespace App\Http\Controllers;

// use Illuminate\Contracts\Session\Session;
use App\Pelapak;
use App\Rules\MatchOldPassword;
use App\User;
use Hash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Session;

class PelapaksController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');

        // var_dump(session()->all());die();
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */

    public function index()
    {

        $id_penjual = Session::get('user')['id_user'];
        // dd(Session::get('user')['id_user']);

        $data_orders = DB::table('detail_order')->selectRaw('*, SUM(qty) terjual, SUM(total) total_terjual')->where('id_penjual', $id_penjual)->groupBy('id_product')->paginate(10);

        // dd(Session::get('user')['id_user']);

        $untung = 0;
        foreach ($data_orders as $d) {

            $untung = $untung + $d->total_terjual;
        }

        $keuntungan = $untung;

        // $keuntungan = $users[0]['keuntungan'];

        // dd();

        $data = [
            'keuntungan' => $keuntungan,
        ];

        return view('pelapak.index', $data);
    }

    public function profile()
    {
        $profile = Auth()->user();
        // return $profile;
        return view('pelapak.users.profile')->with('profile', $profile);
    }

    public function profileUpdate(Request $request, $id)
    {
        // return $request->all();
        $user = User::findOrFail($id);
        $data = $request->all();
        $status = $user->fill($data)->save();
        if ($status) {
            request()->session()->flash('success', 'Successfully updated your profile');
        } else {
            request()->session()->flash('error', 'Please try again!');
        }
        return redirect()->back();
    }

    public function changePassword()
    {
        return view('pelapak.layouts.userPasswordChange');
    }
    public function changPasswordStore(Request $request)
    {
        $request->validate([
            'current_password' => ['required', new MatchOldPassword],
            'new_password' => ['required'],
            'new_confirm_password' => ['same:new_password'],
        ]);

        User::find(auth()->user()->id)->update(['password' => Hash::make($request->new_password)]);

        return redirect()->route('pelapak')->with('success', 'Password successfully changed');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Pelapak  $pelapak
     * @return \Illuminate\Http\Response
     */
    public function show(Pelapak $pelapak)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Pelapak  $pelapak
     * @return \Illuminate\Http\Response
     */
    public function edit(Pelapak $pelapak)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Pelapak  $pelapak
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Pelapak $pelapak)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Pelapak  $pelapak
     * @return \Illuminate\Http\Response
     */
    public function destroy(Pelapak $pelapak)
    {
        //
    }
}