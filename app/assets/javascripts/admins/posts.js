$(document).ready(function(){
  // disable auto discover
  Dropzone.autoDiscover = true;

  var dropzone = new Dropzone (".post_edit", {
	acceptedFiles: ".jpeg,.jpg,.png,.gif",
    maxFilesize: 10, // set the maximum file size to 256 MB
    paramName: "post[attachments_attributes][][image]", // Rails expects the file upload to be something like model[field_name]
    addRemoveLinks: false // don't show remove links on dropzone itself.
  });

  dropzone.on("success", function(file, response) {
    this.removeFile(file);
    $.getScript("/admins/posts");
    $.getScript("/admins/posts/"+ $('.post_id').attr('id') + "/edit");
    $(file.previewTemplate).find('.dz-remove').attr('id', response.fileID);
  })
  
  
  dropzone.on("removedfile", function(file){
			// grap the id of the uploaded file we set earlier
			var id = $(file.previewTemplate).find('.dz-remove').attr('id'); 

			// make a DELETE ajax request to delete the file
			$.ajax({
				type: 'DELETE',
				url: '/attachments/' + id,
				success: function(data, response){
					console.log(data.message);
				}
			});
		})
});

