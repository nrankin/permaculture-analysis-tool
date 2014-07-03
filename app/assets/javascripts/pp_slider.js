
function pp_slider(name, value, enabled){

    var amount = "#amount_" + name
    $(function() {
        $( "#" + name ).slider({
            orientation: "vertical",
            range: "min",
            min: 0,
            max: 100,
            value: value,
            slide: function( event, ui ) {
                $( amount ).val( ui.value );
            }
        });
        if(enabled) {
            $("#" +name).slider( "enable");
        } else {
            $("#" +name).slider( "disable");
        }
        $( amount ).val( $("#" +name).slider( "value") );

    });

}