var state;
var mes;
var room;
var numOfUsers = 0;
var roomid;
var usernameid;

function Chat (roomName) {
	room = roomName;
	this.init = chatInit;
//    this.update = updateChat;
//    this.send = sendChat;    
//	this.getState = getStateOfChat;
//	this.trim = trimstr;
	//this.getUsers = getuserlist;
}

function chatInit(){
	getStateOfChat();
}

function wait(){
	updateChat();
}

$.ajaxSetup({
    cache: false // for ie
});

//gets the state of the chat
function getStateOfChat(){
	 $.ajax({
		   type: "GET",
		   url: "/live_chat/connect",
		   data: {
			  room: room,
			  state: 'getState',
			},
		    dataType: "json",
		
		   success: function(data){
			   state = data.state-100;
			   updateChat();
		   },
		});
}
		 
//Updates the chat
function updateChat(){
     $.ajax({
     
        type: "POST",
        url: "/live_chat/update",
        data: {  
            'state': state,
            'room' : room
            },
        dataType: "json",
        cache: false,
        success: function(data) {
        
            if (data.text != null) {
                for (var i = 0; i < data.text.length; i++) {  
                    $('#chatbox-area').append($(data.text[i]));
                }
            
                document.getElementById('chatbox-area').scrollTop = document.getElementById('chatbox-area').scrollHeight;
        
            }  
        
        instanse = false;
        state = data.state;
        setTimeout('updateChat()', 1);
        
        },
    });
}

//send the message
function sendChat(message) {       
   
     $.ajax({
		   type: "POST",
		   url: "/live_chat/connect",
		   data: {  
			  'room': room,
		   	  'function': 'send',
		   	  'message': message,					
			},
		   dataType: "json",
		   success: function(data){
			
		   },
		});

}

function trimstr(s, limit) {
    return s.substring(0, limit);
} 

function getuserlist(room, username) {

	roomid = room;
	usernameid = username;
	
	 $.ajax({
        type: "GET",
        url: "/live_chat/userlist",
        data: {  
        		'room' : room,
        		'username': username,
        		'current' : numOfUsers
        		
        		},
        dataType: "json",
        cache: false,
        success: function(data) {
        
        	if (numOfUsers != data.numOfUsers) {
        		numOfUsers = data.numOfUsers;
        		var list = "<li class='head'>Current Chatters</li>";
        		for (var i = 0; i < data.userlist.length; i++) {  
                   list += "<li>"+ data.userlist[i] +"</li>";
                }
        		$('#userlist').html($("<ul>"+ list +"</ul>"));
        	}
        	
            setTimeout('getuserlist(roomid, usernameid)', 1);
           
        },
    });
	
}