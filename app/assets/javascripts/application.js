//= require_tree .
//= require jquery3
//= require popper
//= require turbolinks
//= require bootstrap
//destroy main product Item
$(document).ready(function(){
    $(document).on('click','.destroy', function(e) {
        $that=$(this)
        $.ajax({
            url: '/products/'  + $(this).parent().find('.pak').html(),
            type: 'DELETE',
            datatype: "json",
            success: function(e){
                $that.parents('.card').remove();
                }
            })
        })
})
//destroy  Cart Line-Item
$(document).ready(function(){
    $(document).on('click','.cart-remove-btn', function(e) {
        $that = $(this)
        $.ajax({
            url: '/line_items/' + $(this).parent().find('.lineItem-id').html(),
            type: 'DELETE',
            datatype: "json",
            success: function(response){
                $that.parents('.cart-view').remove();
                $('#sub_total').html(response.sub_total);    
            }
            })
        })
})

// Add quantity btn
$(document).ready(function(){
    $(document).on('click','.cart-add-btn', function(e) {
        $that = $(this)
        $.ajax({
         url: '/line_items/'+ $(this).parent().find('.cart-id').html()+'/add/',
                method: 'POST',
                success: function(response){
                    $that.parent().find('.quantity').html(response.quantity);
                    $that.parent().find('.total_price').html(response.total_price);
                    $('#sub_total').html(response.sub_total);        
                }
            })
        })
})

// reduce qauntiy btn
$(document).ready(function(){
    $(document).on('click','.cart-remove-btn-1', function(e) {
        $that = $(this)
        $.ajax({
            url: '/line_items/'+ $(this).parent().find('.cart-id').html()+'/reduce/',
            method: 'GET',
                success: function(response){
                    $that.parent().find('.quantity').html(response.quantity);
                    $that.parent().find('.total_price').html(response.total_price);
                    $('#sub_total').html(response.sub_total);  
                }
            })
        })
})

// $(document).ready(function(){
//     $(document).on('click','#home', function(e) {
//         $.ajax({
//             url: 'products',
//             success: function(data){
//                 $('.container').html(data);
//                 }
//             })
//         })
// })
// $(document).ready(function(){
//     $(document).on('click','#order', function(e) {
//         $.ajax({
//             url: 'orders',
//             success: function(data){
//                 $('.container').html(data);
//                 }
//             })
//         })
// })
// $(document).ready(function(){
//     $(document).on('click','#cart-image', function(e) {
//         $.ajax({
//             url: 'carts/show',
//             success: function(data){
//                 $('.container').html(data);
//                 }
//             })
//         })
// })
// add to cart btn
$(document).ready(function(){
    $(document).on('click','.add-item', function(e) {
        $.ajax({
        type: 'POST',
         url: 'line_items',
           dataType:'json',
                data :{'product_id' : $(this).parent().find('.pak').html()},
                success: function(data){
                   
                }
            })
        })
})
