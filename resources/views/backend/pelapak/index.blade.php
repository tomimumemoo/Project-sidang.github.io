@extends('backend.layouts.master')

@section('main-content')
<!-- DataTales Example -->

<?php

function rupiah($angka)
{

    $hasil_rupiah = "Rp " . number_format($angka, 2, ',', '.');
    return $hasil_rupiah;

}?>

<div class="card shadow mb-4">
    <div class="row">
        <div class="col-md-12">
            @include('backend.layouts.notification')
        </div>
    </div>
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary float-left">List Pendapatan Pelapak</h6>

    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="user-dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama Pelapak</th>
                        <th>Keuntungan</th>
                        <th width=200>Aksi</th>

                    </tr>
                </thead>

                <tbody>
                    <?php $no = 0?>
                    @foreach($data_orders as $user)
                    <tr>
                        <td>{{ ++$no}}</td>
                        <td>{{$user->nama_penjual}}</td>
                        <td>{{rupiah($user->total_terjual)}}</td>
                        <td>
                            <a class="btn btn-primary" href="{{route('barang_terjual', $user->id_penjual)}}">Lihat
                                Barang Terjual</a>
                        </td>


                        {{-- Delete Modal --}}
                        {{-- <div class="modal fade" id="delModal{{$user->id}}" tabindex="-1" role="dialog"
                        aria-labelledby="#delModal{{$user->id}}Label" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="#delModal{{$user->id}}Label">Delete user</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form method="post" action="{{ route('users.destroy',$user->id) }}">
                                        @csrf
                                        @method('delete')
                                        <button type="submit" class="btn btn-danger"
                                            style="margin:auto; text-align:center">Parmanent delete user</button>
                                    </form>
                                </div>
                            </div>
                        </div>
        </div> --}}
        </tr>
        @endforeach
        </tbody>
        </table>
        <span style="float:right">{{$data_orders->links()}}</span>
    </div>
</div>
</div>
@endsection

@push('styles')
<link href="{{asset('backend/vendor/datatables/dataTables.bootstrap4.min.css')}}" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<style>
div.dataTables_wrapper div.dataTables_paginate {
    display: none;
}
</style>
@endpush

@push('scripts')

<!-- Page level plugins -->
<script src="{{asset('backend/vendor/datatables/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('backend/vendor/datatables/dataTables.bootstrap4.min.js')}}"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<!-- Page level custom scripts -->
<script src="{{asset('backend/js/demo/datatables-demo.js')}}"></script>
<script>
$('#user-dataTable').DataTable({
    "columnDefs": [{
        "orderable": false,
        "targets": [3]
    }]
});

// Sweet alert

function deleteData(id) {

}
</script>
<script>
$(document).ready(function() {
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $('.dltBtn').click(function(e) {
        var form = $(this).closest('form');
        var dataID = $(this).data('id');
        // alert(dataID);
        e.preventDefault();
        swal({
                title: "Are you sure?",
                text: "Once deleted, you will not be able to recover this data!",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            })
            .then((willDelete) => {
                if (willDelete) {
                    form.submit();
                } else {
                    swal("Your data is safe!");
                }
            });
    })
})
</script>
@endpush