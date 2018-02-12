$(document).ready(function () {
    $(".alert").fadeTo(2000, 500).slideUp(500, function(){
        $(".alert").slideUp(500);
    }); 
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
    $('img').each(   
        function(){
            $(this).on('load', function() { 
                // Remove loader
                $(this).removeClass('loader');
            })
        });
});
