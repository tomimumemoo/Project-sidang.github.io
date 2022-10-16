<?php

namespace App\Http\Controllers;

use App\Models\Settings;
use App\Rules\MatchOldPassword;
use App\User;
use Carbon\Carbon;
use Hash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Session;

class AdminController extends Controller
{
    public function index()
    {
        $data = User::select(\DB::raw("COUNT(*) as count"), \DB::raw("DAYNAME(created_at) as day_name"), \DB::raw("DAY(created_at) as day"))
            ->where('created_at', '>', Carbon::today()->subDay(6))
            ->groupBy('day_name', 'day')
            ->orderBy('day')
            ->get();
        $array[] = ['Name', 'Number'];
        foreach ($data as $key => $value) {
            $array[++$key] = [$value->day_name, $value->count];
        }
        //  return $data;
        return view('backend.index')->with('users', json_encode($array));
    }

    public function profile()
    {
        $profile = Auth()->user();
        // return $profile;
        return view('backend.users.profile')->with('profile', $profile);
    }

    public function penjualan_pelapak()
    {

        $data_orders = DB::table('detail_order')->selectRaw('*, SUM(total) total_terjual')->groupBy('id_penjual')->paginate(10);

        // dd($data_orders);

        // $untung = 0;
        // foreach ($data_orders as $d) {

        //     $untung = $untung + $d->total_terjual;
        // }

        // $keuntungan = $untung;

        // $keuntungan = $users[0]['keuntungan'];

        // dd();

        // $data = [
        //     'keuntungan' => $keuntungan,
        // ];

        $users = User::orderBy('id', 'ASC')->paginate(10);
        return view('backend.pelapak.index')->with('data_orders', $data_orders);
    }

    public function barang_terjual($id, $cat_id = null, $sub_cat_id = null)
    {

        $where = [];

        if ($cat_id == null && $sub_cat_id == null) {

            $where = [
                'id_penjual' => $id,
            ];
        } elseif ($cat_id != null && $sub_cat_id == null) {
            $where = [
                'id_penjual' => $id,
                'cat_id' => $cat_id,
            ];
        } elseif ($cat_id != null && $sub_cat_id != null) {
            $where = [
                'id_penjual' => $id,
                'cat_id' => $cat_id,
                'child_cat_id' => $sub_cat_id,
            ];
        }

        // $tanggal = $_GET['tanggal_awal'];
        $tgl = isset($_GET['tanggal_awal']) ? $_GET['tanggal_awal'] : '';

        if ($tgl) {

            $where = $where + ['tanggal_order' => $_GET['tanggal_awal']];
        }

        $id_penjual = Session::get('user')['id_user'];
        $data_orders = DB::table('detail_order')->selectRaw('*, SUM(qty) terjual, SUM(total) total_terjual')->where($where)->groupBy('id_product')->paginate(10);

        // dd(Session::get('user')['id_user']);

        $untung = 0;
        foreach ($data_orders as $d) {

            $untung = $untung + $d->total_terjual;
        }

        $keuntungan = $untung;

        // dd();

        $data = [
            'keuntungan' => $keuntungan,
            'orders' => $data_orders,
        ];

        // dd($data);

        return view('backend.pelapak.terjual')->with($data);
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

    public function settings()
    {
        $data = Settings::first();
        return view('backend.setting')->with('data', $data);
    }

    public function settingsUpdate(Request $request)
    {
        // return $request->all();
        $this->validate($request, [
            'short_des' => 'required|string',
            'description' => 'required|string',
            'photo' => 'required',
            'logo' => 'required',
            'address' => 'required|string',
            'email' => 'required|email',
            'phone' => 'required|string',
        ]);
        $data = $request->all();
        // return $data;
        $settings = Settings::first();
        // return $settings;
        $status = $settings->fill($data)->save();
        if ($status) {
            request()->session()->flash('success', 'Setting successfully updated');
        } else {
            request()->session()->flash('error', 'Please try again');
        }
        return redirect()->route('admin');
    }

    public function changePassword()
    {
        return view('backend.layouts.changePassword');
    }
    public function changPasswordStore(Request $request)
    {
        $request->validate([
            'current_password' => ['required', new MatchOldPassword],
            'new_password' => ['required'],
            'new_confirm_password' => ['same:new_password'],
        ]);

        User::find(auth()->user()->id)->update(['password' => Hash::make($request->new_password)]);

        return redirect()->route('admin')->with('success', 'Password successfully changed');
    }

    // Pie chart
    public function userPieChart(Request $request)
    {
        // dd($request->all());
        $data = User::select(\DB::raw("COUNT(*) as count"), \DB::raw("DAYNAME(created_at) as day_name"), \DB::raw("DAY(created_at) as day"))
            ->where('created_at', '>', Carbon::today()->subDay(6))
            ->groupBy('day_name', 'day')
            ->orderBy('day')
            ->get();
        $array[] = ['Name', 'Number'];
        foreach ($data as $key => $value) {
            $array[++$key] = [$value->day_name, $value->count];
        }
        //  return $data;
        return view('backend.index')->with('course', json_encode($array));
    }

    // public function activity(){
    //     return Activity::all();
    //     $activity= Activity::all();
    //     return view('backend.layouts.activity')->with('activities',$activity);
    // }
}