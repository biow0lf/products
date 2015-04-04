$(document).ready(function() {
    var popup = $('#popupit');
    popup.addClass('white-popup-block');
    popup.addClass('mfp-hide');

    if (popup.length) {
        $.magnificPopup.open({
            items: {
                src: '#popupit'
            },
            type: 'inline',
            modal: true
        });
    }
});
