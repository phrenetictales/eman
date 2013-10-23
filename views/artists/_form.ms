{{#artist}}
  <script src="/js/vendor/jquery.ui.widget.js"></script>
  <!--
  The Load Image plugin is included for the preview images and image resizing functionality ...
  (NOT INCLUDED IN THE ZIP FILE, FFS!)
  <script src="http://blueimp.github.io/JavaScript-Load-Image/js/load-image.min.js"></script>
  -->
  <!-- The Canvas to Blob plugin is included for image resizing functionality -->
  <!-- NOT IN PACKAGE
  <script src="http://blueimp.github.io/JavaScript-Canvas-to-Blob/js/canvas-to-blob.min.js"></script>
  -->
  <!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
  <script src="/js/jquery.iframe-transport.js"></script>
  <!-- The basic File Upload plugin -->
  <script src="/js/jquery.fileupload.js"></script>
  <!-- The File Upload processing plugin -->
  <!-- <script src="/js/jquery.fileupload-process.js"></script> -->
  <!-- The File Upload image preview & resize plugin -->
  <!-- <script src="/js/jquery.fileupload-image.js"></script> -->
  <!-- The File Upload validation plugin -->
  <!-- <script src="/js/jquery.fileupload-validate.js"></script> -->
  <p>
    <label for="name">Name</label>
    <br/>
    <input name="name" value="{{name}}"/>
  </p>
  <p>
    <style>
    .bar {
      height: 18px;
      background: green;
    }
    </style>
    <label for="picture">Photo</label>
    <br/>
      {{#picture.url}}
        <img src="{{.}}"/>
      {{/picture.url}}
      {{^picture.url}}
        <img src="/img/profile_person_generic.jpg"/>
      {{/picture.url}}
    <br/>
    <input id="picture" type="file" name="picture" data-url="/pictures/upload/"/>
    <input type="hidden" name="picture_id" value="{{picture.id}}"/>
    <div id="progress">
      <div class="bar" style="width: 0%;"></div>
    </div>
  </p>
  <script src="/js/artists/picture.js">
  </script>
{{/artist}}
