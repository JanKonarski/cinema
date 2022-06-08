<!DOCTYPE html>
<html lang="en">
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<input type="text" id="name" placeholder="name"/>
	<input type="password" id="password" placeholder="password"/>
	<input type="submit" id="login" value="Login"/>
	<a href="#">Register</a>
	<script>
		$('#login').click(function(){
            if ((document.getElementById('name').value == '') || (document.getElementById('password').value == '')) {
                alert('Name and password are required');
                return;
            }

            var data = {
                'name': JSON.stringify(document.getElementById('name').value),
                'password': JSON.stringify(document.getElementById('password').value)
            };
            $.ajax({
                url: 'login_post.php',
                type: 'post',
                data: data,
                success: function(response){
                    if (JSON.parse(response).status == '1') {
                        location.href = 'index.php';
                    } else
                        alert('Name or password invalid');
                },
                error: function(){
                    alert('Error');
                }
            });
		});
	</script>
</body>
</html>