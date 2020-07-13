function add_to_cart(pid, pname, price) {

	let cart = localStorage.getItem("cart");
	if (cart == null) {		
		/* no cart yet */
		let products=[];
		let product={productId: pid, productName: pname, productQuantity:1, productPrice:price};
		products.push(product);
		localStorage.setItem("cart",JSON.stringify(products));
		console.log("Product is added for the first time");
	} else {
		/* cart is already present */
		let pcart=JSON.parse(cart);
		let oldProduct=pcart.find((item)=>item.productId ==pid)
		if(oldProduct){
			/*only we have to increase the quantity*/
			oldProduct.productQuantity=oldProduct.productQuantity+1;
			
			pcart.map((item)=>{
				if(item.productId==oldProduct.productId){
					item.productQuantity=oldProduct.productQuantity;
					
				}
			})
			localStorage.setItem("cart", JSON.stringify(pcart));
			console.log("Product Qunatity increased")
			
		}else{
			
		/*	we have to add the product to the cart*/
			let product={productId: pid, productName: pname, productQuantity:1, productPrice:price};
			pcart.push(product);
			localStorage.setItem("cart", JSON.stringify(pcart));
			console.log("Product is added");
		}
		
		
		
	}

}

/*
 * document.getElementById("test1"+div).classList.add("active");
 * document.getElementById("test2").classList.remove("active");
 * console.log("clicked");
 * document.getElementById("test2").classList.add("active");
 * document.getElementById("test1").classList.remove("active");
 */