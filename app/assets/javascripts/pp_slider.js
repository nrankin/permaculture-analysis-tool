function pp_slider(name, value)           {
    $(function() {
        $( name + "_id" ).slider({
            orientation: "vertical",
            range: "min",
            min: 0,
            max: 100,
            value: value,
            slide: function( event, ui ) {
                $( name ).val( ui.value );
            }
        });
        $( name ).val( $(name + "_id").slider( "value" ) );
    });
}