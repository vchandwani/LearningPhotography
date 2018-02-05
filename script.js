$(document).ready(function () {
    
    $( "#changePasswordButton" ).click(function() {
        $('#changePasswordDiv').removeClass('hidden');
        $('#loginDiv').addClass('hidden');
        $('#newUserDiv').addClass('hidden');
    });

    $( "#cancelChangePassword" ).click(function() {
        $('#changePasswordDiv').addClass('hidden');
        $('#loginDiv').removeClass('hidden');
        $('#newUserDiv').addClass('hidden');     
    });
    
    $( "#newUserButton" ).click(function() {
        $('#newUserDiv').removeClass('hidden');
        $('#loginDiv').addClass('hidden');
        $('#changePasswordDiv').addClass('hidden');
    });
    $( "#cancelNewUser" ).click(function() {
        $('#newUserDiv').addClass('hidden');
        $('#loginDiv').removeClass('hidden');
        $('#changePasswordDiv').addClass('hidden');
    });
});