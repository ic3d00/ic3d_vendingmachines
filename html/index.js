$(function () {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })
    // if the person uses the escape key, it will exit the resource
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('https://ic3d_vendingmachines/exit', JSON.stringify({}));
            return
        }
    };
})

$("#container button").on("click", function(evt){
fetch(`https://${GetParentResourceName()}/buydrink`, {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json; charset=UTF-8',
    },
    body: JSON.stringify({
        type: $(this).data('type')
    })
}).then(resp => resp.json()).then(resp => console.log(resp));

});