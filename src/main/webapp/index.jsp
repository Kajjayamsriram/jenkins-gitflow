<!doctype html>
<html lang="en">
  
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>HelloShop</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
:root {
    --primary:#0a2540;
    --accent:#00aaff;
    --bg:#ffffff;
    --muted:#777;
}

/* BASE */
body{
    margin:0;
    font-family:Inter;
    background:#f6f9fc;
    color:var(--primary);
}
.container{
    max-width:1200px;
    margin:auto;
    padding:20px;
}

/* HEADER */
header{
    position:sticky;
    top:0;
    background:rgba(255,255,255,0.9);
    backdrop-filter:blur(8px);
    border-bottom:1px solid #eee;
}
nav a{
    margin:0 10px;
    text-decoration:none;
    color:var(--primary);
    font-weight:500;
}
nav a:hover{color:var(--accent);}

/* HERO */
.hero{
    background:url('https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?auto=format&fit=crop&w=1400&q=80') center/cover;
    color:white;
    padding:80px 20px;
    text-align:center;
}
.hero h1{font-family:Poppins;font-size:40px;margin:0;}
.hero p{max-width:600px;margin:10px auto;}

/* BUTTON */
.btn{
    background:linear-gradient(135deg,#00aaff,#0077ff);
    color:white;
    border:none;
    padding:10px 20px;
    border-radius:30px;
    cursor:pointer;
}
.btn:hover{opacity:0.9}

/* GRID */
.grid{
    display:grid;
    gap:20px;
}
.categories{
    grid-template-columns:repeat(auto-fit,minmax(150px,1fr));
}
.products{
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
}

/* CATEGORY */
.cat-card{
    background:white;
    padding:20px;
    border-radius:10px;
    text-align:center;
    box-shadow:0 4px 10px rgba(0,0,0,0.05);
    transition:0.2s;
}
.cat-card:hover{
    transform:translateY(-5px);
}

/* PRODUCT */
.product{
    background:white;
    border-radius:10px;
    overflow:hidden;
    box-shadow:0 4px 12px rgba(0,0,0,0.05);
    transition:0.25s;
}
.product:hover{
    transform:translateY(-6px);
}
.product img{
    width:100%;
    height:200px;
    object-fit:cover;
}
.product-body{
    padding:12px;
}
.price{
    font-weight:bold;
}
.old{
    text-decoration:line-through;
    color:var(--muted);
    font-size:13px;
}

/* FOOTER */
footer{
    text-align:center;
    padding:20px;
    color:var(--muted);
}
</style>
</head>

<body>

<header>
<div class="container" style="display:flex;justify-content:space-between;">
<h2>Hello<span style="color:#00aaff">Shop</span></h2>
<nav>
<a href="#">Home</a>
<a href="#">Products</a>
<a href="#">Deals</a>
</nav>
</div>
</header>

<!-- HERO -->
<section class="hero">
<h1>Modern Shopping Experience</h1>
<p>Clean, fast and reliable shopping UI your clients will love.</p>
<button class="btn">Shop Now</button>
</section>

<!-- CATEGORIES -->
<div class="container">
<h2>Categories</h2>
<div class="grid categories" id="cats"></div>
</div>

<!-- PRODUCTS -->
<div class="container">
<h2>Products</h2>
<div class="grid products" id="products"></div>
</div>

<footer>© 20264 HelloShop</footer>

<script>
const CATEGORIES=["Phones","Laptops","Shoes","Accessories"];

const PRODUCTS=[
{
title:"iPhone 14 Pro",
price:1099,
old:1199,
img:"https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?auto=format&fit=crop&w=600&q=80"
},
{
title:"MacBook Pro",
price:1999,
img:"https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&w=600&q=80"
},
{
title:"Apple Watch",
price:399,
img:"https://images.unsplash.com/photo-1529374255404-311a2a4f1fd9?auto=format&fit=crop&w=600&q=80"
},
{
title:"Nike Shoes",
price:150,
img:"https://images.unsplash.com/photo-1542272604-787c3835535d?auto=format&fit=crop&w=600&q=80"
}
];

/* RENDER CATEGORIES */
const catBox=document.getElementById("cats");
CATEGORIES.forEach(c=>{
let el=document.createElement("div");
el.className="cat-card";
el.innerHTML=c;
catBox.appendChild(el);
});

/* RENDER PRODUCTS */
const prodBox=document.getElementById("products");
PRODUCTS.forEach(p=>{
let el=document.createElement("div");
el.className="product";
el.innerHTML=`
<img src="${p.img}">
<div class="product-body">
<h4>${p.title}</h4>
<div class="price">$${p.price} ${p.old?`<span class="old">$${p.old}</span>`:''}</div>
<button class="btn">Add to Cart</button>
</div>`;
prodBox.appendChild(el);
});
</script>

</body>
</html>
