<?php
  include_once(__DIR__. '/../../db/config.php');
	include_once(__DIR__. '/../../utils/utility.php');
	include_once(__DIR__. '/../../db/database.php');
?>
  <!-- jQuery -->
  <script src="<?=$baseUrl?>/admin/plugins/jquery/jquery.min.js"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="<?=$baseUrl?>/admin/plugins/jquery-ui/jquery-ui.min.js"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script>
        $.widget.bridge('uibutton', $.ui.button)
    </script> 
    <!-- Bootstrap 4 -->
    <script src="<?=$baseUrl?>/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- ChartJS -->
    <script src="<?=$baseUrl?>/admin/plugins/chart.js/Chart.min.js"></script>
    <!-- Sparkline -->
    <script src="<?=$baseUrl?>/admin/plugins/sparklines/sparkline.js"></script>
    <!-- JQVMap -->
    <script src="<?=$baseUrl?>/admin/plugins/jqvmap/jquery.vmap.min.js"></script>
    <script src="<?=$baseUrl?>/admin/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
    <!-- jQuery Knob Chart -->
    <script src="<?=$baseUrl?>/admin/plugins/jquery-knob/jquery.knob.min.js"></script>
    <!-- daterangepicker -->
    <script src="<?=$baseUrl?>/admin/plugins/moment/moment.min.js"></script>
    <script src="<?=$baseUrl?>/admin/plugins/daterangepicker/daterangepicker.js"></script>
    <!-- Tempusdominus Bootstrap 4 -->
    <script src="<?=$baseUrl?>/admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
    <!-- Summernote -->
    <script src="<?=$baseUrl?>/admin/plugins/summernote/summernote-bs4.min.js"></script>
    <!-- overlayScrollbars -->
    <script src="<?=$baseUrl?>/admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
    <!-- AdminLTE App -->
    <script src="<?=$baseUrl?>/admin/dist/js/adminlte.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="<?=$baseUrl?>/admin/dist/js/demo.js"></script>
    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="<?=$baseUrl?>/admin/dist/js/pages/dashboard.js"></script>
    <script src="<?=$baseUrl?>/admin/plugins/ckeditor/ckeditor.js"></script>
</body>

</html>