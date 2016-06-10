//$(document).ready(function(){
//	// disable auto discover
//	  Dropzone.autoDiscover = false;
//
//	  var dropzone = new Dropzone (".edit_post", {		    
//		    mediaDropzone: false,
//		    acceptedFiles: ".jpeg,.jpg,.png,.gif",
//		    maxFilesize: 256, // set the maximum file size to 256 MB
//		    paramName: "post[attachments_attributes][][upload]", // Rails expects the file upload to be something like model[field_name]
//		    addRemoveLinks: true, // don't show remove links on dropzone itself.
//		    init: function() {
//		        var myDropzone = this;
//
//		        // First change the button to actually tell Dropzone to process the queue.
//		        this.element.querySelector("input[type=submit]").addEventListener("click", function(e) {
//		          // Make sure that the form isn't actually being sent.
////		          e.preventDefault();
////		          e.stopPropagation();
//		          myDropzone.processQueue();
//		        }); 
//		      }
//		  });
//
////		  dropzone.on("success", function(file, response) {
////		    //this.removeFile(file);
////		    //$.getScript("/attachments");
////		    $(file.previewTemplate).find('.dz-remove').attr('id', response.fileID);
////		  })
//	  
//});
//
//$(document).ready(function(){
//	alert('hiiiiiiiiiiiiiiiiiii');
//  // disable auto discover
//  Dropzone.autoDiscover = true;
//
//  var dropzone = new Dropzone (".dropzone", {
//	  alert('h000000000');
//    maxFilesize: 256, // set the maximum file size to 256 MB
//    paramName: "attachment[upload]", // Rails expects the file upload to be something like model[field_name]
//    addRemoveLinks: true // don't show remove links on dropzone itself.
//  });
//
//  dropzone.on("success", function(file, response) {
//    //this.removeFile(file);
//    $.getScript("/posts");
//    $(file.previewTemplate).find('.dz-remove').attr('id', response.fileID);
//  })
//  
//  
//  dropzone.on("removedfile", function(file){
//			// grap the id of the uploaded file we set earlier
//			var id = $(file.previewTemplate).find('.dz-remove').attr('id'); 
//
//			// make a DELETE ajax request to delete the file
//			$.ajax({
//				type: 'DELETE',
//				url: '/attachments/' + id,
//				success: function(data, response){
//					console.log(data.message);
//				}
//			});
//		})
//});

$(document).ready(function(){
  // disable auto discover
  Dropzone.autoDiscover = true;

  var dropzone = new Dropzone (".post_edit", {
	acceptedFiles: ".jpeg,.jpg,.png,.gif",
    maxFilesize: 10, // set the maximum file size to 256 MB
    paramName: "post[attachments_attributes][][upload]", // Rails expects the file upload to be something like model[field_name]
    addRemoveLinks: false // don't show remove links on dropzone itself.
  });

  dropzone.on("success", function(file, response) {
    this.removeFile(file);
    $.getScript("/posts");
    $.getScript("/posts/"+ $('.post_id').attr('id') + "/edit");
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

//$(document).ready(function(){
//	// disable auto discover
//	Dropzone.autoDiscover = true;
//
//	// grap our upload form by its id
//	$(".edit_post").dropzone({
//		acceptedFiles: ".jpeg,.jpg,.png,.gif",
//		// restrict image size to a maximum 1MB
//		maxFilesize: 10,
//		// changed the passed param to one accepted by
//		// our rails app
//	    paramName: "post[attachments_attributes][][upload]",
//		// show remove links on each image upload
//		addRemoveLinks: true,
//		// if the upload was successful
//		success: function(file, response){
//			// find the remove button link of the uploaded file and give it an id
//			// based of the fileID response from the server
//			$.getScript("/posts");
//			$(file.previewTemplate).find('.dz-remove').attr('id', response.fileID);
//			// add the dz-success class (the green tick sign)
//			$(file.previewElement).addClass("dz-success");
//		},
//		//when the remove button is clicked
//		removedfile: function(file){
//			// grap the id of the uploaded file we set earlier
//			var id = $(file.previewTemplate).find('.dz-remove').attr('id'); 
//
//			// make a DELETE ajax request to delete the file
//			$.ajax({
//				type: 'DELETE',
//				url: '/attachments/' + id,
//				success: function(data, response){
//					console.log(data.message);
//				}
//			});
//		}
//	});	
//});