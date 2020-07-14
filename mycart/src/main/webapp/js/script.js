function add_to_cart(pid, pname, price) {

	let cart = localStorage.getItem("cart");
	if (cart == null) {		
		/* no cart yet */
		let products=[];
		let product={productId: pid, productName: pname, productQuantity:1, productPrice:price};
		products.push(product);
		localStorage.setItem("cart",JSON.stringify(products));
		//console.log("Product is added for the first time");
		showToast2("Item added to cart");
	} else {
		/* cart is already present */
		let pcart=JSON.parse(cart);
		let oldProduct=pcart.find((item)=>item.productId ==pid)
		if(oldProduct){
			/* only we have to increase the quantity */
			oldProduct.productQuantity=oldProduct.productQuantity+1;
			
			pcart.map((item)=>{
				if(item.productId==oldProduct.productId){
					item.productQuantity=oldProduct.productQuantity;
					
				}
			})
			localStorage.setItem("cart", JSON.stringify(pcart));
		//	console.log("Product Qunatity increased")
			showToast2(oldProduct.productName+" Product quantitiy increased, Quantity =" + oldProduct.productQuantity);
		}else{
			
		/* we have to add the product to the cart */
			let product={productId: pid, productName: pname, productQuantity:1, productPrice:price};
			pcart.push(product);
			localStorage.setItem("cart", JSON.stringify(pcart));
			showToast2("Product is added to cart");
		}
	}
	
	updateCart();
}



/* update cart */
function updateCart(){
	let cartString= localStorage.getItem("cart");
	let cart= JSON.parse(cartString);
	if(cart==null || cart.length==0){
		console.log("cart is empty");
		$('.cart-items').html(" ( 0 ) ");
		$(".cart-body").html("<h3> Your Shoping Cart is Empty </h3>");
		$(".checkout-btn").attr('disabled', true);
	}else{
		/* there is something in card to show */
		console.log(cart);
		$('.cart-items').html(`( ${cart.length} )`);
		let table=`
		<table class='table'>
		<thead class='thead-light'>
			<tr>
				<th>Item Name</th>
				<th>Item Price</th>
				<th>Item Quantity</th>
				<th>Total Price</th>
				<th>Action</th>
			
			
			</tr>
		
		
		</thead>
		`;
		let totalPrice=0;
		let totalItemQuantity=0;
		cart.map((item)=>{
				table+=`
				<tr>
					<td>${item.productName}</td>
						<td>${item.productPrice}</td>
							<td>${item.productQuantity}</td>
								<td>${item.productQuantity* item.productPrice}</td>
								<td> <button onclick='deleteItemFromCart(${item.productId})' class="btn btn-danger btn-sm">Remove</button </td>
				
				</tr>
				`
					totalPrice+=item.productPrice*item.productQuantity;
				totalItemQuantity+=item.productQuantity;
		})
		
		
		
		
		table=table+`
		<tr>
		<td colspan='5' class='text-right font-weight-bold'>Your Subtotal : &#8377;${totalPrice}(${totalItemQuantity} items)</td>
		
		</tr>
		</table>`
		$(".cart-body").html(table);
		$(".checkout-btn").attr('disabled', false);
	}

}
/*Delete Item */
function deleteItemFromCart(pid){
	let cart=JSON.parse(localStorage.getItem('cart'));
	let newcart=cart.filter((item)=>item.productId!=pid)
	localStorage.setItem('cart',JSON.stringify(newcart))
	updateCart();
	showToast2("Item removed from cart");
}

$(document).ready(function(){
	updateCart();
	showToast();	
	showToast1();
})

/*show toast */
function showToast() {
        $('#toast').addClass('display');

        setTimeout(() => {
          $('#toast').removeClass('display');
        }, 2000);
      }
function showToast1() {
    $('#toast1').addClass('display');

    setTimeout(() => {
      $('#toast1').removeClass('display');
    }, 2000);
  }


function showToast2(content) {
    $('#toast3').addClass('display');
    $('#toast3').html(content);

    setTimeout(() => {
      $('#toast3').removeClass('display');
    }, 2000);
  }
function goToCheckout(){
	window.location="checkout.jsp";
}


      




/*
 * document.getElementById("test1"+div).classList.add("active");
 * document.getElementById("test2").classList.remove("active");
 * console.log("clicked");
 * document.getElementById("test2").classList.add("active");
 * document.getElementById("test1").classList.remove("active");
 */