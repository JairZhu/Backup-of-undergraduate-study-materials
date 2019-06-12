var url = 'http://localhost:5000'
page_local_file = function(){
	$('#page-local').addClass("active")
	$('#page-download').removeClass("active")
	$('#page-remote').removeClass("active")
	$('#table-col-1').text('文件名')
	$('#table-col-2').text('文件大小')
	$('#table-col-3').text('')
	$.get(url,'method=local-files',function(data){
		var obj = jQuery.parseJSON(data)
		$.each(obj,function(){
			var file_name = this[0]
			var file_size = this[1]
			var htmlstr = '<tr><th>' + file_name + '</th><th>' + file_size + '</th></tr>' 
			$('#table-dynamic').append(htmlstr)
		})
	})
}

page_remote_file = function(){
	$('#page-remote').addClass("active")
	$('#page-local').removeClass("active")
	$('#page-download').removeClass("active")
		$.ajax({
		type:"post",
		url:"Peer.py",
		async:true,
		data:{"method":"local_files"},
		success:function(data){
			
		}
	});
}

page_downloading = function(){
	$('#page-download').addClass("active")
	$('#page-local').removeClass("active")
	$('#page-remote').removeClass("active")		
}


