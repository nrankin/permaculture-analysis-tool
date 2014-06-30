function pp_slider(name, value, enabled){

    $(function() {
        $( "#" + name ).slider({
            orientation: "vertical",
            range: "min",
            min: 0,
            max: 100,
            value: value,
            slide: function( event, ui ) {
                $( name ).val( ui.value );
            }
        });
        if(enabled) {
            $("#" +name).slider( "enable");
        } else {
            $("#" +name).slider( "disable");
        }
        $( name ).val( $("#" +name).slider( "value") );
    });
}
function all_sliders(enabled){
    $(pp_slider("ObserveAndInteract", 0, enabled))
    $(pp_slider("CatchAndStoreEnergy", 0, enabled))
    $(pp_slider("ObtainAYield", 0, enabled))
    $(pp_slider("ApplySelfRegulationAndAcceptFeedback", 0, enabled))
    $(pp_slider("UseAndValueRenewableResourcesAndServices", 0, enabled))
    $(pp_slider("ProduceNoWaste", 0, enabled))
    $(pp_slider("DesignFromPatternsToDetails", 0, enabled))
    $(pp_slider("IntegrateRatherThanSegregate", 0, enabled))
    $(pp_slider("UseSmallAndSlowSolutions", 0, enabled))
    $(pp_slider("UseAndValueDiverstiy", 0, enabled))
    $(pp_slider("UseEdgesAndValueTheMarginal", 0, enabled))
    $(pp_slider("CreativelyUseAndRespondToChange", 0, enabled))
}