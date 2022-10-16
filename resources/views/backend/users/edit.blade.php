@extends('backend.layouts.master')

@section('main-content')

<div class="card">
    <h5 class="card-header">Edit User</h5>
    <div class="card-body">
        <form method="post" action="{{route('users.update',$user->id)}}">
            @csrf
            @method('PATCH')
            <div class="form-group">
                <label for="inputTitle" class="col-form-label">Name</label>
                <input id="inputTitle" type="text" name="name" placeholder="Enter name" value="{{$user->name}}"
                    class="form-control">
                @error('name')
                <span class="text-danger">{{$message}}</span>
                @enderror
            </div>

            <div class="form-group">
                <label for="inputEmail" class="col-form-label">Email</label>
                <input id="inputEmail" type="email" name="email" placeholder="Enter email" value="{{$user->email}}"
                    class="form-control">
                @error('email')
                <span class="text-danger">{{$message}}</span>
                @enderror
            </div>

            {{-- <div class="form-group">
            <label for="inputPassword" class="col-form-label">Password</label>
          <input id="inputPassword" type="password" name="password" placeholder="Enter password"  value="{{$user->password}}"
            class="form-control">
            @error('password')
            <span class="text-danger">{{$message}}</span>
            @enderror
    </div> --}}

    <div class="form-group">
        <label for="inputPhoto" class="col-form-label">Photo</label>
        <div class="input-group">
            <span class="input-group-btn">
                <a id="lfm" data-input="thumbnail" data-preview="holder" class="btn btn-primary">
                    <i class="fa fa-picture-o"></i> Choose
                </a>
            </span>
            <input id="thumbnail" class="form-control" type="text" name="photo" value="{{$user->photo}}">
        </div>
        <img id="holder" style="margin-top:15px;max-height:100px;">
        @error('photo')
        <span class="text-danger">{{$message}}</span>
        @enderror
    </div>
    @php
    $roles=DB::table('users')->select('role')->where('id',$user->id)->get();
    // dd($roles);
    $pengajuan = DB::table('pengajuan_pelapak')->where('user_id', $user->id)->get();
    $isData = count($pengajuan);
    @endphp



    @if($isData > 0)
    <h5>Data Pengajuan Pelaopak</h5>

    <div class="form-group">
        <label for="inputPhoto" class="col-form-label">Alamat</label>
        <div class="input-group">
            <textarea cols="30" rows="5" class="form-control" readonly>{{ $pengajuan[0]->alamat }}</textarea>
        </div>
    </div>

    <div class="form-group">
        <label for="inputPhoto" class="col-form-label">Nomor Handphone</label>
        <div class="input-group">
            <input class="form-control" type="text" value="{{ $pengajuan[0]->no_hp }}" readonly>
        </div>
    </div>

    <div class="form-group">
      
      <a class="btn btn-primary text-white" href="{{url('/images/ktp/' . $pengajuan[0]->ktp)}}" target="_blank">Lihat KTP</a>
    </div>



    <p>---------------------------------------------------------------------------------------------------</p>

    @endif





    <div class="form-group">
        <label for="role" class="col-form-label">Role</label>
        <select name="role" class="form-control">
            <option value="">-----Select Role-----</option>
            @foreach($roles as $role)
            <option value="admin" {{(($role->role=='admin') ? 'selected' : '')}}>Admin</option>
            <option value="pelapak" {{(($role->role=='pelapak') ? 'selected' : '')}}>Pelapak</option>
            <option value="user" {{(($role->role=='user') ? 'selected' : '')}}>User</option>
            @endforeach
        </select>
        @error('role')
        <span class="text-danger">{{$message}}</span>
        @enderror
    </div>
    <div class="form-group">
        <label for="status" class="col-form-label">Status</label>
        <select name="status" class="form-control">
            <option value="active" {{(($user->status=='active') ? 'selected' : '')}}>Active</option>
            <option value="inactive" {{(($user->status=='inactive') ? 'selected' : '')}}>Inactive</option>
        </select>
        @error('status')
        <span class="text-danger">{{$message}}</span>
        @enderror
    </div>
    <div class="form-group mb-3">
        <button class="btn btn-success" type="submit">Update</button>
    </div>
    </form>
</div>
</div>

@endsection

@push('scripts')
<script src="/vendor/laravel-filemanager/js/stand-alone-button.js"></script>
<script>
$('#lfm').filemanager('image');
</script>
@endpush