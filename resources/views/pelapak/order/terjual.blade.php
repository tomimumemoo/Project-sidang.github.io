@extends('pelapak.layouts.master')

@section('main-content')

<?php

function rupiah($angka)
{

    $hasil_rupiah = "Rp " . number_format($angka, 2, ',', '.');
    return $hasil_rupiah;

}?>

<!-- DataTales Example -->
<div class="card shadow mb-4">
    <div class="row">
        <div class="col-md-12">
            @include('pelapak.layouts.notification')
        </div>
    </div>
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">List Produk Terjual <p class="float-right">Total Pendapatan:
                <b>{{rupiah($keuntungan)}}</b>
            </p>
        </h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            @if(count($orders)>0)
            <table class="table table-bordered" id="order-dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama Barang</th>
                        <th>Harga</th>
                        <th>Photo</th>
                        <th>Qty</th>
                        <th>Total</th>


                    </tr>
                </thead>

                <tbody>
                    <?php $no = 0?>
                    @foreach($orders as $order)

                    <tr>
                        <td>{{++$no}}</td>
                        <td>{{$order->title}}</td>
                        <td>{{rupiah($order->price)}}</td>
                        <td>
                            @if($order->photo)
                            @php
                            $photo=explode(',',$order->photo);
                            // dd($photo);
                            @endphp
                            <img src="{{$photo[0]}}" class="img-fluid zoom" style="max-width:80px"
                                alt="{{$order->photo}}">
                            @else
                            <img src="{{asset('backend/img/thumbnail-default.jpg')}}" class="img-fluid"
                                style="max-width:80px" alt="avatar.png">
                            @endif
                        </td>
                        <td>{{$order->terjual}}</td>
                        <td>{{rupiah($order->total_terjual)}}</td>



                    </tr>
                    @endforeach
                </tbody>
            </table>
            <span style="float:right">{{$orders->links()}}</span>
            @else
            <h6 class="text-center">Belum ada orderan</h6>
            @endif
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
$('#order-dataTable').DataTable({
    "columnDefs": [{
        "orderable": false,
        "targets": [5]
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