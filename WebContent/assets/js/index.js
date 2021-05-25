$(function() {
    "use strict";

    $('.knob2').knob({
        draw: function() {           
        }
    });

    // progress bars
    $('.progress .progress-bar').progressbar({
            display_text: 'none'
    });



   


    // notification popup
    toastr.options.closeButton = true;
    toastr.options.positionClass = 'toast-bottom-right';    
    toastr['success']('Hello, welcome to Occura, a unique Hospital Management.');


   

    // Add the Flot version string to the footer
    $("#footer").prepend("Flot " + $.plot.version + " &ndash; ");
    
});
