<!DOCTYPE html>
<html lang="en">

@include('pelapak.layouts.head')

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        @include('pelapak.layouts.sidebar')
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                @include('pelapak.layouts.header')
                <!-- End of Topbar -->

                <div class="container-fluid">
                <!-- Begin Page Content -->
                @yield('main-content')
                <!-- /.container-fluid -->
                </div>

            </div>
            <!-- End of Main Content -->
            @include('pelapak.layouts.footer')

</body>

</html>