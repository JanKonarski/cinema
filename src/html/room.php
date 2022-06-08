<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
        .room {
            width: auto;
        }

        .screen {
            width: 500px;
			height: 6px;
	        background-color: #505050;
        }

        table {
            margin-top: 75px;
        }

        .seat {
	        width: 25px;
	        height: 25px;
            margin: 2px;
            text-align: center;
            color: white;
            vertical-align: middle;
            cursor: grab;
        }

        .free {
            background-color: green;
        }

        .select {
            background-color: orange;
        }

        .occupied {
            background-color: gray;
        }

        .transition {
	        width: 45px;
	        height: 15px;
        }
	</style>
	<script>

	</script>
</head>
<body>
	<div class="room">
		<div class="screen"></div>
		<table class="seats">
<?php
	for ($i=1; $i<11; $i++) {
		print('<tr>');
		for ($j=1; $j<9; $j++)
			print('<td><div class="seat free" id="' .('r'.$i.'c'.$j). '">' .($j). '</div></td>');
		print('<td><div class="transition"></div></td>');
		for ($j=1; $j<9; $j++)
			print('<td><div class="seat free" id="' .('r'.$i.'c'.$j). '">' .(8+$j). '</div></td>');
		print('</tr>');
	}
?>
		</table>
        <input type="button" id="check" value="check"/>
        <input type="submit" id="submit" value="Next"/>
	</div>
	<script>
        $('.seat').click(function(){
            if ($(this).hasClass('occupied')) {
                alert('This seat is occupied');
                return;
            } else {
                if ($(this).hasClass('free')) {
                    $(this).removeClass('free');
                    $(this).addClass('select');
                } else {
                    $(this).removeClass('select');
                    $(this).addClass('free');
                }
            }
        });

        $('#check').click(function(){
            var list = document.getElementsByClassName('select');
            var list2 = [];
            var text = '';
            $.each(list, function(index, item){
                text += item.id + '\n';
                list2.push(item.id);
            });
            alert(text);
            alert(JSON.stringify(list2));
        });

        $('input#submit').click(function(){
            var list = [];
            $.each(document.getElementsByClassName('select'), function(index, item){
                list.push(item.id);
            });
            var request = {'seats': JSON.stringify(list).toString()};
            $.ajax({
                url: 'room_post.php',
                type: 'post',
                data: request,
                success: function(response) {
                    console.log(request);
                },
                error: function() {
                    alert('Error');
                }
            });
        });
	</script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>