/**
 * Created by Rellaloop on 2016-06-26.
 */



$(document).tooltip({
    items: "img, [data-geo], [title]",
    content: function () {
        var element = $(this);
        if (element.is("[data-geo]") || element.is("img")) {
            var text = element.text();
            return "<i class='fftt'>减</i> <span style='font-size: small;font-family: 楷体'>满30减17</span><br>" +
                "<i id='ttff'>付</i> <span style='font-size: small;font-family: 楷体'>可在线支付</span><br>" +
                "<span style='font-size: small;font-family: 楷体'>30元起送|免配送费</span>";
        }

    }
});


$(document).tooltip({
    position: {
        my: "right bottom",
        at: "right bottom",
        using: function (position, feedback) {
            $(this).css(position);
            $("<div>")
                .addClass("arrow")
                .addClass(feedback.vertical)
                .addClass(feedback.horizontal)
                .appendTo(this);
        }
    }
});
