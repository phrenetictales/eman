<div id="password">
  <form method="POST">
    <div>
      <label for="password" class="password">Password</label>
      <input type="password" class="password" name="password">
    </div>
    <div style="border-top: solid 1px grey; width: 100%; clear:both">
      <label for="password" class="password">Confirm</label>
      <input type="password" class="password" name="password_confirm">
    </div>
    <label for="submit" class="submit"></label>
    <input type="submit"  class="submit" value="Change Password">
  </form>
  <div style="clear:both"></div>
</div>

<div id="error" style="{{^flash.error}}display:none{{/flash.error}}">
  <h3>{{flash.error.title}}</h3>
  <p>{{flash.error.message}}</p>
</div>


<script>
$('#password').submit(function() {
  $('#error p').html('');
  var password = $('[name="password"]', this),
        password_confirm = $('[name="password_confirm"]', this);
  console.log('PASSWORDS = ' + password.val() + ' -> ' + password_confirm.val());
  if (password.val().length == 0) {
    $('#error p').html('Password is blank');
    $('#error').show();
  }
  if (password.val() != password_confirm.val()) {
    $('#error p').html('Passwords do not match');
    $('#error').show();
    return false;
  }
  
  return true;
});
</script>
