$(document).ready(function() {

        /* This is basic - uses default settings */
        
        $("a#single_image").fancybox({
                 'titlePosition'  : 'inside'
        });
        
        /* Using custom settings */
        
        $("a#inline").fancybox({
                'hideOnContentClick': true
        });

        $("a.group").fancybox({
                'speedIn'               :       600, 
                'speedOut'              :       200, 
                'overlayShow'   :       false
        });
});
