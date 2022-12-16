//= require_tree .
//= require jquery3
//= require popper

//= require bootstrap
$(document).ready(function(){
    $(document).on('click','.destroy', function(e) {
        debugger
        $that=$(this)
        $.ajax({
            url: '/products/'  + $(this).parent().find('.pak').html(),
            type: 'DELETE',
            datatype: "json",
            success: function(e){
                debugger
                $that.parents('.card').remove();
                }
            })
        })
})

$(document).ready(function(){
    $(document).on('click','.cart-remove-btn', function(e) {
        $that = $(this)
        $.ajax({
            url: '/line_items/' + $(this).parent().find('.cart-id').html(),
            type: 'DELETE',
            datatype: "json",
            success: function(response){
                $that.parents('.cart-view').remove();
                $('#sub_total').html(response.sub_total);    
            }
            })
        })
})

$(document).ready(function(){
    $(document).on('click','.cart-add-btn', function(e) {
      
        $.ajax({
         url: '/line_items/'+ $(this).parent().find('.cart-id').html()+'/add/',
                method: 'POST',
                success: function(response){
                    // debugger
                    $('.quantity').html(response.quantity);
                    $('#sub_total').html(response.sub_total);    
                    // $('.total_price').html(response.total_price);    
                }
            })
        })
})


// $(document).ready(function(){
//     $(document).on('click','.cart-add-btn', function(e) {
//         // debugger
//         $.ajax({
//             // datatype: "json",
//          url: '/line_items/'+ document.getElementById("cart-id").innerHTML+'/add/',
//                 type: 'POST',
//                 success: function(response){
//                     $('#quantity').html(response.quantity);
//                 }
//             })
//         })
// })